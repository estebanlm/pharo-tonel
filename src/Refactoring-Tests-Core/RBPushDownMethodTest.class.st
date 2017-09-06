"

"
Class {
	#name : #RBPushDownMethodTest,
	#superclass : #RBRefactoringTest,
	#category : #Refactoring-Tests-Core,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBPushDownMethodTest>>testPushDownMethod [
	| refactoring class |
	refactoring := RBPushDownMethodRefactoring 
		pushDown: #(#name: )
		from: RBLintRuleTest.
	self executeRefactoring: refactoring.
	class := refactoring model classNamed: #RBLintRuleTest.
	self deny: (class directlyDefinesMethod: #name:).
	class subclasses do: 
		[ :each | 
		self assert: (each parseTreeFor: #name:) = (RBParser parseMethod: 'name: aString name := aString') ]
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBPushDownMethodTest>>testPushDownMethodOnNonAbstractClass [
	| refactoring |
	refactoring := RBPushDownMethodRefactoring pushDown: #(#isArray) from: Array.
	self shouldFail: refactoring
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBPushDownMethodTest>>testPushDownMethodThatReferencesPoolDictionary [
	| refactoring class parseTree |
	parseTree := RBLintRuleTest parseTreeFor: #junk.
	self proceedThroughWarning: 
		[ refactoring := RBPushDownMethodRefactoring 
			pushDown: #(#junk )
			from: RBLintRuleTest.
		self executeRefactoring: refactoring ].
	class := refactoring model classNamed: #RBLintRuleTest.
	self deny: (class directlyDefinesMethod: #junk).
	class subclasses do: 
		[ :each | 
		self assert: (each parseTreeFor: #junk) = parseTree.
		self assert: (each directlyDefinesPoolDictionary: 'TextConstants' asSymbol) ]
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBPushDownMethodTest>>testPushDownNonExistantMenu [
	| refactoring |
	refactoring := RBPushDownMethodRefactoring 
		pushDown: #(#someMethodThatDoesNotExist )
		from: RBLintRuleTest.
	self shouldFail: refactoring
]
