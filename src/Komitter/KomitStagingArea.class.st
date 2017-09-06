"
I encapsulate the context just before a commit.
"
Class {
	#name : #KomitStagingArea,
	#superclass : #Object,
	#instVars : [
		'packages',
		'filterBlock'
	],
	#classInstVars : [
		'current'
	],
	#category : #Komitter-Models,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitStagingArea class>>current [

	^ self currentFilteredBy: [ true ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitStagingArea class>>currentFilteredBy: aFilterBlock [

	^ super new
		filterBlock: aFilterBlock;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitStagingArea class>>new [

	self shouldNotImplement
]

{
	#category : #release,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitStagingArea class>>resetCurrent [

	current := nil
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitStagingArea>>addPackage: aPackage [

	(packages includes: aPackage)
		ifFalse: [ packages add: aPackage ]
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitStagingArea>>filterBlock [

	^ filterBlock
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitStagingArea>>filterBlock: aFilterBlock [

	filterBlock := aFilterBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitStagingArea>>flush [

	packages := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitStagingArea>>initializePackages  [

	packages := MCWorkingCopy allManagers
		select: [ :workingCopy | workingCopy needsSaving and: (filterBlock cull: workingCopy) ]
		thenCollect: [ :workingCopy | 
			(KomitPackage package: workingCopy package)
				yourself ].
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitStagingArea>>isCurrent [

	^ self == self class current
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitStagingArea>>packages [

	packages ifNil: [ self initializePackages ].
	^ packages copy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitStagingArea>>packages: aCollection [

	packages := aCollection asOrderedCollection
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitStagingArea>>remotes [
	| result |
	
	self packages ifEmpty: [ ^ #() ].
	self packages ifEmpty: [ ^ #() ].
	result := self packages first remotes.
	self packages allButFirst do: [ :each |
		result := result intersection: each remotes ].
	
	^ result collect: [ :each | each koRemote ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitStagingArea>>remotesFor: aCollection [
	| result |
	
	result := aCollection first remotes.
	aCollection allButFirst do: [ :each |
		result := result intersection: each remotes ].
	
	^ result collect: [ :each | each koRemote ]
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitStagingArea>>removePackage: aKomitPackage [

	self packages 	
		remove: aKomitPackage
]
