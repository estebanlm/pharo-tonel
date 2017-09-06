"
I am a hidden non-virtual slot that the virtual slots BooleanSlot and PropertySlot store into.

They, when a class is created containing it, makes sure that there is one slot of me defined. When the last virtual slot is removed, I am removed.
"
Class {
	#name : #BaseSlot,
	#superclass : #InstanceVariableSlot,
	#instVars : [
		'default'
	],
	#category : #Slot-Examples,
	#timestamp : 'MarcusDenker 4/1/2015 10:57'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:35'
}
BaseSlot>>= other [
	^ super = other and: [default = other default]
]

{
	#category : #initalize,
	#timestamp : ' 8/31/2017 07:16:35'
}
BaseSlot>>default [
	^ default
]

{
	#category : #initalize,
	#timestamp : ' 8/31/2017 07:16:35'
}
BaseSlot>>default: anObject [
	default := anObject
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:35'
}
BaseSlot>>hash [
	^super hash bitXor: default hash
]

{
	#category : #initalize,
	#timestamp : ' 8/31/2017 07:16:35'
}
BaseSlot>>initialize: anObject [
	self write: default to: anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
BaseSlot>>isVisible [
	^ false
]

{
	#category : #meta-object-protocol,
	#timestamp : ' 8/31/2017 07:16:35'
}
BaseSlot>>wantsInitalization [
	"if a slot wants to hable initalization, return true here"
	^true
]
