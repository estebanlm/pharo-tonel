"
Notify to abort a task
"
Class {
	#name : #Abort,
	#superclass : #Exception,
	#category : #Kernel-Exceptions,
	#timestamp : 'TorstenBergmann 2/4/2014 21:42'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Abort>>defaultAction [
	"No one has handled this error, but now give them a chance to decide how to debug it.  If none handle this either then open debugger (see UnhandedError-defaultAction)"

	UnhandledError signalForException: self
]
