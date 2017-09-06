"
The CommandLineArguments represents the arguments passed to the image.
In the following case,

	$PHARO_VM myImage.image --foo bar
	
`CommandLineArguments default` contains {'--foo'. 'bar'}.
"
Class {
	#name : #CommandLineArguments,
	#superclass : #Object,
	#instVars : [
		'arguments'
	],
	#classInstVars : [
		'singleton'
	],
	#category : #System-BasicCommandLineHandler,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments class>>default [
	^ singleton ifNil: [singleton := self new initialize]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments class>>withArguments: aCollection [
	^ self basicNew 
		initializeWithArguments: aCollection;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>allFilesWithExtension: anExtension [
	^ self arguments select: [ :arg|
		arg endsWith: anExtension ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>argumentAt: index [
	^ arguments at: index 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>arguments [
	^ arguments
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>commandLineArguments [
	"self commandLineArguments"
	
	| documentPath args |
	
	args := OrderedCollection withAll: Smalltalk arguments.
	documentPath := Smalltalk vm documentPath.
	documentPath isEmptyOrNil
		ifFalse: [ args addFirst: documentPath ].
 	^ args.
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>copySubcommand [
	"return a new copy of this CommandLine without the first arguments"
	^ self class withArguments: arguments allButFirst
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>hasArguments [
	^ arguments size > 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>hasFileWithExtension: aFileExtension [
	"return true if the first argument has the given file extension"
	^ self arguments anySatisfy: [ :arg| 
		arg endsWith: aFileExtension].
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>hasOption: aString [
	| option |
	option := (aString size = 1
					ifTrue: [ '-']
					ifFalse: [ '--']), aString.
	(self arguments includes: option) ifTrue: [ ^ true ].
	option := option,'='.
	^ self arguments anySatisfy: [ :arg| arg beginsWith: option ].
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>includesSubCommand: aName [
	self withFirstArgument: [ :arg|
		arg = aName ifTrue: [ ^ true ]].
	^ false
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>initialize [
	
	| documentPath  |
	
	arguments := OrderedCollection withAll: Smalltalk arguments.
	documentPath := Smalltalk vm documentPath.
	documentPath isEmptyOrNil
		ifFalse: [ arguments addFirst: documentPath ].
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>initializeWithArguments: aCollection [
	super initialize.
	arguments := aCollection.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>longOptionAt: aString [
	^ self longOptionAt: aString ifAbsent: [
		Error signal: 'Could not find long-form option: ', aString  ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>longOptionAt: aString ifAbsent: absentBlock [
	| optionStart |
	optionStart := '--' , aString , '='.
	^ self arguments
		detect: [ :arg | arg beginsWith: optionStart ]
		ifFound: [ :option | (option splitOn: '=') second ]
		ifNone: absentBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>optionAt: aString [
	^ self optionAt: aString ifAbsent: [
		Error signal: 'Could not find option ', aString ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>optionAt: aString ifAbsent: absentBlock [
	^ (aString size = 1)
		ifTrue: [ self shortOptionAt: aString ifAbsent: absentBlock ]
		ifFalse: [ self longOptionAt: aString ifAbsent: absentBlock ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>optionAt: aString ifPresent: presentBlock [
	| option |
	
	option := self optionAt: aString ifAbsent: [ ^ self ].
	^ presentBlock value: option
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>optionAt: aString ifPresent: presentBlock ifAbsent: absentBlock [
	| option |
	option := self optionAt: aString ifAbsent: [ ^ absentBlock value ].
	^ presentBlock value: option
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>shortOptionAt: aString [
	^ self shortOptionAt: aString ifAbsent: [
		Error signal: 'Could not find short-form option: ', aString  ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>shortOptionAt: aString ifAbsent: absentBlock [
	| index |
	index := (arguments indexOf: '-', aString) + 1.
	^ (index <= 1 or: [ index > arguments size ])
		ifFalse: [ arguments at: index ]
		ifTrue: absentBlock
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:46'
}
CommandLineArguments>>withFirstArgument: aBlock [
	self arguments ifEmpty: [ ^ self ].
	^ aBlock value: self arguments first
]
