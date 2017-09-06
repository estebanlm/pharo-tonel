"
MB stands for Metacello Borwser.
MBConfigurationRoot is the root object holding information on all available configurations in the image.

Instance Variables
	announcer:		<Object>
	configurations:	a collection of MBConfigurationInfo.
	password:		<Object>
	username:		<Object>

"
Class {
	#name : #MBConfigurationRoot,
	#superclass : #Object,
	#instVars : [
		'announcer',
		'configurations',
		'username',
		'password'
	],
	#classVars : [
		'Current'
	],
	#category : #Versionner-Core-Model,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot class>>current [
	"singleton pattern"
	Current ifNil: [ 
		Current := self new.
		Current register ].
	^Current 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot class>>reset [
	"self reset"
	| c |
	Current ifNil: [ ^self ].
	c := Current.
	Current := nil.
	c unregister.

]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>addConfigurationInfoFor: aConfigurationClass [
	(self configurationInfoFor: aConfigurationClass) notNil
		ifTrue: [ ^ self ].
	self configurations
		add:
			((MBConfigurationInfo configurationClass: aConfigurationClass)
				configurationRoot: self;
				yourself).
	self announcer announce: MBConfigurationInfoCreated
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>announcer [

	^announcer 
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>categoryModified: anEvent [
	"(anEvent itemClass name asString beginsWith: 'ConfigurationOf')
		ifTrue: [  self respondToEventFor: anEvent itemClass withOperation: #modified ]"
	| configName configClass configInfo |
	self flag: 'update only needed configurations'.
	"configName := 'ConfigurationOf' , (anEvent item).
	configClass := Smalltalk at: (configName asSymbol).
	configClass ifNotNilDo: [ 
		configInfo := self configurationInfoFor: configClass.
		configInfo fullRecalculate ]."
	self configurations do: [:config | config fullRecalculate ].
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>classAdded: anEvent [

	(anEvent classAdded name asString beginsWith: 'ConfigurationOf')
		ifTrue: [ self respondToEventFor: anEvent classAdded withOperation: #added ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>classModified: anEvent [

	(anEvent classAffected name asString beginsWith: 'ConfigurationOf')
		ifTrue: [ self respondToEventFor: anEvent classAffected withOperation: #modified ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>classRemoved: anEvent [

	(anEvent classRemoved originalName asString beginsWith: 'ConfigurationOf')
		ifTrue: [ self respondToEventFor: anEvent classRemoved withOperation: #removed ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>configurationClasses [
	^ MetacelloToolBox configurationClasses
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>configurationInfoFor: aConfigurationClass [

	self configurations do: [:info | info configurationClass == aConfigurationClass theNonMetaClass  ifTrue: [ ^info ]].
	^nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>configurations [
	configurations
		ifNil: [ 
			configurations := (self configurationClasses
				collect: [ :cls | 
					(MBConfigurationInfo configurationClass: cls)
						configurationRoot: self;
						yourself ]) asSortedCollection: [ :a :b | a name <= b name ] ].
	^ configurations
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>initialize [

	super initialize .
	announcer := Announcer new
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>methodModified: anEvent [

	(anEvent methodAffected class name asString beginsWith: 'ConfigurationOf')
		ifTrue: [  self respondToEventFor: anEvent methodAffected withOperation: #modified ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>password [
	^ password
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>password: anObject [
	password := anObject
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>register [
	"Set up dependencies"
	
	SystemAnnouncer uniqueInstance weak
		when: ClassAdded send: #classAdded: to: self;
		when: ClassModifiedClassDefinition,
			ClassCommented,
			ClassRenamed, 
			ClassReorganized,
			ClassRenamed send: #classModified: to: self;
		when: ClassRemoved send: #classRemoved: to: self;		
		when: MethodAdded,
			MethodModified ,
			MethodRemoved send: #methodModified: to: self.
					
	MCWorkingCopy addDependent: self.

]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>removeConfigurationInfo: aConfigurationInfo [

	aConfigurationInfo release.
	self configurations remove: aConfigurationInfo ifAbsent: [].
	self announcer announce: MBConfigurationInfoDeleted
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>respondToEventFor: aConfigurationClass withOperation: operation [
	"Events generated by SystemChangeNotifier and involve edits to the configuration itself."

	| info |
	operation == #added
		ifTrue: [ ^self addConfigurationInfoFor: aConfigurationClass ].
	(info := self configurationInfoFor: aConfigurationClass) isNil
		ifTrue: [ ^ self ].
	operation == #removed
		ifTrue: [ ^self removeConfigurationInfo: info ].
	"operation == #modified...configuration specs potentially modified"
	info configurationClassModified.
	self configurations do: [ :configInfo | configInfo recalculateIfInterestedInConfigurationInfo: info for: operation ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>unregister [
	"Unregister from the dependent object. Typically used when closing the browser"
	
	SystemAnnouncer uniqueInstance unsubscribe: self.
	MCWorkingCopy removeDependent: self.

]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>update: anArrayOrSymbol [
	"A package has been modified (loaded, removed, or updated). Find out if any configurations are managing the package.
	Update events are coming from MCWorkingCopy."

	| packageName operation |
	anArrayOrSymbol isArray
		ifFalse: [ ^ self ].
	operation := anArrayOrSymbol at: 1.
	operation == #modified
		ifTrue: [ packageName := (anArrayOrSymbol at: 2) packageName ].
	operation == #registered
		ifTrue: [ packageName := (anArrayOrSymbol at: 2) name ].
	operation == #unregistered
		ifTrue: [ packageName := (anArrayOrSymbol at: 2) name ].
	(packageName beginsWith: 'ConfigurationOf')
		ifTrue: [ 
			| wc info |
			operation ~~ #modified
				ifTrue: [ ^ self ].	"only interested in modified"
			wc := anArrayOrSymbol at: 2.
			wc modified
				ifTrue: [ ^ self ].	"only interested in transtion from modified to not modified"
			(info := self configurationInfoFor: (Smalltalk at: packageName asSymbol ifAbsent: [ ^ self ])) isNil
				ifTrue: [ ^ self ].	
			"removed and added packages handled by the add/removal of the class"
			info configurationClassModified.
			^ self ].
	self configurations do: [ :info | info recalculateIfInterestedInPackageNamed: packageName for: operation ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>username [
	^ username
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationRoot>>username: anObject [
	username := anObject
]
