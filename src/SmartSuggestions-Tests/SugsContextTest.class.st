"
SUnit tests for the Smart suggestions context
"
Class {
	#name : #SugsContextTest,
	#superclass : #TestCase,
	#category : #SmartSuggestions-Tests
}

{ #category : #valid-context }
SugsContextTest >> testContextForNautilusItsANautilusContext [
	| nautilus |
	
	nautilus := NautilusUI new.
	self assert: (SugsAbstractContext contextFor: nautilus) class equals: SugsNautilusContext.
]

{ #category : #valid-context }
SugsContextTest >> testDebuggerIsAValidContext [
	| debugger |
	
	debugger := Smalltalk tools debugger new.
	self assert: (SugsAbstractContext contextFor: debugger) class equals: SugsDebuggerContext .
]

{ #category : #valid-context }
SugsContextTest >> testTetModelIsAValidContext [
	| textModel |
	
	(textModel := TextModel new)
		beForCode.
	self assert: (SugsAbstractContext contextFor: textModel) class equals: SugsMessageBrowserContext.
]
