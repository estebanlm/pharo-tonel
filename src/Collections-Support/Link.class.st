"
An instance of me is a simple record of a pointer to another Link. I am an abstract class; my concrete subclasses, for example, Process, can be stored in a LinkedList structure.
"
Class {
	#name : #Link,
	#superclass : #Object,
	#instVars : [
		'nextLink'
	],
	#category : #Collections-Support,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:56'
}
Link class>>nextLink: aLink  [
	"Answer an instance of me referring to the argument, aLink."

	^self new nextLink: aLink; yourself
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:56'
}
Link>>asLink [
	^self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
Link>>nextLink [
	"Answer the link to which the receiver points."

	^nextLink
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
Link>>nextLink: aLink  [
	"Store the argument, aLink, as the link to which the receiver refers. 
	Answer aLink."

	^nextLink := aLink
]
