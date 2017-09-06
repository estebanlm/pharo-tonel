"
SUnit tests for accessor creation
"
Class {
	#name : #SugsSuggestionCreateAccessorsTest,
	#superclass : #SugsSuggestionTest,
	#category : #SmartSuggestions-Tests,
	#timestamp : 'TorstenBergmann 2/3/2014 23:43'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionCreateAccessorsTest>>createSuggestionAccesorsClassVar: context [
	| suggestion |

	suggestion  := SugsSuggestionFactory createAccessors.
	suggestion context: context.
	^suggestion.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionCreateAccessorsTest>>createSuggestionAccesorsInstVar: context [
	| suggestion |

	suggestion  := SugsSuggestionFactory createAccesorsFor.
	suggestion context: context.
	^suggestion.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionCreateAccessorsTest>>targetFor: varName in: aClass [
	^ varName first isUppercase 
		ifTrue: [ aClass class ] ifFalse: [aClass].

]

{
	#category : #inst-var,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionCreateAccessorsTest>>testCreateAccessorsIsNotValidIfAccessorsAreAlreadyCreated [
	| suggestion context |
	
	self addVariable: 'test' to: self emptyClass.
	self createAccessorsFor: 'test' in: self emptyClass.
	context := self createContext: 'test'.
	suggestion := self createSuggestionAccesorsInstVar: context.
	
	self deny: suggestion isValidForContext
]

{
	#category : #inst-var,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionCreateAccessorsTest>>testCreateAccessorsIsValidIfAccessIsMissed [
	| suggestion context |
	
	self addVariable: 'test' to: self emptyClass.
	self createSetter: 'test' in: self emptyClass.
	context := self createContext: 'test'.
	suggestion := self createSuggestionAccesorsInstVar: context.
	
	self assert: suggestion isValidForContext.

]

{
	#category : #inst-var,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionCreateAccessorsTest>>testCreateAccessorsIsValidIfAccessorsAreMissed [
	| suggestion context |
	
	self addVariable: 'test' to: self emptyClass.
	context := self createContext: 'test'.
	suggestion := self createSuggestionAccesorsInstVar: context.
	
	self assert: suggestion isValidForContext.
	
]

{
	#category : #inst-var,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionCreateAccessorsTest>>testCreateAccessorsIsValidIfMuttatorMissed [
	| suggestion context |
	
	self addVariable: 'test' to: self emptyClass .
	self createGetter: 'test' in: self emptyClass .
	
	context := self createContext: 'test'.
	suggestion := self createSuggestionAccesorsInstVar: context.

	self assert: suggestion isValidForContext.
	

]

{
	#category : #class-var,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionCreateAccessorsTest>>testCreateClassAccessorsIsNotValidIfAccessorsAreAlreadyCreated [
	| suggestion context |
	
	self addVariable: 'Test' to: self emptyClass.
	self createAccessorsFor: 'Test' in: self emptyClass.
	context := self createContext: 'Test'.
	suggestion := self createSuggestionAccesorsClassVar: context.
	
	self deny: suggestion isValidForContext
]

{
	#category : #class-var,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionCreateAccessorsTest>>testCreateClassAccessorsIsValidIfAccessIsMissed [
	| suggestion context |
	
	self addVariable: 'Test' to: self emptyClass.
	self createSetter: 'Test' in: self emptyClass.
	context := self createContext: 'Test'.
	suggestion := self createSuggestionAccesorsInstVar: context.
	
	self assert: suggestion isValidForContext.

]

{
	#category : #class-var,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionCreateAccessorsTest>>testCreateClassAccessorsIsValidIfAccessorsAreMissed [
	| suggestion context |
	
	self addVariable: 'Test' to: self emptyClass.
	context := self createContext: 'Test'.
	suggestion := self createSuggestionAccesorsInstVar: context.
	
	self assert: suggestion isValidForContext.
	
]

{
	#category : #class-var,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionCreateAccessorsTest>>testCreateClassAccessorsIsValidIfMuttatorMissed [
	| suggestion context |
	
	self addVariable: 'Test' to: self emptyClass .
	self createGetter: 'Test' in: self emptyClass .
	
	context := self createContext: 'Test'.
	suggestion := self createSuggestionAccesorsInstVar: context.

	self assert: suggestion isValidForContext.
	

]
