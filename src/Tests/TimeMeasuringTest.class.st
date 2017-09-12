Class {
	#name : #TimeMeasuringTest,
	#superclass : #TestCase,
	#instVars : [
		'realTime',
		'shouldProfile'
	],
	#category : #Tests-Traits
}

{ #category : #'as yet unclassified' }
TimeMeasuringTest >> debug [
	self resources do: [:res | 
		res isAvailable ifFalse: [^res signalInitializationError]].
	[(self class selector: testSelector) setToDebug; runCase] 
		ensure: [self resources do: [:each | each reset]]
			
]

{ #category : #initialization }
TimeMeasuringTest >> initialize [
	super initialize.
	shouldProfile := false.
]

{ #category : #'as yet unclassified' }
TimeMeasuringTest >> measure: measuredBlock [ 
	shouldProfile 
		ifTrue: [Smalltalk tools timeProfiler onBlock: [10 timesRepeat: measuredBlock]].
	realTime := measuredBlock timeToRun
]

{ #category : #'as yet unclassified' }
TimeMeasuringTest >> openDebuggerOnFailingTestMethod [
	shouldProfile := true
]

{ #category : #'as yet unclassified' }
TimeMeasuringTest >> reportPerformance [
	| str |
	str := (MultiByteFileStream fileNamed: 'performanceReports.txt') ascii; wantsLineEndConversion: true; yourself.
	str setToEnd;
		nextPutAll: ' test: ', testSelector;
		nextPutAll: ' time: ', realTime asString; 
		nextPutAll: ' version: ', self versionInformation;
		cr; 
		close
]

{ #category : #'as yet unclassified' }
TimeMeasuringTest >> runCase [
	[super runCase] ensure: [self reportPerformance]
]

{ #category : #'as yet unclassified' }
TimeMeasuringTest >> setToDebug [
	shouldProfile := true

]

{ #category : #'as yet unclassified' }
TimeMeasuringTest >> versionInfoForWorkingCopiesThat: wcPredicate [ 
	^(MCWorkingCopy allManagers select: wcPredicate) inject: ''
		into: [:s :e | s , e description]
]

{ #category : #'as yet unclassified' }
TimeMeasuringTest >> versionInformation [
	| wcPredicate |
	wcPredicate := self workingCopyPredicate.
	^self versionInfoForWorkingCopiesThat: wcPredicate
]

{ #category : #'as yet unclassified' }
TimeMeasuringTest >> workingCopyPredicate [
	^[:e | '*Traits*' match: e package name]
]
