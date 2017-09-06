"
I am container for special meta object ExecutionEnvironment which represent current execution environment for active process.

Look at ExecutionEnvironment for details
"
Class {
	#name : #CurrentExecutionEnvironment,
	#superclass : #ProcessLocalVariable,
	#category : #Kernel-Processes,
	#timestamp : 'DenisKudryashov 8/29/2016 15:52'
}

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
CurrentExecutionEnvironment class>>activate: anExecutionEnvironment for: aBlock [

	| current |
	self value == anExecutionEnvironment ifTrue: [ ^aBlock value ].
	
	current := self soleInstance valueOrNil.	
	[ self value: anExecutionEnvironment.
	anExecutionEnvironment activated.
	aBlock value  ] ensure: [
		self value: current.
		anExecutionEnvironment deactivated]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CurrentExecutionEnvironment class>>isInheritable [
	^true
]

{
	#category : #controlling,
	#timestamp : ' 8/31/2017 07:16:33'
}
CurrentExecutionEnvironment class>>restoreDefault [

	| current |
	current := self value.
	current deactivated.
	self value: nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CurrentExecutionEnvironment>>default [
	^DefaultExecutionEnvironment instance
]

{
	#category : #inheriting,
	#timestamp : ' 8/31/2017 07:16:33'
}
CurrentExecutionEnvironment>>installValue: anExecutionEnvironment intoForked: newProcess from: ownerProcess [
	super installValue: anExecutionEnvironment intoForked: newProcess from: ownerProcess.
	
	anExecutionEnvironment prepareForNewProcess: newProcess
]
