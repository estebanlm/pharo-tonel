"

"
Class {
	#name : #TimeMeasuringTest,
	#superclass : #TestCase,
	#instVars : [
		'realTime',
		'shouldProfile'
	],
	#category : #Tests-Traits,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:29'
}
TimeMeasuringTest>>debug [
	self resources do: [:res | 
		res isAvailable ifFalse: [^res signalInitializationError]].
	[(self class selector: testSelector) setToDebug; runCase] 
		ensure: [self resources do: [:each | each reset]]
			
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:29'
}
TimeMeasuringTest>>initialize [
	super initialize.
	shouldProfile := false.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:29'
}
TimeMeasuringTest>>measure: measuredBlock  [
	shouldProfile 
		ifTrue: [Smalltalk tools timeProfiler onBlock: [10 timesRepeat: measuredBlock]].
	realTime := measuredBlock timeToRun
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:29'
}
TimeMeasuringTest>>openDebuggerOnFailingTestMethod [
	shouldProfile := true
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:29'
}
TimeMeasuringTest>>reportPerformance [
	| str |
	str := (MultiByteFileStream fileNamed: 'performanceReports.txt') ascii; wantsLineEndConversion: true; yourself.
	str setToEnd;
		nextPutAll: ' test: ', testSelector;
		nextPutAll: ' time: ', realTime asString; 
		nextPutAll: ' version: ', self versionInformation;
		cr; 
		close
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:29'
}
TimeMeasuringTest>>runCase [
	[super runCase] ensure: [self reportPerformance]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:29'
}
TimeMeasuringTest>>setToDebug [
	shouldProfile := true

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:29'
}
TimeMeasuringTest>>versionInfoForWorkingCopiesThat: wcPredicate  [
	^(MCWorkingCopy allManagers select: wcPredicate) inject: ''
		into: [:s :e | s , e description]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:29'
}
TimeMeasuringTest>>versionInformation [
	| wcPredicate |
	wcPredicate := self workingCopyPredicate.
	^self versionInfoForWorkingCopiesThat: wcPredicate
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:29'
}
TimeMeasuringTest>>workingCopyPredicate [
	^[:e | '*Traits*' match: e package name]
]
