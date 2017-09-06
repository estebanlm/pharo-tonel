"

"
Class {
	#name : #MutexTest,
	#superclass : #TestCase,
	#instVars : [
		'mutex',
		'forkedProcesses'
	],
	#category : #Kernel-Tests-Processes,
	#timestamp : ''
}

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:30'
}
MutexTest>>fork: aBlock [

	| newProcess |
	newProcess := aBlock forkNamed: testSelector.
	forkedProcesses add: newProcess.
	^newProcess
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:30'
}
MutexTest>>fork: aBlock at: priority [

	| newProcess |
	newProcess := aBlock forkAt: priority named: testSelector.
	forkedProcesses add: newProcess.
	^newProcess
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
MutexTest>>setUp [
	super setUp.
	
	forkedProcesses := OrderedCollection new.
	mutex := Mutex new.
	
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
MutexTest>>tearDown [
	forkedProcesses do: #terminate.
	
	super tearDown.
	
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
MutexTest>>testExecutionCriticalSection [

	| actual |
	actual := mutex critical: [ #result ].
	
	self assert: actual equals: #result
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
MutexTest>>testFailedCriticalSectionShouldUnblockWaitingOne [

	| lastExecuted |
	lastExecuted := false.
	
	self fork: [[mutex critical: [ 5 milliSeconds wait.
			self error: 'critical section failed' ]] ifError: []].
	
	self fork: [mutex critical: [ lastExecuted := true ]].
	10 milliSeconds wait.
		
	self assert: lastExecuted
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
MutexTest>>testTerminatedCriticalSectionShouldUnblockWaitingOne [

	| lastExecuted firstCritical |
	lastExecuted := false.
	
	firstCritical := self fork: [mutex critical: [ 10 seconds wait.
			self error: 'should not happen' ]].
	
	self fork: [mutex critical: [ lastExecuted := true ]].
	10 milliSeconds wait.
	firstCritical terminate.
	10 milliSeconds wait.
	self assert: lastExecuted
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
MutexTest>>testTerminatingBlockedCriticalSectionShouldNotUnblockAnotherWaitingSection [

	| lastExecuted lastExecutedAfterFirst secondCritical |
	lastExecuted := false.
	lastExecutedAfterFirst := nil.
	
	self fork: [mutex critical: [ 10 milliSeconds wait.
			lastExecutedAfterFirst := lastExecuted not ]].
	
	secondCritical := self fork: [mutex critical: [ lastExecuted := true ]].
	self fork: [mutex critical: [ lastExecuted := true ]].
	5 milliSeconds wait.
	secondCritical terminate.
	10 milliSeconds wait.
	self assert: lastExecuted.
	self assert: lastExecutedAfterFirst
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
MutexTest>>testTerminatingBlockedCriticalWhichWasSignalledButNotResumedYet [

	|  secondCriticalExecuted  firstCriticalExecuted firstCritical secondCritical lastCriticalExecuted controllingProcess |
	firstCriticalExecuted := false.
	secondCriticalExecuted := false.
	lastCriticalExecuted := false.
	controllingProcess := self fork: [ 5 milliSeconds wait.
		controllingProcess suspend.
		self assert: firstCriticalExecuted not description: 'controlling process should be resumed when first critical is finished execution'.
		Processor yield.
		self assert: firstCriticalExecuted description: 'controlling process not ready to terminate second critical because first is not finished execution'.
		self assert: firstCritical isTerminated description: 'controlling process not ready to terminate second critical because first is not terminated'.
		self assert: secondCriticalExecuted not description: 'second critical should not be executed before attemp to terminate it manually'.
		secondCritical terminate.
	].
	10 milliSeconds wait.
	self assert: controllingProcess isSuspended description: 'controlling process should be suspended'.
	firstCritical := self fork: [ mutex critical: [ 5 milliSeconds wait.
			 controllingProcess resume. Processor yield. "make chance for controlling process to check that our scenario is in correct state"
			firstCriticalExecuted := true ]].	
	"for second critical we choose small priority. So it can't be resumed automatically by scheduler in our scenario."
	secondCritical := self fork: [mutex critical: [ secondCriticalExecuted := true ]] at: Processor activeProcess priority - 1. 
	15 milliSeconds wait. "here we are waiting completion of our scenario. 
	At the end second critical should be terminated in waiting point when mutex was already signalled but process was not resumed.
	Correct critical implementation should allow execution of new consequent criticals"
	self fork: [ mutex critical: [ lastCriticalExecuted := true ]].	
	15 milliSeconds wait.
	self assert: lastCriticalExecuted description: 'consequent last critical should be executed'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
MutexTest>>testTwoCriticalsShouldWaitEachOther [

	| lastExecuted lastExecutedAfterFirst |
	lastExecuted := false.
	lastExecutedAfterFirst := nil.
	
	self fork: [mutex critical: [ 5 milliSeconds wait.
			lastExecutedAfterFirst := lastExecuted not ]].
	
	self fork: [mutex critical: [ lastExecuted := true ]].
	10 milliSeconds wait.
		
	self assert: lastExecuted.
	self assert: lastExecutedAfterFirst 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
MutexTest>>testTwoRecursiveCriticalsShouldNotWaitEachOther [

	| executed |
	executed := false.
	
	self fork: [mutex critical: [ mutex critical: [ executed := true ]]].
	10 milliSeconds wait.
		
	self assert: executed
]
