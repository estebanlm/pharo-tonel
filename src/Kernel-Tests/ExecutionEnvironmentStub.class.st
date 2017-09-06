"
I am stub to test ExecutionEnvironment's
"
Class {
	#name : #ExecutionEnvironmentStub,
	#superclass : #ExecutionEnvironment,
	#instVars : [
		'forkedProcesses'
	],
	#category : #Kernel-Tests-Processes,
	#timestamp : 'DenisKudryashov 9/1/2016 13:36'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExecutionEnvironmentStub>>forkedProcesses [
	^ forkedProcesses
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExecutionEnvironmentStub>>forkedProcesses: anObject [
	forkedProcesses := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExecutionEnvironmentStub>>initialize [
	super initialize.
	
	forkedProcesses := OrderedCollection new
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 05:26:30'
}
ExecutionEnvironmentStub>>prepareForNewProcess: aProcess  [
	forkedProcesses add: aProcess
]
