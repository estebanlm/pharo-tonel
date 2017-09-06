"

"
Class {
	#name : #RBRemoveClassVariableTest,
	#superclass : #RBRefactoringTest,
	#category : #Refactoring-Tests-Core,
	#timestamp : ''
}

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRemoveClassVariableTest>>testNonExistantName [
	self shouldFail: (RBRemoveClassVariableRefactoring 
			variable: #RecursiveSelfRule1
			class: RBTransformationRuleTest)
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRemoveClassVariableTest>>testReferencedVariable [
	self shouldFail: (RBRemoveClassVariableRefactoring 
			variable: #RecursiveSelfRule
			class: RBTransformationRuleTest)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRemoveClassVariableTest>>testRemoveClassVar [
	| refactoring class |
	refactoring := RBRemoveClassVariableRefactoring 
		variable: 'Foo1'
		class: RBLintRuleTest.
	class := refactoring model classNamed: #RBLintRuleTest.
	self assert: (class definesClassVariable: 'Foo1').
	self executeRefactoring: refactoring.
	self deny: (class definesClassVariable: 'Foo1')
]
