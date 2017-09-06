"
I represent a pair of associated objects--a key and a value. My instances can serve as entries in a dictionary.


Implementation notes: 
Note that hash is not redefined even if the = was redefined because Association>>hash may cause extreme slowdowns in compiling Unicode methods. Association>>hash does not need to hash the value; it's slow and useless.


"
Class {
	#name : #Association,
	#superclass : #LookupKey,
	#instVars : [
		'value'
	],
	#category : #Collections-Support,
	#timestamp : 'StephaneDucasse 2/13/2010 15:13'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:56'
}
Association class>>key: newKey value: newValue [
	"Answer an instance of me with the arguments as the key and value of 
	the association."

	^self basicNew key: newKey value: newValue
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:56'
}
Association>>= anAssociation [

	^ super = anAssociation and: [value = anAssociation value]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:56'
}
Association>>analogousCodeTo: anAssociation [
	^ self = anAssociation
]

{
	#category : #'self evaluating',
	#timestamp : ' 8/31/2017 07:16:56'
}
Association>>isSelfEvaluating [
	^ self class == Association and: [self key isSelfEvaluating and: [self value isSelfEvaluating]]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:56'
}
Association>>isSpecial [
	"Implemented here so we can use simple Assocications as Bindings instead of LiteralVariable
	subclasses"
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
Association>>key: aKey value: anObject  [
	"Store the arguments as the variables of the receiver."

	key := aKey.
	value := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:56'
}
Association>>literalEqual: otherLiteral [
	"Answer true if the receiver and otherLiteral represent the same literal.
	Variable bindings are literally equals only if identical.
	This is how variable sharing works, by preserving identity and changing only the value."
	^self == otherLiteral
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:56'
}
Association>>printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: '->'.
	value printOn: aStream
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:56'
}
Association>>storeOn: aStream [
	"Store in the format (key->value)"
	aStream nextPut: $(.
	key storeOn: aStream.
	aStream nextPutAll: '->'.
	value storeOn: aStream.
	aStream nextPut: $)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
Association>>value [
	"Answer the value of the receiver."

	^value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
Association>>value: anObject  [
	"Store the argument, anObject, as the value of the receiver."

	value := anObject
]
