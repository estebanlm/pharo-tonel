"
I am a hidden instance variable.

I work just like any other ivar, but I am not shown when asking for the #slots of a class.

The idea is that virtual slots can use hidden non-virtual slots to store their state. Example are PropertySlot, BooleanSlot...
"
Class {
	#name : #HiddenInstanceVariableSlot,
	#superclass : #InstanceVariableSlot,
	#category : #Slot-Examples,
	#timestamp : 'JurajKubelka 3/4/2015 20:15'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
HiddenInstanceVariableSlot>>isVisible [
	^ false
]
