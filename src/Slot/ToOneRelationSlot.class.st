"
I'm an relation slot  that  describes the one or zero side of an association.
"
Class {
	#name : #ToOneRelationSlot,
	#superclass : #RelationSlot,
	#category : #Slot-Examples-Associations,
	#timestamp : 'JanVanDeSandt 2/27/2015 11:26'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ToOneRelationSlot>>isToOneSlot [

	^true
]

{
	#category : #meta-object-protocol,
	#timestamp : ' 8/31/2017 07:16:35'
}
ToOneRelationSlot>>write: newValue to: anObject [

	| oldValue |

	oldValue := self read: anObject.
	newValue notNil
		ifTrue: [ self checkValue: newValue ].
	self hasInverse 
		ifTrue: [ 
			oldValue notNil
				ifTrue: [ self removeAssociationFrom: anObject to: oldValue ].
			newValue notNil
				ifTrue: [ self addAssociationFrom: anObject to: newValue ] ].
		
	super write: newValue to: anObject
]

{
	#category : #internal,
	#timestamp : ' 8/31/2017 07:16:35'
}
ToOneRelationSlot>>writeInverse: newValue to: anObject [
	^anObject instVarAt: index put: newValue
]
