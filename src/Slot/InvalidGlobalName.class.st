"
I am a warning signaled when trying to build a class with invalid name.
"
Class {
	#name : #InvalidGlobalName,
	#superclass : #ClassBuilderWarning,
	#category : #Slot-Exception,
	#timestamp : '<historical>'
}

{
	#category : #signalling,
	#timestamp : ' 8/31/2017 07:16:35'
}
InvalidGlobalName class>>signal: aMessage for: aName [
	self signal: aName asString, ': ', aMessage 
]
