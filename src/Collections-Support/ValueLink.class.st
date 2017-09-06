"
A ValueLink is a Link containing a Value.
Adding an object to a LinkedList which is not a Link will create a ValueLink containing that object.


value - The object this link points to.
"
Class {
	#name : #ValueLink,
	#superclass : #Link,
	#instVars : [
		'value'
	],
	#category : #Collections-Support,
	#timestamp : 'HenrikSperreJohansen 10/18/2009 15:57'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:56'
}
ValueLink class>>value:	 aValue [
	^self new value: aValue
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:56'
}
ValueLink>>= anotherObject [
	^self species == anotherObject species 
		and: [self value = anotherObject value 
				and: [self nextLink == anotherObject nextLink]]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:56'
}
ValueLink>>hash [
	^self value hash bitXor: nextLink identityHash 

]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:56'
}
ValueLink>>printOn: aStream [
	aStream nextPutAll: 'ValueLink('.
	value printOn: aStream.
	aStream nextPut: $)

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
ValueLink>>value [
	^value 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
ValueLink>>value: aValue [
	value := aValue
]
