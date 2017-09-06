"
An Example how Slots can be useful for Morphic.

A Slot for a morph Ivar where the use case is to hold a reference to some morph, and changing that Ivar follows the pattern of:

setIvar: aMorph
	 ivar ifNotNil: [ ivar delete ].
	 ivar := aMorph

"
Class {
	#name : #MorphSlot,
	#superclass : #IndexedSlot,
	#category : #Slot-Examples,
	#timestamp : 'MarcusDenker 10/2/2015 10:58'
}

{
	#category : #meta-object-protocol,
	#timestamp : ' 8/31/2017 07:16:35'
}
MorphSlot>>write: aValue to: anObject [
	
	(self read: anObject) ifNotNil: [ :m | m delete ].
	^super write: aValue to: anObject 
]
