"
NOTE: this is an example of what can be done with Slots. It is *not* an example of what *should* be done with Slots.

I am showing how a slot can initialize itself on object creation.

#name => ExampleSlotWithDefaultValue default: 5
"
Class {
	#name : #ExampleSlotWithDefaultValue,
	#superclass : #InstanceVariableSlot,
	#instVars : [
		'default'
	],
	#category : #Slot-Examples,
	#timestamp : 'MarcusDenker 2/25/2015 17:17'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ExampleSlotWithDefaultValue>>= other [
	^ super = other and: [default = other default]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ExampleSlotWithDefaultValue>>default [
	^ default
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ExampleSlotWithDefaultValue>>default: anObject [
	default := anObject
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ExampleSlotWithDefaultValue>>hash [
	^super hash bitXor: default hash
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:35'
}
ExampleSlotWithDefaultValue>>initialize: anObject [
	self write: default to: anObject. 
	
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ExampleSlotWithDefaultValue>>printOn: aStream [
	aStream 
		store: self name;
		nextPutAll: ' => ';
		nextPutAll: self class name;
		nextPutAll: ' default: ';
		store: default
]

{
	#category : #meta-object-protocol,
	#timestamp : ' 8/31/2017 07:16:35'
}
ExampleSlotWithDefaultValue>>wantsInitalization [
	^ true
]
