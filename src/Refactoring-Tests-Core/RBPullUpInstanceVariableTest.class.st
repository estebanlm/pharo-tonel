"

"
Class {
	#name : #RBPullUpInstanceVariableTest,
	#superclass : #RBRefactoringTest,
	#category : #Refactoring-Tests-Core,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBPullUpInstanceVariableTest>>testPullUpInstVar [
	| refactoring |
	self proceedThroughWarning: 
		[ refactoring := RBPullUpInstanceVariableRefactoring 
			variable: 'result'
			class: RBLintRuleTest.
		self executeRefactoring: refactoring ].
	self assert: ((refactoring model classNamed: #RBLintRuleTest) directlyDefinesInstanceVariable: 'result').
	self deny: ((refactoring model classNamed: #RBBasicLintRuleTest) directlyDefinesInstanceVariable: 'result')
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBPullUpInstanceVariableTest>>testPullUpVariableNotDefined [
	self shouldFail: (RBPullUpInstanceVariableRefactoring 
			variable: 'notDefinedVariable'
			class: RBLintRuleTest)
]
