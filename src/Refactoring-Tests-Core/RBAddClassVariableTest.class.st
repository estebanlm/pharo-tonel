"

"
Class {
	#name : #RBAddClassVariableTest,
	#superclass : #RBRefactoringTest,
	#category : #Refactoring-Tests-Core,
	#timestamp : ''
}

{
	#category : #'set up',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddClassVariableTest>>setUp [
	super setUp.
	model := self abstractVariableTestData.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddClassVariableTest>>testAddClassVariable [
	| refactoring |
	refactoring := RBAddClassVariableRefactoring 
		variable: 'Asdf'
		class: RBTransformationRuleTest.
	self executeRefactoring: refactoring.
	self assert: ((refactoring model classNamed: #RBTransformationRuleTest) directlyDefinesClassVariable: #Asdf)
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddClassVariableTest>>testAlreadyExistingName [
	self
		shouldFail: (RBAddClassVariableRefactoring 
				variable: #RecursiveSelfRule
				class: RBTransformationRuleTest);
		shouldFail: (RBAddClassVariableRefactoring 
				variable: self objectClassVariable
				class: RBTransformationRuleTest)
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddClassVariableTest>>testMetaClassFailure [
	self shouldFail: (RBAddClassVariableRefactoring 
			variable: #VariableName
			class: RBTransformationRuleTest class)
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddClassVariableTest>>testMetaclass [
	| refactoring |
	refactoring := RBAddClassVariableRefactoring 
		variable: #ClassVarName3
		class: (model classNamed: #Object) theMetaClass.
	refactoring model: model.
	self shouldFail: refactoring
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddClassVariableTest>>testModelAddClassVariable [
	| refactoring |
	refactoring := RBAddClassVariableRefactoring 
				model: model
				variable: #ClassVarName3
				class: (model classNamed: #Bar).
	self executeRefactoring: refactoring.
	self assert: ((model classNamed: #Bar) 
				directlyDefinesClassVariable: #ClassVarName3)
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddClassVariableTest>>testModelAlreadyExistingName [
	| refactoring |
	refactoring := RBAddClassVariableRefactoring 
				model: model
				variable: #ClassVarName2
				class: (model classNamed: #Bar).
	self shouldFail: refactoring
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddClassVariableTest>>testModelMetaclass [
	| refactoring |
	refactoring := RBAddClassVariableRefactoring 
		model: model
		variable: #ClassVarName3
		class: (model classNamed: #Bar) theMetaClass.
	self shouldFail: refactoring
]
