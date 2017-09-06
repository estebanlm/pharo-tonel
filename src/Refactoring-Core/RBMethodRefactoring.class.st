"
I am an abstract base class for method refactorings.

I only provide a helper method for generating  selector names.
"
Class {
	#name : #RBMethodRefactoring,
	#superclass : #RBRefactoring,
	#instVars : [
		'class'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 21:36'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethodRefactoring>>buildSelectorString: aSelector  [
	aSelector numArgs = 0 ifTrue: [^aSelector].
	^self buildSelectorString: aSelector
		withPermuteMap: (1 to: aSelector numArgs)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBMethodRefactoring>>buildSelectorString: aSelector withPermuteMap: anIntegerCollection  [
	| stream keywords |
	aSelector numArgs == 0 ifTrue: [^aSelector asString].
	stream := WriteStream on: String new.
	keywords := aSelector keywords.
	keywords with: anIntegerCollection
		do: 
			[:each :i | 
			stream
				nextPutAll: each;
				nextPutAll: ' ``@arg';
				nextPutAll: i printString;
				nextPut: $ ].
	^stream contents
]
