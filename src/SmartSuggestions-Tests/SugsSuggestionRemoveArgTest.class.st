"
SUnit tests for the remove argument suggestion
"
Class {
	#name : #SugsSuggestionRemoveArgTest,
	#superclass : #SugsSuggestionTest,
	#category : #SmartSuggestions-Tests,
	#timestamp : 'TorstenBergmann 2/3/2014 23:44'
}

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionRemoveArgTest>>testRemoveArgsWithArgsItsValid [
	| suggestion |

	suggestion := SugsSuggestionFactory createRemoveParameter context: (SugsMockContext withMessageName: 'methodNoParamas:'  ); yourself.
	
	self assert: suggestion isValidForContext
	
]

{
	#category : #methods,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionRemoveArgTest>>testRemoveArgsWithoutArgsItsNotValid [
	| suggestion |

	suggestion := SugsSuggestionFactory createRemoveParameter context: (SugsMockContext withMessageName: 'methodNoParamas' ); yourself.
		
	self deny: suggestion isValidForContext
]
