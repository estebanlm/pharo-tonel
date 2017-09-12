"
I add to my parent the idea of a ""next"" function to use when two objects are equal by my particular collator.

Usage

SortFunctions can be chained together in primary, secondary, tertiary, etc order using the comma method. Consider a sequence of customer objects, where each customer object responds to the messages firstName, lastName, and age. If we want to sort them lastName first, then firstName, and finally oldest first, we would use an expression like:

customers sort: #lastName ascending, #firstName ascending, #age descending

As noted in my super's comment, unary symbols or single arg blocks can be used. One can omit the the ascending methods on arguments (not the receiver), it will default blocks or symbols to be ascending if none is specified. In other words, the above expression could be simplified slightly as

customers sort: #lastName ascending, #firstName, #age descending

(note the missing ascending on the #firstName argument)

Instance Variables
	next	<SortFunction>	the next SortFunction to evaluate in the event my evaluator results in equal values.


"
Class {
	#name : #ChainedSortFunction,
	#superclass : #SortFunction,
	#instVars : [
		'next'
	],
	#category : #SortFunctions-Core
}

{ #category : #converting }
ChainedSortFunction >> , aSortFunction [

	self next: next , aSortFunction
]

{ #category : #initialize-release }
ChainedSortFunction >> next: anObject [

	next := anObject
]

{ #category : #evaluating }
ChainedSortFunction >> value: anObject [ value: bObject
	"Refinement of the parent behavior. If the result of my collator is 0, then pass on to the next variable to work it out."

	| result |
	result := (collator value: anObject value: bObject) * direction.
	^result isZero
		ifTrue: [next value: anObject value: bObject]
		ifFalse: [result < 0]
]
