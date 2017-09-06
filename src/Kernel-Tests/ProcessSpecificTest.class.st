"
A ProcessSpecificTest is a test case for process local and dynamic variables.

"
Class {
	#name : #ProcessSpecificTest,
	#superclass : #TestCase,
	#category : #Kernel-Tests-Processes,
	#timestamp : 'mvl 3/13/2007 13:52'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ProcessSpecificTest>>checkDynamic: value [
	self assert: TestDynamicVariable value = value
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ProcessSpecificTest>>checkLocal: value [
	self assert: TestLocalVariable value = value
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ProcessSpecificTest>>testDynamicVariable [

	| s1 s2 p1stopped p2stopped |
	s1 := Semaphore new.
	s2 := Semaphore new.
	p1stopped := p2stopped := false.
	[
		TestDynamicVariable value: 1 during:[
			self checkDynamic: 1.
			(Delay forMilliseconds: 30) wait.
			self checkDynamic: 1.
			TestDynamicVariable value: 3 during:[
				(Delay forMilliseconds: 30) wait.
				self checkDynamic: 3
			].
			self checkDynamic: 1.
		].
		self checkDynamic: nil.
		p1stopped := true.
		s1 signal.
	] fork.

	[
		TestDynamicVariable value: 2 during:[
			self checkDynamic: 2.
			(Delay forMilliseconds: 30) wait.
			self checkDynamic: 2.
		].
		self checkDynamic: nil.
		p2stopped := true.
		s2 signal.
	] fork.

	"Set a maximum wait timeout so that the test case will complete 
	 even if the processes fail to signal us."
	s1 waitTimeoutSeconds: 2.
	s2 waitTimeoutSeconds: 2.
	self assert: p1stopped.
	self assert: p2stopped.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ProcessSpecificTest>>testDynamicVariableAccessFromDifferentProcess [
	| process sem result |
	
	sem := Semaphore new.
	process := [  
		TestDynamicVariable 
			value: 123 
			during: [ sem wait ] ] fork.
	Processor yield.
	Processor activeProcess 
		evaluate: [  result := TestDynamicVariable value ] 
		onBehalfOf: process.
	sem signal.
	self assert: result = 123
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ProcessSpecificTest>>testDynamicVariableBlockReturnValue [
	| returnValue |
	returnValue := TestDynamicVariable value: 10 during: [ TestDynamicVariable value + 1 ].
	self assert: returnValue equals: 11
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ProcessSpecificTest>>testDynamicVariableRemovedAfterUse [
	TestDynamicVariable
		value: 3
		during: [  ].
		
	self assert: (Processor activeProcess psValueAt: TestDynamicVariable soleInstance index) equals: nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ProcessSpecificTest>>testExecutionEnvironment [

	| newEnv |
	newEnv := ExecutionEnvironmentStub new.
	newEnv beActiveDuring: [  
		self assert: CurrentExecutionEnvironment value equals: newEnv.	
	
		DefaultExecutionEnvironment beActiveDuring: [ 
			self assert: CurrentExecutionEnvironment value equals: DefaultExecutionEnvironment instance].
	
		self assert: CurrentExecutionEnvironment value equals: newEnv.		
	]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ProcessSpecificTest>>testInheritableVariable [

	| s1 s2 parentVar childVar |
	s1 := Semaphore new.
	s2 := Semaphore new.
	TestInheritableVariable enable.
	
	[ TestInheritableVariable value: #inheritedVar.
		parentVar := TestInheritableVariable value.
		[ childVar := TestInheritableVariable value. s2 signal ] fork.
		s1 signal.
	 ] fork.

	s1 waitTimeoutSeconds: 2.
	s2 waitTimeoutSeconds: 2.
	TestInheritableVariable disable.
	
	self assert: parentVar equals: #inheritedVar.
	self assert: childVar equals: #inheritedVar
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ProcessSpecificTest>>testInheritingExecutionEnvironment [

	| newEnv p |
	newEnv := ExecutionEnvironmentStub new.
	newEnv beActiveDuring: [  
		p := [self assert: CurrentExecutionEnvironment value equals: newEnv] fork.
	].

	self assert: newEnv forkedProcesses anyOne equals: p
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ProcessSpecificTest>>testLocalVariable [

	| s1 s2 p1stopped p2stopped |
	s1 := Semaphore new.
	s2 := Semaphore new.
	p1stopped := p2stopped := false.
	[
		self checkLocal: 0.
		TestLocalVariable value: 1.
		self checkLocal: 1.
		(Delay forMilliseconds: 30) wait.
		self checkLocal: 1.
		TestLocalVariable value: 2.
		self checkLocal: 2.
		p1stopped := true.
		s1 signal.
	] fork.

	[
		(Delay forMilliseconds: 30) wait.
		self checkLocal: 0.
		TestLocalVariable value: 3.
		self checkLocal: 3.
		(Delay forMilliseconds: 30) wait.
		self checkLocal: 3.
		TestLocalVariable value: 4.
		self checkLocal: 4.
		p2stopped := true.
		s2 signal.
	] fork.

	"Set a maximum wait timeout so that the test case will complete 
	 even if the processes fail to signal us."
	s1 waitTimeoutMSecs: 5000.
	s2 waitTimeoutMSecs: 5000.
	self assert: p1stopped.
	self assert: p2stopped.

]
