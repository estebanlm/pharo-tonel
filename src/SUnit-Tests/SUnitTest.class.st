"
This is both an example of writing tests and a self test for the SUnit. The tests 
here are pretty strange, since you want to make sure things blow up. You should 
not generally have to write tests this complicated in structure, although they 
will be far more complicated in terms of your own objects- more assertions, more 
complicated setup. Kent says: ""Never forget, however, that if the tests are hard 
to write, something is probably wrong with the design"".
"
Class {
	#name : #SUnitTest,
	#superclass : #TestCase,
	#instVars : [
		'hasRun',
		'hasSetup',
		'hasRanOnce'
	],
	#category : #SUnit-Tests-Core,
	#timestamp : '<historical>'
}

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest class>>lastStoredRun [
	^ ((Dictionary new) add: (#passed->((Set new) add: #testWithExceptionDo; add: #testAssert; add: #testRanOnlyOnce; add: #testDialectLocalizedException; add: #testFail; add: #testDefects; add: #testIsNotRerunOnDebug; add: #testResult; add: #testRunning; add: #testError; add: #testException; add: #testShould; add: #testSuite; yourself)); add: (#timeStamp->'22 November 2008 10:11:35 pm'); add: (#failures->((Set new))); add: (#errors->((Set new))); yourself)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>assertForTestResult: aResult runCount: aRunCount passed: aPassedCount failed: aFailureCount errors: anErrorCount [

	self
		assert: aResult runCount = aRunCount;
		assert: aResult passedCount = aPassedCount;
		assert: aResult failureCount = aFailureCount;
		assert: aResult errorCount = anErrorCount
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>assertForTestResult: aResult runCount: aRunCount passed: aPassedCount failed: aFailureCount errors: anErrorCount expectedFailures: anExpectedFailureCount [

	self
		assert: aResult runCount = aRunCount;
		assert: aResult expectedPassCount = aPassedCount;
		assert: aResult failureCount = aFailureCount;
		assert: aResult errorCount = anErrorCount;
		assert: aResult expectedDefectCount = anExpectedFailureCount
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>assertTerminatedFailedChildProcessesFor: aTestCase [

	| failedProcesses |
	failedProcesses := aTestCase failedChildProcesses.
	self assert: failedProcesses notEmpty.
	self assert: (failedProcesses allSatisfy: #isTerminated) 
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>deprecatedMessage [
	self deprecated: 'Deprecated method used by #testIgnoreDeprecationWarnings' on: '' in: ''
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>error [
	3 zork
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>errorShouldntRaise [
	self someMessageThatIsntUnderstood
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>expectedFailureFails [
	<expectedFailure>
	self assert: false.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>expectedFailurePasses [
	<expectedFailure>
	self assert: true.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>expectedFailures [
	^super expectedFailures "#() "
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>failedChildProcessTest [

	[self error: 'error from child process'] forkNamed: 'failed child for ', testSelector
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>failedChildProcesses [
	^Process allInstances 
		select: [: each | each name = ('failed child for ', testSelector)]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>failedTestWithFailedChildProcessTest [

	self failedChildProcessTest.
	Processor yield.
	self error: 'failed test with failed child process'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>hangedChildProcessTest [

	[10 seconds wait] forkNamed: #hangedChildProcessTest
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>hangedTestDueToFailedChildProcess [
	self timeLimit: 10 milliSeconds.
	
	self failedChildProcessTest.
	
	20 milliSeconds wait.

	
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>hasRun [
	^hasRun
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>hasSetup [
	^hasSetup
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>longRunningTest [

	self timeLimit: 10 milliSeconds.
	20 milliSeconds wait
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>noop [

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>raiseDeprecationWarnings [
	| oldRaiseWarning |
	oldRaiseWarning := Deprecation raiseWarning.
	[ Deprecation raiseWarning: true.
	self deprecatedMessage.
	self fail ]
		ensure: [ Deprecation raiseWarning: oldRaiseWarning ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>setRun [
	hasRun := true
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>setUp [
	hasSetup := true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testAssert [
	self assert: true.
	self deny: false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testChildProcessShouldNotBeStoredStronglyByTestEnvironment [

	| process weak |
	process := [   ] forkNamed: 'child test process'.
	weak := WeakArray with: process.
	process := nil.
	Processor yield.
	Smalltalk garbageCollect.
	
	self assert: weak first equals: nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testDefects [
	| result suite error failure |
	suite := self classForTestSuite new.
	suite addTest: (error := self class selector: #error).
	suite addTest: (failure := self class selector: #fail).
	result := suite run.
	self assert: result defects asArray = (Array with: error with: failure).
	self
		assertForTestResult: result
		runCount: 2
		passed: 0
		failed: 1
		errors: 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testDialectLocalizedException [

	self
		should: [self classForTestResult signalFailureWith: 'Foo']
		raise: self defaultTestFailure.
	self
		should: [self classForTestResult signalErrorWith: 'Foo']
		raise: self defaultTestError.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testError [

	| case result |

	case := self class selector: #error.
	result := case run.
	self
		assertForTestResult: result
		runCount: 1
		passed: 0
		failed: 0
		errors: 1.

	case := self class selector: #errorShouldntRaise.
	result := case run.
	self 
		assertForTestResult: result
		runCount: 1
		passed: 0
		failed: 0
		errors: 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testErrorShouldResetWatchDog [

	| case result |
	
	DefaultExecutionEnvironment beActive.
	TestExecutionEnvironment new beActiveDuring: [ 
		case := self class selector: #fail.
		result := case run.
		1 seconds wait]. 

	self
		assertForTestResult: result
		runCount: 1
		passed: 0
		failed: 1
		errors: 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testException [

	self
		should: [self error: 'foo']
		raise: self defaultTestError
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testExecutionEnvironmentShouldBeInstalled [

	| env |
	env := CurrentExecutionEnvironment value.

	self assert: env class equals: TestExecutionEnvironment.
	self assert: env testCase equals: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testExpectedFailure [

	| case result |
	case := self class selector: #expectedFailureFails.
	self deny: case shouldPass.
	result := case run.
	self
		assertForTestResult: result
		runCount: 1
		passed: 0
		failed: 0
		errors: 0
		expectedFailures: 1.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testExpectedFailureDetection [
	self assert: self expectedFailures size = 2.
	self assert: (self expectedFailures includesAll: #(expectedFailureFails expectedFailurePasses))
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testExpectedFailurePass [

	| case result |
	case := self class selector: #expectedFailurePasses.
	self deny: case shouldPass.
	result := case run.
	self
		assertForTestResult: result
		runCount: 1
		passed: 0
		failed: 1
		errors: 0
		expectedFailures: 0.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testFail [

	| case result |

	case := self class selector: #fail.
	result := case run.

	self
		assertForTestResult: result
		runCount: 1
		passed: 0
		failed: 1
		errors: 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testFailedChildProcessTest [

	| case result |
	DefaultExecutionEnvironment beActive.
	case := self class selector: #failedChildProcessTest.	
	result := case run.

	self
		assertForTestResult: result
		runCount: 1
		passed: 0
		failed: 0
		errors: 1.		
	self assertTerminatedFailedChildProcessesFor: case
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testFailedChildProcessTestShouldNotEffectFollowingAnotherTest [

	| result case1 case2 |
	DefaultExecutionEnvironment beActive.
	TestExecutionEnvironment new beActiveDuring: [ 
		case1 := self class selector: #failedChildProcessTest.	
		result := case1 run.
		case2 := self class selector: #noop.	
		result := case2 run].

	self
		assertForTestResult: result
		runCount: 1
		passed: 1
		failed: 0
		errors: 0.		
	self assertTerminatedFailedChildProcessesFor: case1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testFailedTestWithFailedChildProcessTestShouldNotEffectFollowingAnotherTest [

	| result case1 case2 |
	DefaultExecutionEnvironment beActive.
	TestExecutionEnvironment new beActiveDuring: [ 
		case1 := self class selector: #failedTestWithFailedChildProcessTest.	
		result := case1 run.
		case2 := self class selector: #noop.	
		result := case2 run].

	self
		assertForTestResult: result
		runCount: 1
		passed: 1
		failed: 0
		errors: 0.
	self assertTerminatedFailedChildProcessesFor: case1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testFileOutResult [
	| suite result fileout |
	suite := self classForTestSuite new.
	suite
		addTest: (self class selector: #noop);
		addTest: (self class selector: #fail);
		addTest: (self class selector: #error).
	result := suite run.
	fileout := String streamContents: [ :aStream | result fileOutOn: aStream ].
	self
		assert: fileout
		equals:
			'3 run, 1 passes, 0 skipped, 0 expected failures, 1 failures, 1 errors, 0 unexpected passes
Failures:
SUnitTest(TestAsserter)>>#fail

Errors:
SUnitTest>>#error
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testGreenTestThenLongRunningTest [

	| case result |
	DefaultExecutionEnvironment beActive.
	case := self class selector: #noop.
	result := case run.
	case := self class selector: #longRunningTest.
	result := case run.

	self
		assertForTestResult: result
		runCount: 1
		passed: 0
		failed: 0
		errors: 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testHangedChildProcessTest [

	| case result hangedProcess |

	case := self class selector: #hangedChildProcessTest.	
	result := case run.

	self
		assertForTestResult: result
		runCount: 1
		passed: 1
		failed: 0
		errors: 0.
		
	hangedProcess := Process allInstances 
		detect: [: each | each name = #hangedChildProcessTest] ifNone: [ ^self ].
	self assert: hangedProcess isTerminated
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testHangedTestDueToFailedChildProcess [

	| case result |
	DefaultExecutionEnvironment beActive.
	case := self class selector: #hangedTestDueToFailedChildProcess.	
	result := case run.

	self
		assertForTestResult: result
		runCount: 1
		passed: 0
		failed: 0
		errors: 1.
		
	self assertTerminatedFailedChildProcessesFor: case
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testIgnoreDeprecationWarnings [
	| oldRaiseWarning |
	oldRaiseWarning := Deprecation raiseWarning.
	[ Deprecation raiseWarning: false.
	self deprecatedMessage.
	self assert: true ]
		ensure: [ Deprecation raiseWarning: oldRaiseWarning ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testIsNotRerunOnDebug [

	| case |

	case := self class selector: #testRanOnlyOnce.
	case run.
	case debug
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testLongRunningTest [

	| case result |
	DefaultExecutionEnvironment beActive.
	case := self class selector: #longRunningTest.
	result := case run.

	self
		assertForTestResult: result
		runCount: 1
		passed: 0
		failed: 0
		errors: 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testLongRunningTestThenGreenTest [

	| case result |
	DefaultExecutionEnvironment beActive.
	case := self class selector: #longRunningTest.
	result := case run.
	case := self class selector: #noop.
	result := case run.

	self
		assertForTestResult: result
		runCount: 1
		passed: 1
		failed: 0
		errors: 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testRaiseDeprecationWarnings [
	| case result |
	case := self class selector: #raiseDeprecationWarnings.
	result := case run.
	self assert: result defects asArray equals: (Array with: case).
	self
		assertForTestResult: result
		runCount: 1
		passed: 0
		failed: 1
		errors: 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testRan [

	| case |

	case := self class selector: #setRun.
	case resources do: [:each | each availableFor: case].
	[case setUp.
	case performTest] ensure: [
		self assert: case hasSetup.
		self assert: case hasRun.
		case tearDown.
		case cleanUpInstanceVariables].
	self assert: case hasSetup isNil.
	self assert: case hasRun isNil.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testRanOnlyOnce [

	self assert: hasRanOnce ~= true.
	hasRanOnce := true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testResult [

	| case result |

	case := self class selector: #noop.
	result := case run.

	self
		assertForTestResult: result
		runCount: 1
		passed: 1
		failed: 0
		errors: 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testRunning [

	10 milliSeconds wait
			
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testRunningLongTime [
	self timeLimit: 3 seconds.
	
	2 seconds wait
			
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testSelectorWithArg: anObject [
	"should not result in error"
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testShould [

	self
		should: [true];
		shouldnt: [false]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testShouldIgnoreTimeLimitWhenTestProcessIsSuspended [
	"If you open debugger on test (by halt or error) and will not close it more then test time limit then following interaction with debugger will fail. 
	As simple fix watch dog should check that test process is not suspended. It of course will open possibility to hang test execution when tested code will suspend active process by incident. But we could live with it and probably it could be addressed too in future"
	| testProcess |
	self timeLimit: 30 milliSeconds.
	testProcess := Processor activeProcess.
	[ 50 milliSeconds wait. testProcess resume ] fork.
	testProcess suspend.
	self assert: true.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testSuite [
	| suite result |
	suite := self classForTestSuite new.
	suite
		addTest: (self class selector: #noop);
		addTest: (self class selector: #fail);
		addTest: (self class selector: #error).
	result := suite run.
	self
		assertForTestResult: result
		runCount: 3
		passed: 1
		failed: 1
		errors: 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testWatchDogProcessShouldNotBeCatchedAsForkedProcess [

	| env |
	env := CurrentExecutionEnvironment value.
	
	self assert: env forkedProcesses isEmpty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitTest>>testWithExceptionDo [

	self
		should: [self error: 'foo']
		raise: self defaultTestError
		withExceptionDo: [:exception |
			self assert: (exception description includesSubstring: 'foo')
		]
			
]
