"
An EpDeferrerTest is a test class for testing the behavior of EpDeferrer
"
Class {
	#name : #OmDeferrerTest,
	#superclass : #TestCase,
	#instVars : [
		'count',
		'deferrer'
	],
	#category : #OmbuTests,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmDeferrerTest>>count [

	^ count
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmDeferrerTest>>count: anInteger  [

	count := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmDeferrerTest>>increase [

	count := count + 1
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmDeferrerTest>>testExecuteOnceAfterScheduling [

	self count: 0.
	deferrer := OmDeferrer 
		send: #increase
		to: self
		after: 250 milliSeconds.

	deferrer schedule.
	(Delay forMilliseconds: 350) wait.
	
	self assert: self count equals: 1.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmDeferrerTest>>testExecuteOnceAfterSchedulingMultipleTimes [

	self count: 0.
	deferrer := OmDeferrer 
		send: #increase
		to: self
		after: 250 milliSeconds.

	3 timesRepeat: [	
		deferrer schedule.
		(Delay forMilliseconds: 50) wait ].
	
	(Delay forMilliseconds: 350) wait.
	
	self assert: self count equals: 1.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmDeferrerTest>>testExecuteWithoutDelay [

	self count: 0.
	deferrer := OmDeferrer 
		send: #increase
		to: self
		after: 0 milliSeconds.

	deferrer schedule.

	"Just to document it needs an interruption"
	self assert: self count equals: 0.
	Processor yield.	
	self assert: self count equals: 1.
]
