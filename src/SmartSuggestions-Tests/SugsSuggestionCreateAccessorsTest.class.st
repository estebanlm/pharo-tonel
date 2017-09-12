"
SUnit tests for accessor creation
"
Class {
	#name : #SugsSuggestionCreateAccessorsTest,
	#superclass : #SugsSuggestionTest,
	#category : #SmartSuggestions-Tests
}

{ #category : #private }
SugsSuggestionCreateAccessorsTest >> createSuggestionAccesorsClassVar: context [
	| suggestion |

	suggestion  := SugsSuggestionFactory createAccessors.
	suggestion context: context.
	^suggestion.
]

{ #category : #private }
SugsSuggestionCreateAccessorsTest >> createSuggestionAccesorsInstVar: context [
	| suggestion |

	suggestion  := SugsSuggestionFactory createAccesorsFor.
	suggestion context: context.
	^suggestion.
]

{ #category : #private }
SugsSuggestionCreateAccessorsTest >> targetFor: varName in: aClass [
	^ varName first isUppercase 
		ifTrue: [ aClass class ] ifFalse: [aClass].

]

{ #category : #inst-var }
SugsSuggestionCreateAccessorsTest >> testCreateAccessorsIsNotValidIfAccessorsAreAlreadyCreated [
	| suggestion context |
	
	self addVariable: 'test' to: self emptyClass.
	self createAccessorsFor: 'test' in: self emptyClass.
	context := self createContext: 'test'.
	suggestion := self createSuggestionAccesorsInstVar: context.
	
	self deny: suggestion isValidForContext
]

{ #category : #inst-var }
SugsSuggestionCreateAccessorsTest >> testCreateAccessorsIsValidIfAccessIsMissed [
	| suggestion context |
	
	self addVariable: 'test' to: self emptyClass.
	self createSetter: 'test' in: self emptyClass.
	context := self createContext: 'test'.
	suggestion := self createSuggestionAccesorsInstVar: context.
	
	self assert: suggestion isValidForContext.

]

{ #category : #inst-var }
SugsSuggestionCreateAccessorsTest >> testCreateAccessorsIsValidIfAccessorsAreMissed [
	| suggestion context |
	
	self addVariable: 'test' to: self emptyClass.
	context := self createContext: 'test'.
	suggestion := self createSuggestionAccesorsInstVar: context.
	
	self assert: suggestion isValidForContext.
	
]

{ #category : #inst-var }
SugsSuggestionCreateAccessorsTest >> testCreateAccessorsIsValidIfMuttatorMissed [
	| suggestion context |
	
	self addVariable: 'test' to: self emptyClass .
	self createGetter: 'test' in: self emptyClass .
	
	context := self createContext: 'test'.
	suggestion := self createSuggestionAccesorsInstVar: context.

	self assert: suggestion isValidForContext.
	

]

{ #category : #class-var }
SugsSuggestionCreateAccessorsTest >> testCreateClassAccessorsIsNotValidIfAccessorsAreAlreadyCreated [
	| suggestion context |
	
	self addVariable: 'Test' to: self emptyClass.
	self createAccessorsFor: 'Test' in: self emptyClass.
	context := self createContext: 'Test'.
	suggestion := self createSuggestionAccesorsClassVar: context.
	
	self deny: suggestion isValidForContext
]

{ #category : #class-var }
SugsSuggestionCreateAccessorsTest >> testCreateClassAccessorsIsValidIfAccessIsMissed [
	| suggestion context |
	
	self addVariable: 'Test' to: self emptyClass.
	self createSetter: 'Test' in: self emptyClass.
	context := self createContext: 'Test'.
	suggestion := self createSuggestionAccesorsInstVar: context.
	
	self assert: suggestion isValidForContext.

]

{ #category : #class-var }
SugsSuggestionCreateAccessorsTest >> testCreateClassAccessorsIsValidIfAccessorsAreMissed [
	| suggestion context |
	
	self addVariable: 'Test' to: self emptyClass.
	context := self createContext: 'Test'.
	suggestion := self createSuggestionAccesorsInstVar: context.
	
	self assert: suggestion isValidForContext.
	
]

{ #category : #class-var }
SugsSuggestionCreateAccessorsTest >> testCreateClassAccessorsIsValidIfMuttatorMissed [
	| suggestion context |
	
	self addVariable: 'Test' to: self emptyClass .
	self createGetter: 'Test' in: self emptyClass .
	
	context := self createContext: 'Test'.
	suggestion := self createSuggestionAccesorsInstVar: context.

	self assert: suggestion isValidForContext.
	

]
