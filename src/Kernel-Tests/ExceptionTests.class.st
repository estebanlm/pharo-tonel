"
SUnit tests for exceptions
"
Class {
	#name : #ExceptionTests,
	#superclass : #TestCase,
	#category : #Kernel-Tests-Exception
}

{ #category : #private }
ExceptionTests >> assertSuccess: anExceptionTester [
	self should: [ ( anExceptionTester suiteLog first) endsWith:  'succeeded'].
]

{ #category : #testing-exceptiontester }
ExceptionTests >> testDoubleOuterPass [
	self assertSuccess: (ExceptionTester new runTest: #doubleOuterPassTest ) 
]

{ #category : #testing-exceptiontester }
ExceptionTests >> testDoublePassOuter [
	self assertSuccess: (ExceptionTester new runTest: #doublePassOuterTest ) 
]

{ #category : #testing-exceptiontester }
ExceptionTests >> testDoubleResume [
	self assertSuccess: (ExceptionTester new runTest: #doubleResumeTest ) 
]

{ #category : #testing-handling }
ExceptionTests >> testHandlerContext [
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

{ #category : #testing-handling }
ExceptionTests >> testHandlerFromAction [
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

{ #category : #testing-handling }
ExceptionTests >> testHandlingExceptionSetWithExclusion [

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

{ #category : #testing-handling }
ExceptionTests >> testHandlingWhenThereIsSomeExclusionButDontApplies [

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

{ #category : #testing-handling }
ExceptionTests >> testHandlingWithExclusion [

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

{ #category : #testing-handling }
ExceptionTests >> testHandlingWithSeveralExclusions [
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

{ #category : #testing-handling }
ExceptionTests >> testHandlingWithSeveralExclusionsAndExceptionSetsHandling [

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

{ #category : #testing }
ExceptionTests >> testNoTimeout [
	self assertSuccess: (ExceptionTester new runTest: #simpleNoTimeoutTest ) 
]

{ #category : #testing-exceptiontester }
ExceptionTests >> testNonResumableFallOffTheEndHandler [
	self assertSuccess: (ExceptionTester new runTest: #nonResumableFallOffTheEndHandler ) 
]

{ #category : #testing-outer }
ExceptionTests >> testNonResumableOuter [

	self should: [
		[Error signal. 4] 
			on: Error 
			do: [:ex | ex outer. ex return: 5]
		] raise: Error

]

{ #category : #testing-outer }
ExceptionTests >> testNonResumablePass [

	self should: [
		[Error signal. 4] 
			on: Error 
			do: [:ex | ex pass. ex return: 5]
		] raise: Error

]

{ #category : #testing-exceptiontester }
ExceptionTests >> testResumableFallOffTheEndHandler [
	self assertSuccess: (ExceptionTester new runTest: #resumableFallOffTheEndHandler ) 
]

{ #category : #testing-outer }
ExceptionTests >> testResumableOuter [

	| result |
	result := [Notification signal. 4] 
		on: Notification 
		do: [:ex | ex outer. ex return: 5].
	self assert: result = 5

]

{ #category : #testing-outer }
ExceptionTests >> testResumablePass [

	| result |
	result := [Notification signal. 4] 
		on: Notification 
		do: [:ex | ex pass. ex return: 5].
	self assert: result = 4

]

{ #category : #testing-exceptiontester }
ExceptionTests >> testSignalFromHandlerActionTest [
	self assertSuccess: (ExceptionTester new runTest: #signalFromHandlerActionTest ) 
]

{ #category : #testing-exceptiontester }
ExceptionTests >> testSimpleEnsure [
	self assertSuccess: (ExceptionTester new runTest: #simpleEnsureTest ) 
]

{ #category : #testing-exceptiontester }
ExceptionTests >> testSimpleEnsureTestWithError [
	self assertSuccess: (ExceptionTester new runTest: #simpleEnsureTestWithError ) 
]

{ #category : #testing-exceptiontester }
ExceptionTests >> testSimpleEnsureTestWithNotification [
	self assertSuccess: (ExceptionTester new runTest: #simpleEnsureTestWithNotification ) 
]

{ #category : #testing-exceptiontester }
ExceptionTests >> testSimpleEnsureTestWithUparrow [
	self assertSuccess: (ExceptionTester new runTest: #simpleEnsureTestWithUparrow ) 
]

{ #category : #testing-exceptiontester }
ExceptionTests >> testSimpleIsNested [
	self assertSuccess: (ExceptionTester new runTest: #simpleIsNestedTest ) 
]

{ #category : #testing-exceptiontester }
ExceptionTests >> testSimpleOuter [
	self assertSuccess: (ExceptionTester new runTest: #simpleOuterTest ) 
]

{ #category : #testing-exceptiontester }
ExceptionTests >> testSimplePass [
	self assertSuccess: (ExceptionTester new runTest: #simplePassTest ) 
]

{ #category : #testing-exceptiontester }
ExceptionTests >> testSimpleResignalAs [
	self assertSuccess: (ExceptionTester new runTest: #simpleResignalAsTest ) 
]

{ #category : #testing-exceptiontester }
ExceptionTests >> testSimpleResume [
	self assertSuccess: (ExceptionTester new runTest: #simpleResumeTest ) 
]

{ #category : #testing-exceptiontester }
ExceptionTests >> testSimpleRetry [
	self assertSuccess: (ExceptionTester new runTest: #simpleRetryTest ) 
]

{ #category : #testing-exceptiontester }
ExceptionTests >> testSimpleRetryUsing [
	self assertSuccess: (ExceptionTester new runTest: #simpleRetryUsingTest ) 
]

{ #category : #testing-exceptiontester }
ExceptionTests >> testSimpleReturn [
	self assertSuccess: (ExceptionTester new runTest: #simpleReturnTest ) 
]

{ #category : #testing }
ExceptionTests >> testTimeoutWithZeroDuration [
	self assertSuccess: (ExceptionTester new runTest: #simpleTimeoutWithZeroDurationTest ) 
]
