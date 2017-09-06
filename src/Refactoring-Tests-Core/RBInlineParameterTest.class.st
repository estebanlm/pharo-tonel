"

"
Class {
	#name : #RBInlineParameterTest,
	#superclass : #RBRefactoringTest,
	#category : #Refactoring-Tests-Core,
	#timestamp : ''
}

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBInlineParameterTest>>testInlineBlockFailure [
	self shouldFail: (RBInlineParameterRefactoring 
			inlineParameter: 'aBlock'
			in: RBRefactoryTestDataApp
			selector: ('inline' , 'Foo:') asSymbol)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBInlineParameterTest>>testInlineLiteralArray [
	| refactoring class |
	refactoring := RBInlineParameterRefactoring 
		inlineParameter: 'aSymbol'
		in: RBRefactoryTestDataApp
		selector: ('inline' , 'ParameterMethod:') asSymbol.
	self executeRefactoring: refactoring.
	class := refactoring model classNamed: #RBRefactoryTestDataApp.
	self assert: (class parseTreeFor: #inlineParameterMethod) = (RBParser parseMethod: 'inlineParameterMethod | aSymbol | aSymbol := #(asdf). ^aSymbol isSymbol').
	self assert: (class parseTreeFor: #sendInlineParameterMethod) = (RBParser parseMethod: 'sendInlineParameterMethod ^self inlineParameterMethod').
	self deny: (class directlyDefinesMethod: ('inline' , 'ParameterMethod:') asSymbol)
]
