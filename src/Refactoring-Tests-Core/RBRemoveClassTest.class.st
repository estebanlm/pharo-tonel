"

"
Class {
	#name : #RBRemoveClassTest,
	#superclass : #RBRefactoringTest,
	#category : #Refactoring-Tests-Core,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRemoveClassTest>>resumeOnCannotRemoveTopLevelClassError: error [
	^ error messageText = RBRemoveClassRefactoring cannotRemoveTopLevelClassErrorMesssage
		ifTrue: [ error resume ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRemoveClassTest>>testRaisesRBRefactoringErrorWhenRemovingNonEmptySuperclass [
	self shouldFail: (RBRemoveClassRefactoring classNames: (Array with: ('RBFoo' , 'LintRuleTest') asSymbol))
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRemoveClassTest>>testRemoveClassWithBadNameRaisesRBRefactoringError  [
	self 
		shouldFail: (RBRemoveClassRefactoring classNames: #(#RecursiveSelfRule))
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRemoveClassTest>>testRemoveClassWithReferencesRaisesRBRefactoringError [
	self shouldFail: (RBRemoveClassRefactoring classNames: #(#RBBasicLintRuleTest ))
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRemoveClassTest>>testRemoveEmptySuperclass [
	| refactoring |
	refactoring := RBRemoveClassRefactoring classNames: (Array with: ('RBFoo' , 'LintRuleTest1') asSymbol).
	self executeRefactoring: refactoring.
	self assert: (refactoring model classNamed: ('RBFoo' , 'LintRuleTest1') asSymbol) isNil.
	self assert: (refactoring model classNamed: #RBTransformationRuleTest1) superclass = (refactoring model classNamed: #RBLintRuleTest)
]
