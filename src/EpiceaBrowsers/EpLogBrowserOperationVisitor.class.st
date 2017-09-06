"
I am an abstract superclass useful for visitors of EpLogBrowserOperation.
"
Class {
	#name : #EpLogBrowserOperationVisitor,
	#superclass : #Object,
	#instVars : [
		'environment'
	],
	#category : #EpiceaBrowsers-Visitors,
	#timestamp : 'MartinDias 10/27/2014 18:01'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationVisitor class>>inEnvironment: anEnvironment [

	^ self basicNew 
		initializeWith: anEnvironment;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationVisitor class>>new [
	^ self inEnvironment: self environment
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationVisitor>>behaviorNamed: aSymbol ifPresent: presentBlock [

	^ (environment classOrTraitNamed: aSymbol) 
		ifNil: [ self inform: 'Cannot find ', aSymbol ]
		ifNotNil: presentBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationVisitor>>compiler  [

	^ self class compiler
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLogBrowserOperationVisitor>>initializeWith: anEnvironment [

	self initialize.
	environment := anEnvironment 
]
