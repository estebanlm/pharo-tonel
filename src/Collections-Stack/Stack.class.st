"
I implement a simple Stack. #push: adds a new object of any kind on top of the stack. #pop returns the first element and remove it from the stack. #top answer the first element of the stack without removing it.
"
Class {
	#name : #Stack,
	#superclass : #LinkedList,
	#category : #Collections-Stack,
	#timestamp : 'dc 7/24/2005 15:41'
}

{
	#category : #removing,
	#timestamp : ' 8/31/2017 07:16:20'
}
Stack>>pop [
	"Returns the first element and remove it from the stack."

	^self  removeFirst 
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:16:20'
}
Stack>>push: anObject  [
	"Adds a new object of any kind on top of the stack."
	self addFirst: anObject.
	^ anObject.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
Stack>>top [
	"Answer the first element of the stack without removing it."
	^ self first
]
