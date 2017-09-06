"
I am ZnSignalProgress.
I am a DynamicVariable and a ProcessSpecificVariable.

I can be used to indicate that Zn related code down the call stack has to signal HTTPProgress, for example:

ZnSignalProgress 
	value: true 
	during: [ ^ ZnClient new get: 'http://zn.stfx.eu/zn/small.html' ]
"
Class {
	#name : #ZnSignalProgress,
	#superclass : #DynamicVariable,
	#category : #Zinc-HTTP-Variables,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSignalProgress class>>enabled [
	"Answer if HTTPProgress should be signalled.
	The default is false."
	
	^ self value
		ifNil: [ false ]
		ifNotNil: [ :value | value ]
]
