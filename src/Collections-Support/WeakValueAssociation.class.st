"
I am a lookup key (acting like an association but) holding only weakly on my value.
"
Class {
	#name : #WeakValueAssociation,
	#superclass : #LookupKey,
	#type : #weak,
	#category : #Collections-Support,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:56'
}
WeakValueAssociation class>>key: anObject value: bObject [
	^ self new key: anObject value: bObject
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:56'
}
WeakValueAssociation class>>new [
	^ self new: 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
WeakValueAssociation>>key: aKey value: anObject  [
	"Store the arguments as the variables of the receiver."

	key := aKey.
	self value: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
WeakValueAssociation>>value [
	^self at: 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
WeakValueAssociation>>value: anObject  [
	"Store the argument, anObject, as the value of the receiver."

	self at: 1 put: anObject
]
