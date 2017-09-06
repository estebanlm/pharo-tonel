"
SUnit tests for exceptions
"
Class {
	#name : #ExceptionTests,
	#superclass : #TestCase,
	#category : #Kernel-Tests-Exception,
	#timestamp : 'TorstenBergmann 2/5/2014 08:36'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>assertSuccess: anExceptionTester [
	self should: [ ( anExceptionTester suiteLog first) endsWith:  'succeeded'].
]

{
	#category : #testing-exceptiontester,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testDoubleOuterPass [
	self assertSuccess: (ExceptionTester new runTest: #doubleOuterPassTest ) 
]

{
	#category : #testing-exceptiontester,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testDoublePassOuter [
	self assertSuccess: (ExceptionTester new runTest: #doublePassOuterTest ) 
]

{
	#category : #testing-exceptiontester,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testDoubleResume [
	self assertSuccess: (ExceptionTester new runTest: #doubleResumeTest ) 
]

{
	#category : #testing-handling,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testHandlerContext [
	"A test ensuring that when evaluating the action block the exception environment is set to the handler context."

	| result |
	result := [ 
	[ 
	[ MyResumableTestError signal ]
		on: MyTestError
		do: [ 'handler 2' ] ]
		on: MyResumableTestError
		do: [ MyTestError signal ] ]
		on: MyTestError
		do: [ 'handler 1' ].
	self assert: 'handler 1' = result description: 'Incorrect handler'
]

{
	#category : #testing-handling,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testHandlerFromAction [
	"A test ensuring that nested exceptions work as expected."

	| result |
	result := [ 
	[ 
	[ self error: 'trigger error' ]
		on: ZeroDivide
		do: [ :ex | 'inner' ] ]
		on: Error
		do: [ :ex | 3 / 0 ] ]
		on: ZeroDivide
		do: [ :ex | 'outer' ].
	self assert: 'outer' = result description: 'Incorrect handler'
]

{
	#category : #testing-handling,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testHandlingExceptionSetWithExclusion [

	| wasHandled  |

	wasHandled := false.

	self
		should: [ 
			[ ZeroDivide signalWithDividend: 1 ]
				on: Error, ArithmeticError - ZeroDivide
				do: [ :exception | 
					wasHandled := true.
					exception return ] ]
		raise: ZeroDivide.
	
	self deny: wasHandled
]

{
	#category : #testing-handling,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testHandlingWhenThereIsSomeExclusionButDontApplies [

	| wasHandled result |

	wasHandled := false.

	result := [ 
	ZeroDivide signalWithDividend: 1.
	2 ]
		on: Error - MessageNotUnderstood
		do: [ :exception | 
			wasHandled := true.
			exception return ].

	self
		assert: wasHandled;
		assert: result isNil
]

{
	#category : #testing-handling,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testHandlingWithExclusion [

	| wasHandled  |

	wasHandled := false.

	self
		should: [ 
			[ ZeroDivide signalWithDividend: 1 ]
				on: Error - ZeroDivide
				do: [ :exception | 
					wasHandled := true.
					exception return ] ]
		raise: ZeroDivide.
	
	self deny: wasHandled
]

{
	#category : #testing-handling,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testHandlingWithSeveralExclusions [
	| wasHandled |
	wasHandled := false.
	self
		should: [ 
			[ ZeroDivide signalWithDividend: 1 ]
				on: Error - Warning - ZeroDivide
				do: [ :exception | 
					wasHandled := true.
					exception return ] ]
		raise: ZeroDivide.
	self deny: wasHandled.
	
	self
		should: [ 
			[ ZeroDivide signalWithDividend: 1 ]
				on: Error - (Warning , ZeroDivide)
				do: [ :exception | 
					wasHandled := true.
					exception return ] ]
		raise: ZeroDivide.
	self deny: wasHandled.
]

{
	#category : #testing-handling,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testHandlingWithSeveralExclusionsAndExceptionSetsHandling [

	| wasHandled result |

	wasHandled := false.

	result := [ 
	ZeroDivide signalWithDividend: 1.
	2 ]
		on: Error - MessageNotUnderstood - Warning
		do: [ :exception | 
			wasHandled := true.
			exception return ].

	self
		assert: wasHandled;
		assert: result isNil.
		
	wasHandled := false.

	result := [ 
	ZeroDivide signalWithDividend: 1.
	2 ]
		on: Error - (MessageNotUnderstood , Warning)
		do: [ :exception | 
			wasHandled := true.
			exception return ].

	self
		assert: wasHandled;
		assert: result isNil.	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testNoTimeout [
	self assertSuccess: (ExceptionTester new runTest: #simpleNoTimeoutTest ) 
]

{
	#category : #testing-exceptiontester,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testNonResumableFallOffTheEndHandler [
	self assertSuccess: (ExceptionTester new runTest: #nonResumableFallOffTheEndHandler ) 
]

{
	#category : #testing-outer,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testNonResumableOuter [

	self should: [
		[Error signal. 4] 
			on: Error 
			do: [:ex | ex outer. ex return: 5]
		] raise: Error

]

{
	#category : #testing-outer,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testNonResumablePass [

	self should: [
		[Error signal. 4] 
			on: Error 
			do: [:ex | ex pass. ex return: 5]
		] raise: Error

]

{
	#category : #testing-exceptiontester,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testResumableFallOffTheEndHandler [
	self assertSuccess: (ExceptionTester new runTest: #resumableFallOffTheEndHandler ) 
]

{
	#category : #testing-outer,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testResumableOuter [

	| result |
	result := [Notification signal. 4] 
		on: Notification 
		do: [:ex | ex outer. ex return: 5].
	self assert: result = 5

]

{
	#category : #testing-outer,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testResumablePass [

	| result |
	result := [Notification signal. 4] 
		on: Notification 
		do: [:ex | ex pass. ex return: 5].
	self assert: result = 4

]

{
	#category : #testing-exceptiontester,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testSignalFromHandlerActionTest [
	self assertSuccess: (ExceptionTester new runTest: #signalFromHandlerActionTest ) 
]

{
	#category : #testing-exceptiontester,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testSimpleEnsure [
	self assertSuccess: (ExceptionTester new runTest: #simpleEnsureTest ) 
]

{
	#category : #testing-exceptiontester,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testSimpleEnsureTestWithError [
	self assertSuccess: (ExceptionTester new runTest: #simpleEnsureTestWithError ) 
]

{
	#category : #testing-exceptiontester,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testSimpleEnsureTestWithNotification [
	self assertSuccess: (ExceptionTester new runTest: #simpleEnsureTestWithNotification ) 
]

{
	#category : #testing-exceptiontester,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testSimpleEnsureTestWithUparrow [
	self assertSuccess: (ExceptionTester new runTest: #simpleEnsureTestWithUparrow ) 
]

{
	#category : #testing-exceptiontester,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testSimpleIsNested [
	self assertSuccess: (ExceptionTester new runTest: #simpleIsNestedTest ) 
]

{
	#category : #testing-exceptiontester,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testSimpleOuter [
	self assertSuccess: (ExceptionTester new runTest: #simpleOuterTest ) 
]

{
	#category : #testing-exceptiontester,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testSimplePass [
	self assertSuccess: (ExceptionTester new runTest: #simplePassTest ) 
]

{
	#category : #testing-exceptiontester,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testSimpleResignalAs [
	self assertSuccess: (ExceptionTester new runTest: #simpleResignalAsTest ) 
]

{
	#category : #testing-exceptiontester,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testSimpleResume [
	self assertSuccess: (ExceptionTester new runTest: #simpleResumeTest ) 
]

{
	#category : #testing-exceptiontester,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testSimpleRetry [
	self assertSuccess: (ExceptionTester new runTest: #simpleRetryTest ) 
]

{
	#category : #testing-exceptiontester,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testSimpleRetryUsing [
	self assertSuccess: (ExceptionTester new runTest: #simpleRetryUsingTest ) 
]

{
	#category : #testing-exceptiontester,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testSimpleReturn [
	self assertSuccess: (ExceptionTester new runTest: #simpleReturnTest ) 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExceptionTests>>testTimeoutWithZeroDuration [
	self assertSuccess: (ExceptionTester new runTest: #simpleTimeoutWithZeroDurationTest ) 
]
