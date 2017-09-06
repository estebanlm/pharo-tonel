"
Utility class to test exceptions
"
Class {
	#name : #ExceptionTester,
	#superclass : #Object,
	#instVars : [
		'log',
		'suiteLog',
		'iterationsBeforeTimeout'
	],
	#category : #Kernel-Tests-Exception,
	#timestamp : 'TorstenBergmann 2/5/2014 08:36'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>basicANSISignaledExceptionTestSelectors [

	^#( simpleIsNestedTest simpleOuterTest doubleOuterTest doubleOuterPassTest doublePassOuterTest simplePassTest simpleResignalAsTest simpleResumeTest simpleRetryTest simpleRetryUsingTest simpleReturnTest)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>basicTestSelectors [
	^ #(#simpleEnsureTest #simpleEnsureTestWithNotification #simpleEnsureTestWithUparrow #simpleEnsureTestWithError #signalFromHandlerActionTest #resumableFallOffTheEndHandler #nonResumableFallOffTheEndHandler #doubleResumeTest #simpleTimeoutWithZeroDurationTest #simpleTimeoutTest simpleNoTimeoutTest)
]

{
	#category : #logging,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>clearLog [

	log := nil
]

{
	#category : #logging,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>contents [

	^( self log
		inject: (String new: 80) writeStream
		into: 
			[:result :item |
			result 
				cr; 
				nextPutAll: item;
				yourself] ) contents
]

{
	#category : #'pseudo actions',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>doSomething [

	self log: self doSomethingString
]

