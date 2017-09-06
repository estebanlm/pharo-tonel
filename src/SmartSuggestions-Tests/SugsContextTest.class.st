"
SUnit tests for the Smart suggestions context
"
Class {
	#name : #SugsContextTest,
	#superclass : #TestCase,
	#category : #SmartSuggestions-Tests,
	#timestamp : 'TorstenBergmann 2/3/2014 23:43'
}

{
	#category : #valid-context,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsContextTest>>testContextForNautilusItsANautilusContext [
	| nautilus |
	
	nautilus := NautilusUI new.
	self assert: (SugsAbstractContext contextFor: nautilus) class equals: SugsNautilusContext.
]

{
	#category : #valid-context,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsContextTest>>testDebuggerIsAValidContext [
	| debugger |
	
	debugger := Smalltalk tools debugger new.
	self assert: (SugsAbstractContext contextFor: debugger) class equals: SugsDebuggerContext .
]

{
	#category : #valid-context,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsContextTest>>testTetModelIsAValidContext [
	| textModel |
	
	(textModel := TextModel new)
		beForCode.
	self assert: (SugsAbstractContext contextFor: textModel) class equals: SugsMessageBrowserContext.
]
