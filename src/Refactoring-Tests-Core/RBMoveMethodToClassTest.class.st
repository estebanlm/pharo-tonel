"

"
Class {
	#name : #RBMoveMethodToClassTest,
	#superclass : #RBRefactoringTest,
	#category : #Refactoring-Tests-Core,
	#timestamp : ''
}

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBMoveMethodToClassTest>>testMethodAlreadyDefined [
	| method someClass |
	someClass := model classNamed: #RBFooLintRuleTest.
	method := RBClassModelFactory rbMethod for: someClass source: 'foo' , String cr , String tab , '^ 6' selector: #foo.
	self shouldFail: (RBMoveMethodToClassRefactoring method: method class: someClass)
]
