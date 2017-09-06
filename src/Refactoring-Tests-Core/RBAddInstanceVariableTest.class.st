"

"
Class {
	#name : #RBAddInstanceVariableTest,
	#superclass : #RBRefactoringTest,
	#category : #Refactoring-Tests-Core,
	#timestamp : ''
}

{
	#category : #'set up',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddInstanceVariableTest>>setUp [
	super setUp.
	model := self abstractVariableTestData.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddInstanceVariableTest>>testAddInstanceVariable [
	| refactoring |
	refactoring := RBAddInstanceVariableRefactoring 
		variable: 'asdf'
		class: RBTransformationRuleTest.
	self executeRefactoring: refactoring.
	self assert: ((refactoring model classNamed: #RBTransformationRuleTest) directlyDefinesInstanceVariable: 'asdf')
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddInstanceVariableTest>>testAddToModel [
	| refactoring |
	model := RBClassModelFactory rbNamespace new.
	model name: 'Add instance variable'.
	model 
		defineClass: 'Object subclass: #FOOBAR 
				instanceVariableNames: ''fdsa'' 	
				classVariableNames: ''''
				poolDictionaries: ''''
				category: #''Refactory-Test data'''.
	refactoring := RBAddInstanceVariableRefactoring 
				model: model
				variable: 'asdf'
				class: (model classNamed: #FOOBAR).
	self executeRefactoring: refactoring.
	self assert: ((refactoring model classNamed: #FOOBAR) 
				directlyDefinesInstanceVariable: 'asdf')
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddInstanceVariableTest>>testAlreadyExistingName [
	self
		shouldFail: (RBAddInstanceVariableRefactoring 
				variable: 'class'
				class: RBTransformationRuleTest);
		shouldFail: (RBAddInstanceVariableRefactoring 
				variable: 'name'
				class: RBTransformationRuleTest)
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddInstanceVariableTest>>testModelAlreadyExistingName [
	| refactoring |
	refactoring := RBAddInstanceVariableRefactoring 
				model: model
				variable: 'instVarName1'
				class: (model classNamed: #Bar).
	self shouldFail: refactoring
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddInstanceVariableTest>>testModelMetaclassAlreadyExistingName [
	| refactoring |
	(model metaclassNamed: #Foo) addInstanceVariable: 'instVarName1'.
	refactoring := RBAddInstanceVariableRefactoring 
				model: model
				variable: 'instVarName1'
				class: (model classNamed: #Bar).
	self shouldFail: refactoring
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddInstanceVariableTest>>testNewExistingName [
	| refactoring |
	model := RBClassModelFactory rbNamespace new.
	model name: 'Add instance variable'.
	model 
		defineClass: 'Object subclass: #FOOBAR 
				instanceVariableNames: ''asdf'' 	
				classVariableNames: ''''
				poolDictionaries: ''''
				category: #''Refactory-Test data'''.
	refactoring := RBAddInstanceVariableRefactoring 
				model: model
				variable: 'asdf'
				class: (model classNamed: #FOOBAR).
	self shouldFail: refactoring
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBAddInstanceVariableTest>>testNewHierarchyExistingName [
	| refactoring |
	model := RBClassModelFactory rbNamespace new.
	model name: 'Add instance variable'.
	model 
		defineClass: 'Object subclass: #FOOBAR 
				instanceVariableNames: ''asdf'' 	
				classVariableNames: ''''
				poolDictionaries: ''''
				category: #''Refactory-Test data'''.
	model 
		defineClass: 'FOOBAR subclass: #BARFOO 
				instanceVariableNames: '''' 	
				classVariableNames: ''''
				poolDictionaries: ''''
				category: ''Refactory-Test data'''.
	refactoring := RBAddInstanceVariableRefactoring 
				model: model
				variable: 'asdf'
				class: (model classNamed: #BARFOO).
	self shouldFail: refactoring
]
