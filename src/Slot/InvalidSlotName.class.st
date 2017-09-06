"
I am signaled when the name of a Slot is an invalid variable name.
"
Class {
	#name : #InvalidSlotName,
	#superclass : #ClassBuilderWarning,
	#category : #Slot-Exception,
	#timestamp : '<historical>'
}

{
	#category : #signalling,
	#timestamp : ' 8/31/2017 07:16:35'
}
InvalidSlotName class>>signalFor: aSymbol [
	self signal: aSymbol asString, ' is an invalid name for a slot'
]
