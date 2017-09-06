"
I am the ultimate error. 
By default if an Error or Exception is not handled by the code the default action is to raise an UnhandledError which in interactive mode triggers the UIManager to open a debugger.

	Error signal
	...
	UnhandledError signalForException: error
	...
	UIManager opens a debugger
	
"
Class {
	#name : #UnhandledError,
	#superclass : #Exception,
	#instVars : [
		'exception'
	],
	#category : #Kernel-Exceptions,
	#timestamp : '<historical>'
}

{
	#category : #signalling,
	#timestamp : ' 8/31/2017 07:16:33'
}
UnhandledError class>>signalForException: anError [

	^ self new
		exception: anError;
		signal
]

{
	#category : #'priv handling',
	#timestamp : ' 8/31/2017 07:16:33'
}
UnhandledError>>defaultAction [
	<reflective: #unhandledErrorDefaultAction:message:>
 	^ UIManager default unhandledErrorDefaultAction: self exception
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
UnhandledError>>exception [

	^ exception
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
UnhandledError>>exception: anError [

	exception := anError
]

{
	#category : #'priv handling',
	#timestamp : ' 8/31/2017 07:16:33'
}
UnhandledError>>isResumable [
	
	^ false
]
