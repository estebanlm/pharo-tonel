"
I'm a relation slot  that  describes  slots that contain collections.
"
Class {
	#name : #ToManyRelationSlot,
	#superclass : #RelationSlot,
	#category : #Slot-Examples-Associations,
	#timestamp : 'JanVanDeSandt 2/27/2015 11:26'
}

{
	#category : #internal,
	#timestamp : ' 8/31/2017 07:16:35'
}
ToManyRelationSlot>>add: newObject to: collectionOwner [

	self checkValue: newObject.
	self hasInverse
		ifTrue: [ self addAssociationFrom: collectionOwner to: newObject ]

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:35'
}
ToManyRelationSlot>>initialize: anObject [
	self write: (RelationSet owner: anObject slot: self) to: anObject. 
	
]

{
	#category : #internal,
	#timestamp : ' 8/31/2017 07:16:35'
}
ToManyRelationSlot>>remove: oldObject from: collectionOwner [

	self hasInverse
		ifTrue: [ self removeAssociationFrom: collectionOwner to: oldObject ]

]

{
	#category : #meta-object-protocol,
	#timestamp : ' 8/31/2017 07:16:35'
}
ToManyRelationSlot>>wantsInitalization [
	^ true
]
