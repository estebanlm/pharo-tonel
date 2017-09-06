"
SUnit test for the push down suggestions
"
Class {
	#name : #SugsSuggestionPushDownTest,
	#superclass : #SugsSuggestionTest,
	#category : #SmartSuggestions-Tests,
	#timestamp : 'TorstenBergmann 2/3/2014 23:44'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionPushDownTest>>createContext: subclass [
	
	^SugsMockContext for: subclass .
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionPushDownTest>>createSubclassFrom: superClass named: symbol [
	| newClass |
	
	newClass := superClass 
					subclass: symbol
					instanceVariableNames: ''
					classVariableNames: ''
					poolDictionaries: ''
					category: 'SmartSuggestions-Test'.
	^newClass.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionPushDownTest>>createSuggestionPushDown: context [
	
	^ SugsSuggestionFactory createPushDown 
		context:context;
		yourself.
]

{
	#category : #method,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionPushDownTest>>testPushDownWithSubclassIsValid [
	| suggestion subclass |

	subclass := self createSubclassFrom: self emptyClass named: #TestSuggestionsSubclass.
	self addMethodToDelegate.
	suggestion := self createSuggestionPushDown: (self createContext: self emptyClass ).
	
	self assert: suggestion isValidForContext.
	self removeClass: subclass.
]

{
	#category : #method,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionPushDownTest>>testPushDownWithoutSubclassIsNotValid [
	| suggestion |

	self addMethodToDelegate.
	suggestion := self createSuggestionPushDown: (self createContext: self emptyClass ).
	
	self deny: suggestion isValidForContext
]
