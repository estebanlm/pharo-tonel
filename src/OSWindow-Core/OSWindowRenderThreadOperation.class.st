"
I am a render operation, used to send commands (which can be asynchronous or synchronous) to the render thread. 
"
Class {
	#name : #OSWindowRenderThreadOperation,
	#superclass : #Object,
	#instVars : [
		'operation',
		'semaphore',
		'blocking',
		'failed'
	],
	#category : #OSWindow-Core-Extras,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderThreadOperation class>>new: anOperation [
	^ self new: anOperation blocking: false
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderThreadOperation class>>new: anOperation blocking: isBlocking [
	^ self basicNew initWithOperation: anOperation blocking: isBlocking; yourself
]

{
	#category : #waiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderThreadOperation>>blocking [
	^ blocking
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderThreadOperation>>execute [
	[ 
		[
			failed := false.
			operation value
		] on: Exception do: [ :ex |
			failed := true.
			ex freeze.
			[ ex debug ] fork.
		]
	] ensure: [ semaphore signal ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderThreadOperation>>failed [
	^ failed
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderThreadOperation>>initWithOperation: anOperation [
	semaphore := Semaphore new.
	operation := anOperation.
	
	
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderThreadOperation>>initWithOperation: anOperation blocking: isBlocking [
	semaphore := Semaphore new.
	operation := anOperation.
	blocking := isBlocking
	
	
]

{
	#category : #waiting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowRenderThreadOperation>>wait [
	semaphore wait
]
