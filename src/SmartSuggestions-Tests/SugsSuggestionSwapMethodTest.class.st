"
SUnit tests for the swap method suggestion
"
Class {
	#name : #SugsSuggestionSwapMethodTest,
	#superclass : #SugsSuggestionTest,
	#category : #SmartSuggestions-Tests,
	#timestamp : 'TorstenBergmann 2/3/2014 23:44'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionSwapMethodTest>>testLabelForSwapClassMethodRefersToInstance [

	| sugg |
	sugg := SugsSuggestionFactory createSwapMethod.
	sugg context: SugsMockContext methodClassContext.
	
	self assert: sugg label equals: 'Move to instance side' translated.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionSwapMethodTest>>testLabelForSwapInstanceMethodRefersToClass [
	| sugg |
	sugg := SugsSuggestionFactory createSwapMethod.
	sugg context: SugsMockContext methodContext.
	
	self assert: sugg label equals: 'Move to class side' translated.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionSwapMethodTest>>testLabelForSwapWithoutSelectedMethodIsGeneric [
	| sugg |
	sugg := SugsSuggestionFactory createSwapMethod.
	sugg context: SugsMockContext new.
	
	self assert: sugg label equals: 'Swap method' translated.
]
