"

"
Class {
	#name : #RBAddMethodTest,
	#superclass : #RBRefactoringTest,
	#category : #Refactoring-Tests-Core,
	#timestamp : ''
}

{
	#category : #'set up',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddMethodTest>>setUp [
	super setUp.
	model := self abstractVariableTestData.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddMethodTest>>testAddMethod [
	| refactoring |
	refactoring := RBAddMethodRefactoring 
		addMethod: 'printString1 ^super printString'
		toClass: RBBasicLintRuleTest
		inProtocols: #(#accessing ).
	self executeRefactoring: refactoring.
	self assert: ((refactoring model classNamed: #RBBasicLintRuleTest) parseTreeFor: #printString1) = (RBParser parseMethod: 'printString1 ^super printString')
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddMethodTest>>testBadMethod [
	self shouldFail: (RBAddMethodRefactoring 
			addMethod: 'asdf ^super ^printString'
			toClass: RBBasicLintRuleTest
			inProtocols: #(#accessing ))
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddMethodTest>>testExistingSelector [
	self shouldFail: (RBAddMethodRefactoring 
			addMethod: 'printString ^super printString'
			toClass: RBBasicLintRuleTest
			inProtocols: #(#accessing ))
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddMethodTest>>testModelAddMethod [
	| refactoring class |
	class := model metaclassNamed: #Bar.
	refactoring := RBAddMethodRefactoring 
				model: model
				addMethod: 'printString1 ^super printString'
				toClass: class
				inProtocols: #(#accessing).
	self executeRefactoring: refactoring.
	self assert: (class parseTreeFor: #printString1) 
				= (RBParser parseMethod: 'printString1 ^super printString')
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddMethodTest>>testModelExistingSelector [
	| refactoring |
	refactoring := RBAddMethodRefactoring 
				model: model
				addMethod: 'classVarName1 ^super printString'
				toClass: (model classNamed: #Bar)
				inProtocols: #(#accessing).
	self shouldFail: refactoring
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddMethodTest>>testModelInheritedSelector [
	| refactoring |
	refactoring := RBAddMethodRefactoring 
				model: model
				addMethod: 'printString ^super printString'
				toClass: (model classNamed: #Bar)
				inProtocols: #(#accessing).
	self shouldFail: refactoring
]
