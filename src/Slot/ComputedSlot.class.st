"
This is an example for a virtual slot that computes its value. 

It stores a block which is evaluated with the object as a parameter to calculate the value
on read. Writing is ignored.

e.g. make a class lile this:

Object subclass: #TT
	slots: { #i => ComputedSlot with: [ :o | o class methods size ] }
	classVariables: {  }
	category: 'TT'
"
Class {
	#name : #ComputedSlot,
	#superclass : #Slot,
	#instVars : [
		'block'
	],
	#category : #Slot-Examples,
	#timestamp : 'PavelKrivanek 2/15/2017 11:51'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ComputedSlot>>= other [
	^ super = other and: [block = other block]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ComputedSlot>>block [
	^block
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ComputedSlot>>hash [
	^super hash bitXor: block hash
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ComputedSlot>>printOn: aStream [
	aStream 
		store: self name;
		nextPutAll: ' => ';
		nextPutAll: self class name;
		nextPutAll: ' with: ';
		nextPutAll: block printString
]

{
	#category : #meta-object-protocol,
	#timestamp : ' 8/31/2017 07:16:35'
}
ComputedSlot>>read: anObject [
	^block value: anObject
	
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:35'
}
ComputedSlot>>with: aBlock [
	block := aBlock
]

{
	#category : #meta-object-protocol,
	#timestamp : ' 8/31/2017 07:16:35'
}
ComputedSlot>>write: aValue to: anObject [
	"ignored"
]
