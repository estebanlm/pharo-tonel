"
I am a warning signaled when trying to build a class with an invalid superclass.
"
Class {
	#name : #InvalidSuperclass,
	#superclass : #ClassBuilderWarning,
	#category : #Slot-Exception,
	#timestamp : '<historical>'
}

{
	#category : #signalling,
	#timestamp : ' 8/31/2017 07:16:35'
}
InvalidSuperclass class>>signal: aMessage for: anObject [
	self signal: anObject asString, ': ', aMessage 
]
