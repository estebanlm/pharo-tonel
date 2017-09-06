"
FLPerson is a class just to be able to change the hash of an object and try to test problems with hash.
"
Class {
	#name : #FLPerson,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : #FuelTests-Mocks,
	#timestamp : 'MarianoMartinezPeck 5/19/2011 23:51'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPerson>>= anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ id = anObject id
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPerson>>hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ id
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPerson>>id [
	^ id
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLPerson>>id: anObject [
	id := anObject
]