{
	#category : #'pseudo actions',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>doSomethingElse [

	self log: self doSomethingElseString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>doSomethingElseString [

	^'Do something else.'
]

{
	#category : #'pseudo actions',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>doSomethingExceptional [

	self log: self doSomethingExceptionalString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>doSomethingExceptionalString [

	^'Do something exceptional.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>doSomethingString [

	^'Do something.'
]

{
	#category : #'pseudo actions',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>doYetAnotherThing [

	self log: self doYetAnotherThingString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>doYetAnotherThingString [

	^'Do yet another thing.'
]

{
	#category : #'signaledexception tests',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>doubleOuterPassTest [
	"uses #resume"

	[[[self doSomething.
	MyTestNotification signal.
	self doSomethingExceptional]
		on: MyTestNotification
		do: [:ex | ex outer.
			self doSomethingElse]]
			on: MyTestNotification
			do: [:ex | ex pass.
				self doSomethingExceptional]]
				on: MyTestNotification
				do: [:ex | self doYetAnotherThing. ex resume]
]

{
	#category : #'signaledexception results',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>doubleOuterPassTestResults [

	^OrderedCollection new
		add: self doSomethingString;
		add: self doYetAnotherThingString;
		add: self doSomethingElseString;
		yourself
]

{
	#category : #'signaledexception tests',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>doubleOuterTest [
	"uses #resume"

	[[[self doSomething.
	MyTestNotification signal.
	self doSomethingExceptional]
		on: MyTestNotification
		do: [:ex | ex outer.
			self doSomethingExceptional]]
			on: MyTestNotification
			do: [:ex | ex outer.
				self doSomethingElse]]
				on: MyTestNotification
				do: [:ex | self doYetAnotherThing. ex resume]
]

{
	#category : #'signaledexception tests',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>doublePassOuterTest [
	"uses #resume"

	[[[self doSomething.
	MyTestNotification signal.
	self doSomethingExceptional]
		on: MyTestNotification
		do: [:ex | ex pass.
			self doSomethingExceptional]]
			on: MyTestNotification
			do: [:ex | ex outer.
				self doSomethingElse]]
				on: MyTestNotification
				do: [:ex | self doYetAnotherThing. ex resume]
]

{
	#category : #'signaledexception results',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>doublePassOuterTestResults [

	^OrderedCollection new
		add: self doSomethingString;
		add: self doYetAnotherThingString;
		add: self doSomethingElseString;
		yourself
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>doubleResumeTest [

       [self doSomething.
       MyResumableTestError signal.
       self doSomethingElse.
       MyResumableTestError signal.
       self doYetAnotherThing]
               on: MyResumableTestError
               do: [:ex | ex resume].
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>doubleResumeTestResults [

       ^OrderedCollection new
               add: self doSomethingString;
               add: self doSomethingElseString;
               add: self doYetAnotherThingString;
               yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>iterationsBeforeTimeout [

	^ iterationsBeforeTimeout
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>iterationsBeforeTimeout: anInteger [

	iterationsBeforeTimeout := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>log [

	log == nil
		ifTrue: [log := OrderedCollection new].
	^log
]

{
	#category : #logging,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>log: aString [

	self log add: aString
]

{
	#category : #logging,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>logTest: aSelector [

	self suiteLog add: aSelector
]

{
	#category : #logging,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>logTestResult: aString [

	| index |
	index := self suiteLog size.
	self suiteLog 
		at: index
		put: ((self suiteLog at: index), ' ', aString)
]

{
	#category : #'pseudo actions',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>methodWithError [

	MyTestError signal: self testString
]

{
	#category : #'pseudo actions',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>methodWithNotification [

	MyTestNotification signal: self testString
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>nonResumableFallOffTheEndHandler [
	
	[self doSomething.
	MyTestError signal.
	self doSomethingElse]
		on: MyTestError
		do: [:ex | self doSomethingExceptional].
	self doYetAnotherThing
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>nonResumableFallOffTheEndHandlerResults [

	^OrderedCollection new
		add: self doSomethingString;
		add: self doSomethingExceptionalString;
		add: self doYetAnotherThingString;
		yourself
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>resumableFallOffTheEndHandler [

	[self doSomething.
	MyTestNotification signal.
	self doSomethingElse]
		on: MyTestNotification
		do: [:ex | self doSomethingExceptional].
	self doYetAnotherThing
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>resumableFallOffTheEndHandlerResults [

	^OrderedCollection new
		add: self doSomethingString;
		add: self doSomethingExceptionalString;
		add: self doYetAnotherThingString;
		yourself
]

{
	#category : #suites,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>runAllTests [
	"ExceptionTester new runAllTests"

	self
		runBasicTests;
		runBasicANSISignaledExceptionTests
]

{
	#category : #suites,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>runBasicANSISignaledExceptionTests [

	self basicANSISignaledExceptionTestSelectors
		do:
			[:eachTestSelector |
			self runTest: eachTestSelector]
]

{
	#category : #suites,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>runBasicTests [

	self basicTestSelectors
		do:
			[:eachTestSelector |
			self runTest: eachTestSelector]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>runTest: aSelector [

	| actualResult expectedResult |
	[ self 
		logTest: aSelector;
		clearLog;
		perform: aSelector ]
			on: MyTestError do: 
				[ :ex | self log: 'Unhandled Exception'.
					ex return: nil ].

	actualResult	:= self log.
	expectedResult := self perform: (aSelector, #Results) asSymbol.

	actualResult = expectedResult
		ifTrue: [self logTestResult: 'succeeded']
		ifFalse: [self logTestResult: 'failed' ].

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>signalFromHandlerActionTest [

	[self doSomething.
	MyTestError signal.
	self doSomethingElse]
		on: MyTestError
		do:
			[self doYetAnotherThing.
			MyTestError signal]
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>signalFromHandlerActionTestResults [

	^OrderedCollection new
		add: self doSomethingString;
		add: self doYetAnotherThingString;
		add: 'Unhandled Exception';
		yourself
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleEnsureTest [

	[self doSomething.
	self doSomethingElse]
		ensure:
			[self doYetAnotherThing].
	
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleEnsureTestResults [

	^OrderedCollection new
		add: self doSomethingString;
		add: self doSomethingElseString;
		add: self doYetAnotherThingString;
		yourself
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleEnsureTestWithError [

	[self doSomething.
	MyTestError signal.
	self doSomethingElse]
		ensure:
			[self doYetAnotherThing].
	
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleEnsureTestWithErrorResults [

	^OrderedCollection new
		add: self doSomethingString;
		add: 'Unhandled Exception';
		add: self doYetAnotherThingString;
		yourself
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleEnsureTestWithNotification [

	[self doSomething.
	self methodWithNotification.
	self doSomethingElse]
		ensure:
			[self doYetAnotherThing].
	
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleEnsureTestWithNotificationResults [

	^OrderedCollection new
		add: self doSomethingString;
		add: self doSomethingElseString;
		add: self doYetAnotherThingString;
		yourself
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleEnsureTestWithUparrow [

	[self doSomething.
	true ifTrue: [^nil].
	self doSomethingElse]
		ensure:
			[self doYetAnotherThing].
	
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleEnsureTestWithUparrowResults [

	^OrderedCollection new
		add: self doSomethingString;
"		add: self doSomethingElseString;"
		add: self doYetAnotherThingString;
		yourself
]

{
	#category : #'signaledexception tests',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleIsNestedTest [
	"uses resignalAs:"

	[ self doSomething.
	MyTestError signal.
	self doSomethingElse 
	] on: MyTestError do: [ :exception |
		"expecting to detect handler in #runTest:"
		exception isNested 
			ifTrue: [
				self doYetAnotherThing.
				exception resignalAs: MyTestNotification new ]]
]

{
	#category : #'signaledexception results',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleIsNestedTestResults [

	^OrderedCollection new
		add: self doSomethingString;
		add: self doYetAnotherThingString;
		add: self doSomethingElseString;
		yourself
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleNoTimeoutTest [

	[ self doSomething ]
		valueWithin: 1 day onTimeout:
			[ self doSomethingElse ].
	
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleNoTimeoutTestResults [

	^OrderedCollection new
		add: self doSomethingString;
		yourself
]

{
	#category : #'signaledexception tests',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleOuterTest [
	"uses #resume"

	[[self doSomething.
	MyTestNotification signal.
	"self doSomethingElse"
	self doSomethingExceptional]
		on: MyTestNotification
		do: [:ex | ex outer. self doSomethingElse]]
				on: MyTestNotification
				do: [:ex | self doYetAnotherThing. ex resume]
]

{
	#category : #'signaledexception results',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleOuterTestResults [

	^OrderedCollection new
		add: self doSomethingString;
		add: self doYetAnotherThingString;
		add: self doSomethingElseString;
		yourself
]

{
	#category : #'signaledexception tests',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simplePassTest [

	[self doSomething.
	MyTestError signal.
	self doSomethingElse]
		on: MyTestError
		do:
			[:ex |
			self doYetAnotherThing.
			ex pass "expecting handler in #runTest:"]
]

{
	#category : #'signaledexception results',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simplePassTestResults [

	^OrderedCollection new
		add: self doSomethingString;
		add: self doYetAnotherThingString;
		add: 'Unhandled Exception';
		yourself
]

{
	#category : #'signaledexception tests',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleResignalAsTest [
	"ExceptionTester new simpleResignalAsTest"

	[self doSomething.
	MyTestNotification signal.
	self doSomethingElse]
		on: MyTestNotification
		do:
			[:ex | ex resignalAs: MyTestError new]
]

{
	#category : #'signaledexception results',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleResignalAsTestResults [

	^OrderedCollection new
		add: self doSomethingString;
		add: 'Unhandled Exception';
		yourself
]

{
	#category : #'signaledexception tests',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleResumeTest [

	"see if we can resume twice"

	
	[ | it |self doSomething.
	it := MyResumableTestError signal.
	it = 3 ifTrue: [self doSomethingElse].
	it := MyResumableTestError signal.
	it = 3 ifTrue: [self doSomethingElse].
	]
		on: MyResumableTestError
		do:
			[:ex |
			self doYetAnotherThing.
			ex resume: 3]
]

{
	#category : #'signaledexception results',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleResumeTestResults [

	"see if we can resume twice"

	^OrderedCollection new
			add: self doSomethingString;
			add: self doYetAnotherThingString;
			add: self doSomethingElseString;
			add: self doYetAnotherThingString;
			add: self doSomethingElseString;
			yourself
]

{
	#category : #'signaledexception tests',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleRetryTest [

	| theMeaningOfLife |
	theMeaningOfLife := nil.
	[self doSomething.
	theMeaningOfLife == nil
		ifTrue: [MyTestError signal]
		ifFalse: [self doSomethingElse]]
			on: MyTestError
			do:
				[:ex |
				theMeaningOfLife := 42.
				self doYetAnotherThing.
				ex retry]
]

{
	#category : #'signaledexception results',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleRetryTestResults [

	^OrderedCollection new
			add: self doSomethingString;
			add: self doYetAnotherThingString;
			add: self doSomethingString;
			add: self doSomethingElseString;
			yourself
]

{
	#category : #'signaledexception tests',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleRetryUsingTest [

	[self doSomething.
	MyTestError signal.
	self doSomethingElse]
		on: MyTestError
		do:
			[:ex | ex retryUsing: [self doYetAnotherThing]]
]

{
	#category : #'signaledexception results',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleRetryUsingTestResults [

	^OrderedCollection new
			add: self doSomethingString;
			add: self doYetAnotherThingString;
			yourself
]

{
	#category : #'signaledexception tests',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleReturnTest [

	| it |
	it :=
		[self doSomething.
		MyTestError signal.
		self doSomethingElse]
			on: MyTestError
			do: [:ex | ex return: 3].
	it = 3 ifTrue: [self doYetAnotherThing]
]

{
	#category : #'signaledexception results',
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleReturnTestResults [

	^OrderedCollection new
		add: self doSomethingString;
		add: self doYetAnotherThingString;
		yourself
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleTimeoutTest [

	| n |
	[1 to: 1000000 do: [ :i | n := i. self doSomething ] ]
		valueWithin: 50 milliSeconds onTimeout:
			[ self iterationsBeforeTimeout: n.
			self doSomethingElse ]
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleTimeoutTestResults [

	| things |
	things := OrderedCollection new: self iterationsBeforeTimeout.

	self iterationsBeforeTimeout timesRepeat: [ things add: self  doSomethingString ].
	things add: self doSomethingElseString.

	^ things
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleTimeoutWithZeroDurationTest [

	[ self doSomething ]
		valueWithin: 0 seconds onTimeout:
			[ self doSomethingElse ].
	
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>simpleTimeoutWithZeroDurationTestResults [

	^OrderedCollection new
		add: self doSomethingElseString;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>suiteLog [

	suiteLog == nil
		ifTrue: [suiteLog := OrderedCollection new].
	^suiteLog
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>testString [

	^'This is only a test.'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTester>>warningTest [

	self log: 'About to signal warning.'.
	Warning signal: 'Ouch'.
	self log: 'Warning signal handled and resumed.'
]
