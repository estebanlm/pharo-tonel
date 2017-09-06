"

"
Class {
	#name : #RBCreateAccessorsForVariableTest,
	#superclass : #RBRefactoringTest,
	#category : #Refactoring-Tests-Core,
	#timestamp : ''
}

{
	#category : #'set up',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCreateAccessorsForVariableTest>>setUp [
	super setUp.
	model := self abstractVariableTestData.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCreateAccessorsForVariableTest>>testExistingInstanceVariableAccessors [
	| ref |
	ref := RBCreateAccessorsForVariableRefactoring 
		variable: 'name'
		class: RBLintRuleTest
		classVariable: false.
	self executeRefactoring: ref.
	self assert: ref changes changes isEmpty.
	self assert: ref setterMethod == #name:.
	self assert: ref getterMethod == #name
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCreateAccessorsForVariableTest>>testNewClassVariableAccessors [
	| ref class |
	ref := RBCreateAccessorsForVariableRefactoring 
		variable: 'Foo1'
		class: RBLintRuleTest
		classVariable: true.
	self executeRefactoring: ref.
	class := ref model metaclassNamed: #RBLintRuleTest.
	self deny: ref changes changes isEmpty.
	self assert: ref setterMethod == #foo1:.
	self assert: ref getterMethod == #foo1.
	self assert: (class parseTreeFor: #foo1) = (RBParser parseMethod: 'foo1 ^Foo1').
	self assert: (class parseTreeFor: #foo1:) = (RBParser parseMethod: 'foo1: anObject Foo1 := anObject')
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCreateAccessorsForVariableTest>>testNewInstanceVariableAccessors [
	| ref class |
	ref := RBCreateAccessorsForVariableRefactoring 
		variable: 'foo1'
		class: RBLintRuleTest
		classVariable: false.
	self executeRefactoring: ref.
	class := ref model classNamed: #RBLintRuleTest.
	self deny: ref changes changes isEmpty.
	self assert: ref setterMethod == #foo1:.
	self assert: ref getterMethod == #foo1.
	self assert: (class parseTreeFor: #foo1) = (RBParser parseMethod: 'foo1 ^foo1').
	self assert: (class parseTreeFor: #foo1:) = (RBParser parseMethod: 'foo1: anObject foo1 := anObject')
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCreateAccessorsForVariableTest>>testNonExistantName [
	self
		shouldFail: (RBCreateAccessorsForVariableRefactoring 
				variable: #Foo
				class: RBBasicLintRuleTest
				classVariable: true);
		shouldFail: (RBCreateAccessorsForVariableRefactoring 
				variable: 'foo'
				class: RBBasicLintRuleTest
				classVariable: true)
]
