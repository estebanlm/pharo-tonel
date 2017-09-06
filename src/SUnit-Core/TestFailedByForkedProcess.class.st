"
I am special failure which signalled that some processes was forked during tests and was failed.
I am resumable and resume will open debuggers on failed processes (in fact they will be resumed).

I mark tests red when they produce such processes. So no green tests which spawn ""background debuggers"".

Also I am signalled first when test itself is failed. By resuming it debugger will be opened on test too together with failed processes 
"
Class {
	#name : #TestFailedByForkedProcess,
	#superclass : #Error,
	#category : #SUnit-Core-Kernel,
	#timestamp : 'DenisKudryashov 2/15/2017 14:09'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestFailedByForkedProcess>>initialize [
	super initialize.
	
	messageText := 'Proceed to debug it'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestFailedByForkedProcess>>isResumable [
	"users could proceed execution to debug suspended failures"
	^true
]
