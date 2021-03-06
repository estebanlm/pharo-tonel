"
A ProcessTest holds test cases for generic Process-related behaviour.
"
Class {
	#name : #ProcessTest,
	#superclass : #TestCase,
	#category : #Kernel-Tests-Processes
}

{ #category : #testing }
ProcessTest >> testFork [

	| hasBlockRun block return checkAssert |
	checkAssert := Semaphore new.
	hasBlockRun := false.
	block := [ hasBlockRun := true. checkAssert signal.].
	return := block fork.
	
	"Returns immediately, forked block not yet run"
	self deny: hasBlockRun.
	
	"Returns a process - Blue book specifies that it returns the block itself"
	self assert: (return isKindOf: Process).
	
	"Forked process has been scheduled"
	checkAssert wait.
	self assert: hasBlockRun 
]

{ #category : #testing }
ProcessTest >> testForkAtHigherPriority [

	| hasBlockRun block return |
	hasBlockRun := false.
	block := [ hasBlockRun := true ].
	return := block forkAt: Processor activeProcess priority + 1.
	
	"Preempts current process"
	self assert: hasBlockRun.
]

{ #category : #testing }
ProcessTest >> testInjectingExceptionHandlerFromProcessItself [

	| error interceptedError process interrupted |
	DefaultExecutionEnvironment beActive.
	error := Error new messageText: 'test error'.
	interrupted := true.
	process := [ Processor activeProcess on: Error do: [ :err | interceptedError := err ].
		error signal. interrupted := false ] fork.
	
	Processor yield.

	self assert: interceptedError == error.
	self assert: interrupted 
]

{ #category : #testing }
ProcessTest >> testInjectingExceptionHandlerIntoNotRunningProcess [

	| error interceptedError process interrupted |
	DefaultExecutionEnvironment beActive.
	error := Error new messageText: 'test error'.
	interrupted := true.	
	process := [ error signal. interrupted := false ] newProcess.
	process on: Error do: [ :err | interceptedError := err ].
	process resume.
	Processor yield.

	self assert: interceptedError == error.
	self assert: interrupted
]

{ #category : #testing }
ProcessTest >> testInjectingExceptionHandlerIntoProcessWithArg [

	| error interceptedError process interrupted processArg |
	DefaultExecutionEnvironment beActive.
	error := Error new messageText: 'test error'.
	interrupted := true.	
	process := [:arg | processArg := arg. error signal. interrupted := false ] newProcessWith: #(#arg).
	process on: Error do: [ :err | interceptedError := err ].
	process resume.
	Processor yield.

	self assert: interceptedError == error.
	self assert: interrupted.
	self assert: processArg equals: #arg.
]

{ #category : #testing }
ProcessTest >> testInjectingExceptionHandlerIntoRunningProcess [

	| error interceptedError process sema started interrupted |
	DefaultExecutionEnvironment beActive.
	error := Error new messageText: 'test error'.
	sema := Semaphore new.
	interrupted := true.
	process := [started := true. sema wait. error signal. interrupted := false ] newProcess.
	process resume.
	Processor yield.
	
	self assert: started.
	process on: Error do: [ :err | interceptedError := err ].
	
	sema signal.
	Processor yield.
	
	self assert: interceptedError == error.
	self assert: interrupted
]

{ #category : #testing }
ProcessTest >> testInjectingMultipleExceptionHandlersIntoNotRunningProcess [

	| error process lastHandler firstHandler |
	DefaultExecutionEnvironment beActive.
	firstHandler := lastHandler := false.
	process := [ error signal ] newProcess.
	process on: ZeroDivide do: [ :err | firstHandler := true ].
	process on: Error do: [ :err | lastHandler := true ].
	
	error := ZeroDivide new.
	process resume.
	Processor yield.
	self assert: firstHandler.
	self deny: lastHandler.
	
	firstHandler := lastHandler := false.
	process := [ error signal ] newProcess.
	process on: ZeroDivide do: [ :err | firstHandler := true ].
	process on: Error do: [ :err | lastHandler := true ].
	
	error := Error new.
	process resume.
	Processor yield.
	self deny: firstHandler.
	self assert: lastHandler
]

{ #category : #testing }
ProcessTest >> testInjectingMultipleExceptionHandlersIntoRunningProcess [

	| error process lastHandler firstHandler sema |
	DefaultExecutionEnvironment beActive.
	firstHandler := lastHandler := false.
	sema := Semaphore new.
	process := [ sema wait. error signal ] fork.
	Processor yield.
	process on: ZeroDivide do: [ :err | firstHandler := true ].
	process on: Error do: [ :err | lastHandler := true ].
	
	error := ZeroDivide new.
	sema signal.
	Processor yield.
	self assert: firstHandler.
	self deny: lastHandler.
	
	firstHandler := lastHandler := false.
	sema := Semaphore new.
	process := [ sema wait. error signal ] fork.
	Processor yield.
	process on: ZeroDivide do: [ :err | firstHandler := true ].
	process on: Error do: [ :err | lastHandler := true ].
	
	error := Error new.
	sema signal.
	Processor yield.
	self deny: firstHandler.
	self assert: lastHandler
]

{ #category : #testing }
ProcessTest >> testIsSelfEvaluating [
	self assert: Processor printString = 'Processor'
]

{ #category : #testing }
ProcessTest >> testIsTerminatingForcedTermination [
	| process unwound started terminator unwindChecks terminationSemaphore |
	unwound := false.
	started := false.
	terminationSemaphore := Semaphore new.
	terminationSemaphore signal.
	process := [ 
		started := true.
		[ terminationSemaphore wait; wait. ] ensure: [
			terminator := Processor activeProcess.
			unwindChecks value.
			unwound := true ] 
	] newProcess.
	process priority: Processor activePriority - 1.
	
	self assert: process isSuspended.
	self deny: process isTerminating.
	self deny: process isTerminated.
	self deny: started.
	self deny: unwound.
	
	process resume.
	[ terminationSemaphore isSignaled ] whileTrue: [ 50 milliSeconds asDelay wait ].
	self deny: process isSuspended.
	self deny: process isTerminating.
	self deny: process isTerminated.
	self assert: started.
	self deny: unwound.
	self deny: terminator == process.
	
	terminationSemaphore signal.
	"This will run the #ensure: block and block on the Semaphore."
	process terminate.
	"We want these checks to run during unwinding, so we need to cheat a bit."
	unwindChecks := [
		self assert: process isSuspended.
		"We're inside of #terminate."
		self assert: process isTerminating.
		"Still unwinding, so not finished."
		self deny: process isTerminated.
		self assert: started.
		"Not unwound yet."
		self deny: unwound.
		self assert: terminator == process ].
	
	[ process isTerminated ] whileFalse: [ 50 milliSeconds asDelay wait ].
	self assert: process isSuspended.
	self assert: process isTerminating.
	self assert: process isTerminated.
	self assert: started.
	self assert: unwound.
	self assert: terminator == process
]

{ #category : #testing }
ProcessTest >> testIsTerminatingForcedTerminationWithoutRunning [
	| process unwound started terminator |
	unwound := false.
	started := false.
	process := [ 
		started := true.
		[ Semaphore new wait ] ensure: [
			terminator := Processor activeProcess.
			unwound := true ] 
	] newProcess.
	"This will prevent the process from getting a chance to run.
	Effectively the pc of suspendedContext will be equal to startpc."
	process priority: Processor systemBackgroundPriority.
	
	self assert: process isSuspended.
	self deny: process isTerminating.
	self deny: process isTerminated.
	self deny: started.
	self deny: unwound.
	
	process resume.
	self deny: process isSuspended.
	self deny: process isTerminating.
	self deny: process isTerminated.
	self deny: unwound.
	
	process terminate.
	self assert: process isSuspended.
	self assert: process isTerminating.
	self assert: process isTerminated.
	"The process never ran"
	self deny: started.
	"No unwind blocks were ever activated, so the next two lines can't be true."
	self deny: unwound.
	self deny: terminator == process
]

{ #category : #testing }
ProcessTest >> testIsTerminatingNormalTermination [
	| sem process unwound started terminator |
	sem := Semaphore new.
	unwound := false.
	started := false.
	process := [ 
		started := true.
		[ sem wait ] ensure: [
		terminator := Processor activeProcess.
		unwound := true ] 
	] fork.
	self deny: process isSuspended.
	self deny: process isTerminating.
	self deny: process isTerminated.
	self deny: started.
	self deny: unwound.
	
	sem signal.
	self waitForProcessTermination: process.
	"#terminate will be sent by the process itself after its context has finished (see BlockClosure>>newProcess)"
	self assert: process isSuspended.
	self assert: process isTerminating.
	self assert: process isTerminated.
	self assert: started.
	"When inside of an unwind context, that unwind context needs run through."
	self assert: unwound.
	"A process should terminte itself."
	self assert: terminator == process
]

{ #category : #testing }
ProcessTest >> testNewProcess [

	| hasBlockRun block return |
	hasBlockRun := false.
	block := [ hasBlockRun := true ].
	return := block newProcess.
	
	"Returns immediately"
	self deny: hasBlockRun.
	
	"Returns a process - Blue book specifies the block"
	self assert: (return isKindOf: Process).
	
	"Forked process has not been scheduled"
	self assert: return isSuspended.
]

{ #category : #testing }
ProcessTest >> testNewProcessWith [

	| hasBlockRun block return passedArguments receivedArgument1 receivedArgument2 |
	hasBlockRun := false.
	block := [ :a :b |
		receivedArgument1 := a.
		receivedArgument2 := b.
		hasBlockRun := true ].
	passedArguments := #(1 2).
	return := block newProcessWith: passedArguments.
	
	"Returns immediately"
	self deny: hasBlockRun.
	
	self assert: (return isKindOf: Process).
	
	"Process has not been scheduled"
	self assert: return isSuspended.
	
	return resume.
	Processor yield.
	
	"Each element in the collection argument was passed separately to the block"
	self assert: { receivedArgument1. receivedArgument2 } equals: passedArguments.
]

{ #category : #testing }
ProcessTest >> testSchedulingHigherPriorityServedFirst [
    "The first process to run will pass straight through the gate
    while the other waits for the assert to whichRan."

	"Even though the low priority process is waiting longer, 
	the higher priority process should run first."

	| gate checkAssert whichRan |
	gate := Semaphore new signal. 
	checkAssert := Semaphore new.
	
	[ gate wait. whichRan := 11. checkAssert signal ] forkAt: 11.
	[ gate wait. whichRan := 12. checkAssert signal ] forkAt: 12.
	
	checkAssert wait.
	self assert: whichRan=12 description: 'Second scheduled but higher priority should run first'.	
	gate signal. 
	
	checkAssert wait.
	self assert: whichRan=11 description: 'First scheduled but lower priority should run after'.

]

{ #category : #testing }
ProcessTest >> testSchedulingSamePriorityFirstComeFirstServed [
    "The first process to run will pass straight through the gate
    while the other waits for the assert to whichRan."

	"At the same priority process, the longer waiting process should run first."

	| gate checkAssert whichRan |
	gate := Semaphore new signal. 
	checkAssert := Semaphore new.
		
	[ gate wait. whichRan := 1. checkAssert signal ] fork.
	[ gate wait. whichRan := 2. checkAssert signal ] fork.
	
	checkAssert wait.
	self assert: whichRan=1 description: 'First scheduled process should run first'.
	gate signal. 

	checkAssert wait.
	self assert: whichRan=2 description: 'Second scheduled process should run after'.
]

{ #category : #testing }
ProcessTest >> testTerminateActive [

	| lastStatementEvaluated block1HasRun block2HasRun |
	block1HasRun := block2HasRun := lastStatementEvaluated := false.
	[
		block1HasRun := true.
		Processor activeProcess terminate.
		lastStatementEvaluated := true ] fork.
	
	[
		block2HasRun := true.
		Processor terminateActive.
		lastStatementEvaluated := true ] fork.
	
	Processor yield.
	
	"Expressions following terminate are never executed"
	self assert: block1HasRun.
	self assert: block2HasRun.
	self deny: lastStatementEvaluated.
]

{ #category : #testing }
ProcessTest >> testTerminationShouldProceedAllEnsureBlocksIfSomeWasFailed [

	| ensureCalled process ensureFailure forkedFailures |
	ensureFailure := Error new messageText: 'signalled inside ensure'.
	ensureCalled := false.
	process := [ 
		[[10 seconds wait] 
			ensure: [ ensureFailure signal ]]
				ensure: [ ensureCalled := true ].
	] fork.
	Processor yield.
	process terminate.	
	Processor yield.
	self assert: ensureCalled.
	forkedFailures := TestExecutionEnvironment currentFailures.
	self assert: forkedFailures size equals: 2.
	self assert: forkedFailures first equals: ensureFailure.
	self assert: forkedFailures last class equals: UnwindError.
	self assert: forkedFailures last signalerContext exception equals: ensureFailure.
	TestExecutionEnvironment resetFailures
]

{ #category : #testing }
ProcessTest >> testTerminationShouldProceedEnsureBlocks [

	| ensureCalled process semaphore |
	ensureCalled := false.
	semaphore := Semaphore new.
	process := [ 
		[semaphore signal. [10 milliSeconds wait] repeat] ensure: [ ensureCalled := true ]
	] fork.
	semaphore wait.
	
	process terminate.
	self assert: ensureCalled
]

{ #category : #testing }
ProcessTest >> testYield [

	| lowerHasRun lowerPriority same1HasRun same2HasRun |
	lowerHasRun := same1HasRun := same2HasRun := false.
	lowerPriority := Processor activeProcess priority - 10 min: 10.
	[ lowerHasRun := true ] forkAt: lowerPriority.
	[ same1HasRun := true ] fork.
	[ same2HasRun := true ] fork.

	Processor yield.
	
	"All processes of same priority have been given a chance to execute"
	self assert: same1HasRun.
	self assert: same2HasRun.
	self deny: lowerHasRun.
]

{ #category : #helpers }
ProcessTest >> waitForProcessTermination: aProcess [
	aProcess priority: Processor activePriority + 1.
	[ aProcess isTerminated ] whileFalse: [ Processor yield ]
]
