"
I am intended to be used in place of two arg sort blocks.

Usage

In the following example, an ascending SortFunction is created based on the result of the #first message send to each object.
#(#(1 2) #(2 3) #(0 0)) sorted: #first ascending.

To sort by the #last element, but descending, the following would be used:
#(#(1 2) #(2 3) #(0 0)) sorted: #last descending.

One can use blocks as well. The following sorts in descending order, the sub elements based on the sum of their values.
| sumBlock |
sumBlock := [:sequence | sequence inject: 0 into: [:sum :each | sum + each]].
#(#(1 2) #(2 3) #(0 0)) sorted: sumBlock descending.

One can even use 2 arg blocks, for those cases where the function isn't expressible with objects that respond to < and =. The only catch, is that such a function has to return not true and false, but instead a collation order, values of -1 (for before), 0 (the same) or 1 (to follow). For example:

| oddBlock |
oddBlock :=
		[:a :b |
		a odd = b odd ifTrue: [0] ifFalse: [a odd ifTrue: [-1] ifFalse: [1]]].
#(1 5 1 3 2 7 9 4 6) asSortedCollection: oddBlock descending

Using #undefinedFirst and #undefinedLast it is possible to deal with nil values, moving them first or last. For Example:

#(a nil z b) sorted: #value ascending undefinedFirst.
#(a nil z b) sorted: #value ascending undefinedLast.

Instance Variables
	collator	<BlockClosure>	This is the collation function that must return a -1, 0, or 1. It is usually composed by an initialization method such as sendMessage: or monadicBlock:, but may be set directly.
	direction	<SmallInteger>	1 for ascending, -1 for descending


"
Class {
	#name : #SortFunction,
	#superclass : #Object,
	#instVars : [
		'direction',
		'collator',
		'undefinedDirection'
	],
	#category : #SortFunctions-Core
}

{ #category : #'instance creation' }
SortFunction class >> ascend [

	^self new ascend
]

{ #category : #'instance creation' }
SortFunction class >> descend [

	^self new descend
]

{ #category : #converting }
SortFunction >> , aSortFunction [
	"Return a new SortFunction which is the concatenation of aSortFunction to me, I will be the primary sort, but if I compare equal, I will defer to the argument."

	^(ChainedSortFunction new)
		collator: collator;
		direction: direction;
		next: aSortFunction asSortFunction
]

{ #category : #converting }
SortFunction >> asSortFunction [

	^self
]

{ #category : #initailize-release }
SortFunction >> ascend [

	direction := 1
]

{ #category : #evaluating }
SortFunction >> collate: aValue with: bValue [
	^ self hasUndefinedDirection
		ifTrue: [ 
			aValue isNil
				ifTrue: [ undefinedDirection * direction ]
				ifFalse: [ 
					bValue isNil
						ifTrue: [ undefinedDirection negated * direction ]
						ifFalse: [ aValue threeWayCompareTo: bValue ] ] ]
		ifFalse: [ aValue threeWayCompareTo: bValue ]
]

{ #category : #initailize-release }
SortFunction >> collator: a2ArgBlock [
	"a2ArgBlock MUST return the collation order, -1, 0, or 1"

	collator := a2ArgBlock
]

{ #category : #initailize-release }
SortFunction >> descend [

	direction := -1
]

{ #category : #initailize-release }
SortFunction >> direction: anInteger [

	direction := anInteger
]

{ #category : #testing }
SortFunction >> hasUndefinedDirection [

	^undefinedDirection notNil
]

{ #category : #testing }
SortFunction >> isAscending [

	^direction = 1
]

{ #category : #testing }
SortFunction >> isDescending [

	^direction = -1
]

{ #category : #testing }
SortFunction >> isUndefinedFirst [

	^undefinedDirection = -1
]

{ #category : #testing }
SortFunction >> isUndefinedLast [

	^undefinedDirection = 1
]

{ #category : #initailize-release }
SortFunction >> monadicBlock: aSingleArgBlock [
	"Initialze the receiver's collation block to compare the results of evaluating aSingleArgBlock with each argument, and then collate the return values with the <=> method."

	collator := [:a :b | self collate: (aSingleArgBlock value: a) with: (aSingleArgBlock value: b)]
]

{ #category : #initailize-release }
SortFunction >> sendMessage: aUnarySymbol [
	"Initialze the receiver's collation block to compare the results of sending aUnarySymbol to each argument, and then collate them with the <=> method."

	collator := [ :a :b | self collate: (a perform: aUnarySymbol) with: (b perform: aUnarySymbol) ]
]

{ #category : #converting }
SortFunction >> toggleDirection [
	"Invert my current direction, if I'm currently ascending, this will cause me to be descending now, and vice-versa."

	direction := direction * -1
]

{ #category : #initailize-release }
SortFunction >> undefinedFirst [

	undefinedDirection := -1
]

{ #category : #initailize-release }
SortFunction >> undefinedLast [

	undefinedDirection := 1
]

{ #category : #evaluating }
SortFunction >> value: anObject [ value: bObject
	"Masquerade as a two argument block, used by many of the sorting APIs, by returning whether anObject should be placed before bObject or not."

	| result |
	result := (collator value: anObject value: bObject) * direction.
	^result <= 0
]
