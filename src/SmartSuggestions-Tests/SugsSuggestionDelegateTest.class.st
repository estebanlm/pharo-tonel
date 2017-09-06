"
SUnit tests for smart suggestions delegates
"
Class {
	#name : #SugsSuggestionDelegateTest,
	#superclass : #SugsSuggestionTest,
	#category : #SmartSuggestions-Tests,
	#timestamp : 'TorstenBergmann 2/3/2014 23:43'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionDelegateTest>>createContexForDelegate [
	^ SugsMockContext for: self emptyClass
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionDelegateTest>>createSuggestionDelegate: context [
	| suggestion |

	suggestion  := SugsSuggestionFactory createMoveMethod .
	suggestion context: context.
	^suggestion.
	

]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionDelegateTest>>testDelegateSelectionWithInstaceVariablesItsValid [
	| suggestion |

	self addVariable: 'test' to: self emptyClass.
	self addMethodToDelegate.
	suggestion := self createSuggestionDelegate: self createContexForDelegate .
	
	self assert: suggestion isValidForContext
]

{
	#category : #source,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionDelegateTest>>testDelegateSelectionWithoutInstaceVariablesItsNotValid [
	| suggestion |
	
	self addMethodToDelegate.
	suggestion := self createSuggestionDelegate: self createContexForDelegate.
	
	self deny: suggestion isValidForContext
]
