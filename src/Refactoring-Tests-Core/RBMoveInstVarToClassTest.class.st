"

"
Class {
	#name : #RBMoveInstVarToClassTest,
	#superclass : #RBRefactoringTest,
	#category : #Refactoring-Tests-Core,
	#timestamp : ''
}

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBMoveInstVarToClassTest>>testMoveInstVarToClassAlreadyDefined [
	self
		shouldFail:
			(RBMoveInstVarToClassRefactoring
				model: model
				variable: 'result'
				class: RBBasicLintRuleTest
				oldClass: RBFooLintRuleTest)
]
