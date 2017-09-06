"
I'm a Set like collection that is used to hold collections of associated objects. When an object is added to or removed from this collection the inverse side is also updated.
"
Class {
	#name : #RelationSet,
	#superclass : #Collection,
	#instVars : [
		'owner',
		'slot',
		'set'
	],
	#category : #Slot-Examples-Associations,
	#timestamp : 'JanVanDeSandt 2/27/2015 11:25'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:35'
}
RelationSet class>>owner: anObject slot: aToManyAssociation [

	^self new initializeOwner: anObject slot: aToManyAssociation 
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:16:35'
}
RelationSet>>add: anObject [

	(self includes: anObject)
		ifTrue: [ ^anObject ].
		
	slot add: anObject to: owner.
	^set add: anObject
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:35'
}
RelationSet>>copy [

	^Set new 
		addAll: self;
		yourself
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:35'
}
RelationSet>>do: aBlock  [
	"Evaluate aBlock with each of the receiver's elements as the argument."

	set do: aBlock
]

{
	#category : #initailize-release,
	#timestamp : ' 8/31/2017 07:16:35'
}
RelationSet>>initializeOwner: anObject slot: aToManyAssociation [

	owner := anObject.
	slot := aToManyAssociation.
	set := Set new
]

{
	#category : #internal,
	#timestamp : ' 8/31/2017 07:16:35'
}
RelationSet>>inverseAdd: anObject [

	^set add: anObject
]

{
	#category : #internal,
	#timestamp : ' 8/31/2017 07:16:35'
}
RelationSet>>inverseRemove: anObject [

	^set remove: anObject
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 07:16:35'
}
RelationSet>>remove: oldObject ifAbsent: aBlock [

	(set includes: oldObject)
		ifFalse: [ ^aBlock value ].
		
	slot remove: oldObject from: owner.
	^set remove: oldObject ifAbsent: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
RelationSet>>size [
	^set ifNil: [0] ifNotNil: [ set size ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
RelationSet>>species [

	^Set
]
