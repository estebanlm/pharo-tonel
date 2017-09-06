"
By default each Slot corresponds to an instance variable and vice versa. Hence there is a Slot for each instance variable.


"
Class {
	#name : #IndexedSlot,
	#superclass : #Slot,
	#instVars : [
		'index'
	],
	#category : #Slot-Variables,
	#timestamp : 'CyrilFerlicot 8/15/2017 1:20'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:35'
}
IndexedSlot>>= other [
	self == other
		ifTrue: [ ^ true ].
	^ ((self species == other species) 
			and: [ index = other index ])
			and: [ name = other name ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:35'
}
IndexedSlot>>hash [
	^ (self species hash bitXor: self name hash) bitXor: (self index ifNil: [ 0 ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
IndexedSlot>>index [
	^ index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
IndexedSlot>>index: anIndex [
	index := anIndex
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
IndexedSlot>>isVirtual [
	"virtual slots do not take up space in the object and have size = 0"
	^false
]

{
	#category : #meta-object-protocol,
	#timestamp : ' 8/31/2017 07:16:35'
}
IndexedSlot>>read: anObject [
	^ thisContext object: anObject instVarAt: index
]

{
	#category : #meta-object-protocol,
	#timestamp : ' 8/31/2017 07:16:35'
}
IndexedSlot>>write: aValue to: anObject [
	^ thisContext object: anObject instVarAt: index put: aValue.
]
