"
This exception is thrown when a block tries to return but there is no home context.
"
Class {
	#name : #BlockCannotReturn,
	#superclass : #CannotReturn,
	#instVars : [
		'home'
	],
	#category : #Kernel-Exceptions,
	#timestamp : 'MarcusDenker 5/30/2016 11:11'
}

{
	#category : #signalling,
	#timestamp : ' 8/31/2017 07:16:33'
}
BlockCannotReturn class>>result: anObject from: homeContext [

	^self new 
		result: anObject;
		home: homeContext;
		signal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
BlockCannotReturn>>home [
	^ home
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
BlockCannotReturn>>home: anObject [
	home := anObject
]
