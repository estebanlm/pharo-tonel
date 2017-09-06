"

"
Class {
	#name : #RBRemoveMethodTest,
	#superclass : #RBRefactoringTest,
	#category : #Refactoring-Tests-Core,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRemoveMethodTest>>expectedFailures [
	^ #(testRemoveSameMethodButSendsSuper)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRemoveMethodTest>>testModelRecursiveMethodThatIsNotReferencedFromOtherMethods [
	| class otherClass |
	class := model classNamed: #Object.
	class compile: 'someMethodThatIsNotReferenced ^2' classified: #(#accessing).
	self assert: (class definesMethod: #someMethodThatIsNotReferenced).
	otherClass := model metaclassNamed: self class superclass name.
	otherClass 
		compile: 'someMethodThatIsNotReferenced ^3 someMethodThatIsNotReferenced'
		classified: #(#accessing).
	model removeClassNamed: self class name.
	self executeRefactoring: (RBRemoveMethodRefactoring 
				model: model
				removeMethods: #(#someMethodThatIsNotReferenced)
				from: class).
	self deny: (class definesMethod: #someMethodThatIsNotReferenced)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRemoveMethodTest>>testRemoveMethod [
	| refactoring selectors |
	selectors := Array with: ('selectorNot' , 'Referenced') asSymbol.
	refactoring := RBRemoveMethodRefactoring 
		removeMethods: selectors
		from: RBRefactoryTestDataApp.
	self assert: ((refactoring model classNamed: #RBRefactoryTestDataApp) directlyDefinesMethod: selectors first).
	self executeRefactoring: refactoring.
	self deny: ((refactoring model classNamed: #RBRefactoryTestDataApp) directlyDefinesMethod: selectors first)
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRemoveMethodTest>>testRemoveReferenced [
	self shouldFail: (RBRemoveMethodRefactoring 
			removeMethods: #(#checkClass: )
			from: RBBasicLintRuleTest)
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRemoveMethodTest>>testRemoveSameMethodButSendsSuper [
	self shouldWarn: (RBRemoveMethodRefactoring 
			removeMethods: #(#new )
			from: RBBasicLintRuleTest class)
]
