"
MCPackageManager is a kind of package wrapper knowing if the package is dirty or not.
The class side manages registered package managers.

Instance Variables:
	package	<MCPackage>
	modified	<Boolean>

Class Instance Variables:
	registry	<Dictionary>
"
Class {
	#name : #MCPackageManager,
	#superclass : #Model,
	#instVars : [
		'package',
		'modified'
	],
	#classVars : [
		'PrivateAnnouncer'
	],
	#classInstVars : [
		'registry'
	],
	#category : #Monticello-Versioning,
	#timestamp : 'StephaneDucasse 4/29/2011 20:42'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>allManagers [
	^ self registry values
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>announcer [
	^PrivateAnnouncer ifNil: [ SystemAnnouncer uniqueInstance  ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>announcer: anAnnouncer [
	PrivateAnnouncer := anAnnouncer
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>bestMatchingManagerForCategory: aSystemCategory do: aBlock [
	| bestMatches bestMatchingManagerAndPackage |
	bestMatches := OrderedCollection new.
	self registry do: [ :mgr |
		| candidatePackages bestMatchingPackage |
		candidatePackages := mgr packageSet packages select: [ :package |
			package name beginsWith: aSystemCategory ].
		bestMatchingPackage := candidatePackages detectMin: [ :package |
			package name size ].
		bestMatchingPackage ifNotNil: [
			bestMatches add: mgr -> bestMatchingPackage ] ].
	bestMatchingManagerAndPackage := bestMatches detectMin: [ :managerAndPackage |
			managerAndPackage value name size ].
	bestMatchingManagerAndPackage ifNotNil: [ :managerAndPackage |
		aBlock value: managerAndPackage key ]
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>classModified: anEvent [
	self 
		managersForClass: anEvent classAffected 
		do:[ :mgr | mgr modified: true ].
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>classMoved: anEvent [
	self managersForPackage: anEvent oldPackage do: [ :mgr | mgr modified: true ].
	self managersForPackage: anEvent newPackage do: [ :mgr | mgr modified: true ].
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>classRemoved: anEvent [
	"Informs the registry who use to keep this class that its changed. Unlike #classModified:, class is not anymore in RPackages so it will not be found, that's why we look for system category instead if class is included or not"

	"Note. Class protocols returns symbols and not Protocol instances!"
	(RPackageOrganizer default
		packageMatchingExtensionName: anEvent categoryName) ifNotNil: [ :package |
			package mcWorkingCopy ifNotNil: [ :workingCopy | workingCopy modified: true ] ].
		
	anEvent classAffected protocols, anEvent classAffected theMetaClass protocols
		do: [ :aProtocolName | 
			(aProtocolName beginsWith: '*')
				ifTrue:
					[ (RPackageOrganizer default
						packageMatchingExtensionName: aProtocolName allButFirst trimBoth)
							ifNotNil: [ :package |
								package mcWorkingCopy ifNotNil: [ :workingCopy |
									workingCopy modified: true ] ] ] ]
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>classRenamed: anEvent [
	self classModified: anEvent.
	anEvent classAffected extendingPackages
		do: [ :pkg | self managersForPackage: pkg do: [ :mgr | mgr modified: true ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>forPackage: aPackage [
	^ self registry 
		at: aPackage 
		ifAbsent: [|mgr|
			mgr := self new initializeWithPackage: aPackage.
			self registry at: aPackage put: mgr.
			self announcer announce: (MCWorkingCopyCreated workingCopy: mgr package: aPackage).
			mgr ]
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>initialize [
	"Remove this later"

	self unregisterForNotifications.
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>managersForCategory: aSystemCategory do: aBlock [
	"Got to be careful here - we might get method categories where capitalization is problematic."
	| cat foundOne index |
	foundOne := false.
	cat := aSystemCategory ifNil:[^nil]. "yes this happens; for example in eToy projects"
	"first ask PackageInfos, their package name might not match the category"
	self
		bestMatchingManagerForCategory: aSystemCategory
		do: [ :mgr |
			aBlock value: mgr.
			foundOne := true ].

   foundOne ifTrue: [^self].
	["Loop over categories until we found a matching one"
	self registry at: (MCPackage named: cat) ifPresent:[:mgr|
		aBlock value: mgr.
		foundOne := true.
	].
	index := cat lastIndexOf: $-.
	index > 0]whileTrue:[
		"Step up to next level package"
		cat := cat copyFrom: 1 to: index-1.
	].
	foundOne ifFalse:[
		"Create a new (but only top-level)"
		aBlock value: (MCWorkingCopy forPackage: (MCPackage named: aSystemCategory capitalized)).
	].
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>managersForClass: aClass category: methodCategory do: aBlock [
	(methodCategory isEmptyOrNil or:[methodCategory first ~= $*]) ifTrue:[
		"Not an extension method"
		^self managersForClass: aClass do: aBlock.
	].
	self managersForCategory: methodCategory allButFirst do: aBlock.
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>managersForClass: aClass do: aBlock [

	self registry do: [:mgr |
		(mgr packageSet includesClass: aClass)
			ifTrue: [aBlock value: mgr]]
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>managersForClass: aClass selector: aSelector do: aBlock [
	^self managersForClass: aClass category: (aClass organization categoryOfElement: aSelector) do: aBlock
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>managersForPackage: aPackage do: aBlock [
	self registry do: [:mgr | 
		(mgr packageSet includesSystemCategory: aPackage name) ifTrue: [
			aBlock value: mgr.
		]
	].
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>methodModified: anEvent [

   "trait methods aren't handled here"
	anEvent isProvidedByATrait
		ifTrue: [ ^ self ].
		
	^ self
		managersForClass: anEvent methodClass
		selector: anEvent selector
		do: [ :mgr | mgr modified: true ]
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>methodMoved: anEvent [
	self managersForPackage: anEvent oldPackage do: [ :mgr | mgr modified: true ].
	self managersForPackage: anEvent newPackage do: [ :mgr | mgr modified: true ].
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>methodRemoved: anEvent [
	self managersForClass: anEvent methodClass category: anEvent protocol do:[:mgr| mgr modified: true].

]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>packageRenamed: anAnnouncement [
	self allManagers 
		detect: [ :each | each packageName = anAnnouncement newName ]
		ifFound: [ :newPackage | newPackage modified: true ].
	(self allManagers 
		detect: [ :each | each packageName = anAnnouncement oldName ])
		unload.
]

{
	#category : #'event registration',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>registerInterestOnSystemChangesOnAnnouncer: anAnnouncer [
	anAnnouncer weak
		when: RPackageRenamed send: #packageRenamed: to: self;
		when: ClassAdded, ClassModifiedClassDefinition, ClassCommented , ClassParentRenamed send: #classModified: to: self;
		when: ClassRenamed send:#classRenamed: to:self;
		when: ClassRepackaged send: #classMoved: to: self;
		when: ClassRemoved send: #classRemoved: to: self;
		when: MethodAdded, MethodModified, MethodRecategorized send: #methodModified: to: self;
		when: MethodRepackaged send: #methodMoved: to: self;
		when: MethodRemoved send: #methodRemoved: to: self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>registry [
	^ registry ifNil: [registry := Dictionary new]
]

{
	#category : #'event registration',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager class>>unregisterForNotifications [
	SystemAnnouncer uniqueInstance unsubscribe: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager>>announcer [
	^self class announcer
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager>>initialize [
	super initialize.
	modified := false.

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager>>initializeWithPackage: aPackage [
	package := aPackage.
	self initialize.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager>>modified [
	^ modified
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager>>modified: aBoolean [
	modified = aBoolean
		ifTrue: [ ^ self ].
	modified := aBoolean.
	self changed: #modified.
	modified
		ifFalse: [ 
			ChangesLog default logChange: '"' , self packageName , '"' ].
	self announcer announce: (MCPackageModified package: self package)
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager>>package [
	^ package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager>>packageName [
	^ package name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager>>packageNameWithStar [
	^ modified
		ifTrue: ['* ', self packageName]
		ifFalse: [self packageName]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager>>packageSet [
	^ package packageSet
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPackageManager>>unregister [
	self class registry 
		removeKey: package
		ifAbsent: [ ^ self ].
	self class changed: (Array with: #unregistered with: package).
	self announcer announce: (MCWorkingCopyDeleted workingCopy: self package: package)
]
