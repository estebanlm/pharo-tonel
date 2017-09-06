"
A MBAbstractInfoList is an abstraction used to hold information on groups, packages and projects.

Instance Variables
	groups:		a list of groups (MBGroupInfo instances)
	infoList:		<Object>
	packages:		<Object>
	projects:		<Object>

"
Class {
	#name : #MBAbstractInfoList,
	#superclass : #MBInfo,
	#instVars : [
		'packages',
		'projects',
		'groups',
		'infoList'
	],
	#category : #Versionner-Core-Model,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractInfoList>>calculateInfoList [

	^self subclassResponsibility 
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractInfoList>>fullRecalculate [

	self recalculate
]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractInfoList>>groups [
	"Return the list of groups for the configuration"

	| groupSpecs |
	groups ~~ nil
		ifTrue: [ ^ groups ].
	groups := OrderedCollection new.
	self versionForInfoList ifNil: [ ^ groups ].
	groupSpecs := self versionForInfoList groups.
	groupSpecs := groupSpecs asSortedCollection: [ :a :b | a name <= b name ].
	groups
		addAll:
			(groupSpecs
				collect: [ :grpSpec | 
					(MBGroupInfo spec: grpSpec)
						configurationInfo: self configurationInfo;
						yourself ]).
	^ groups
]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractInfoList>>infoList [
	infoList ~~ nil ifTrue: [ ^infoList ].
	^ infoList := self calculateInfoList
]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractInfoList>>infos [
	"Return the list of info that are displayed"
	^self infoList
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractInfoList>>interestedInPackage: operation [
	"potential currentVersion change"
	
	self fullRecalculate.
	^true
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractInfoList>>interestedInPackageNamed: packageName [
	packages notNil
		ifTrue: [ 
			(self packages detect: [ :info | info interestedInPackageNamed: packageName ] ifNone: [  ]) notNil
				ifTrue: [ ^ true ] ].
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractInfoList>>isDirty [
	^ self packages anySatisfy: [:each | each isDirty ]
]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractInfoList>>packages [
	"Return the list of dependent packages for the last baseline"

	| packageSpecs |
	packages ~~ nil
		ifTrue: [ ^ packages ].
	self versionForInfoList ifNil: [ ^ #() ].
	packages := OrderedCollection new.
	packageSpecs := self versionForInfoList packages.
	packageSpecs := packageSpecs asSortedCollection: [ :a :b | a name <= b name ].
	packages
		addAll:
			(packageSpecs
				collect: [ :pkgSpec | 
					| packageName |
					(packageName := pkgSpec getFile) ifNil: [ packageName := pkgSpec name asString ].
					(MBPackageInfo named: packageName packageName: pkgSpec name asString spec: pkgSpec)
						configurationInfo: self configurationInfo;
						yourself ]).
	^ packages
]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractInfoList>>projects [
	"Return the list of dependent packages for the last baseline"

	| projectSpecs |
	projects
		ifNotNil: [ ^ projects ].
	projects := OrderedCollection new.
	self versionForInfoList ifNil: [ ^ projects ].
	projectSpecs := self versionForInfoList projects.
	projectSpecs := projectSpecs asSortedCollection: [ :a :b | a name <= b name ].
	projects
		addAll:
			(projectSpecs
				collect: [ :prjSpec | 
					(MBProjectInfo named: prjSpec name packageName: prjSpec projectPackage name spec: prjSpec)
						configurationInfo: self configurationInfo;
						yourself ]).
	^ projects
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractInfoList>>recalculate [

	text := groups := validationResult := validationIcon := projects:= packages := nil.
	infoList == nil ifTrue: [ ^self ].
	self announcer announce: (MBInfoListChanged changed: self).
	infoList := nil
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractInfoList>>recalculateIfInterestedInPackageNamed: packageName for: operation [
	"keep projects separate, since I'm the only one interested in projects."
	(self interestedInPackageNamed: packageName)
		ifTrue: [ ^self interestedInPackage: operation ].
	projects notNil
		ifTrue: [ 
			(self projects detect: [ :info | info interestedInPackageNamed: packageName ] ifNone: [  ]) notNil
				ifTrue: [ ^self interestedInPackage: operation ] ].
	^false
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractInfoList>>release [

	packages := projects := groups := infoList := nil.
	super release.	
]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractInfoList>>versionForInfoList [

	^self subclassResponsibility 
]
