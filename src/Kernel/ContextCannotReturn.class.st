"
This exception is thrown when a value is returned from a context, but the context is dead and the return can not be done.
"
Class {
	#name : #ContextCannotReturn,
	#superclass : #CannotReturn,
	#instVars : [
		'target'
	],
	#category : #Kernel-Exceptions,
	#timestamp : 'MarcusDenker 5/30/2016 11:11'
}

{
	#category : #signalling,
	#timestamp : ' 8/31/2017 07:16:33'
}
ContextCannotReturn class>>result: anObject to: aContext [

	^self new 
		result: anObject;
		target: aContext;
		signal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ContextCannotReturn>>target [
	^ target
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ContextCannotReturn>>target: anObject [
	target := anObject
]
