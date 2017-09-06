"
I am an example for a class variable that stores the value in the variable.
(same semantics as normal variables but using reflective code path for testing)
"
Class {
	#name : #ExampleClassVariable,
	#superclass : #LiteralVariable,
	#instVars : [
		'state'
	],
	#category : #Slot-Examples,
	#timestamp : 'MarcusDenker 3/4/2015 18:00'
}

{
	#category : #meta-object-protocol,
	#timestamp : ' 8/31/2017 07:16:35'
}
ExampleClassVariable>>read [
	^state
]

{
	#category : #meta-object-protocol,
	#timestamp : ' 8/31/2017 07:16:35'
}
ExampleClassVariable>>write:	 anObject [
	state := anObject
	 
]
