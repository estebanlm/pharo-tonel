"
I represent a key for looking up entries in a data structure. Subclasses of me, such as Association, typically represent dictionary entries.
"
Class {
	#name : #LookupKey,
	#superclass : #Magnitude,
	#instVars : [
		'key'
	],
	#category : #Collections-Support,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:56'
}
LookupKey class>>key: aKey  [
	"Answer an instance of me with the argument as the lookup up."

	^self basicNew key: aKey
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:56'
}
LookupKey>>< aLookupKey  [
	"Refer to the comment in Magnitude|<."

	^key < aLookupKey key
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:56'
}
LookupKey>>= aLookupKey [

	self species = aLookupKey species
		ifTrue: [^key = aLookupKey key]
		ifFalse: [^false]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:56'
}
LookupKey>>hash [
	"Hash is reimplemented because = is implemented."

	^key hash
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:56'
}
LookupKey>>isVariableBinding [
	"Return true if I represent a literal variable binding"
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
LookupKey>>key [
	"Answer the lookup key of the receiver."

	^key
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
LookupKey>>key: anObject  [
	"Store the argument, anObject, as the lookup key of the receiver."

	key := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
LookupKey>>name [

	^ self key isString
		ifTrue: [self key]
		ifFalse: [self key printString]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:56'
}
LookupKey>>printOn: aStream [

	key printOn: aStream
]
