"

"
Class {
	#name : #RBRemoveParameterTest,
	#superclass : #RBRefactoringTest,
	#category : #Refactoring-Tests-Core,
	#timestamp : ''
}

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRemoveParameterTest>>testNonExistantName [
	self
		shouldFail: (RBRemoveParameterRefactoring 
				removeParameter: 'asdf'
				in: RBBasicLintRuleTest
				selector: #checkClass:);
		shouldFail: (RBRemoveParameterRefactoring 
				removeParameter: 'aSmalllintContext'
				in: RBBasicLintRuleTest
				selector: #checkClass1:)
]

{
	#category : #'failure tests',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRemoveParameterTest>>testPrimitiveMethods [
	| refactoring |
	(model classNamed: #Object) 
		compile: 'foo123: a <primitive: 100> ^#() primitiveFailed'
		classified: #(#accessing).
	refactoring := RBRemoveParameterRefactoring 
				model: model
				removeParameter: 'a'
				in: Object
				selector: #foo123:.
	self shouldFail: refactoring
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBRemoveParameterTest>>testRemoveParameter [
	| refactoring class |
	refactoring := RBRemoveParameterRefactoring 
		removeParameter: 'anArg'
		in: RBRefactoryTestDataApp
		selector: ('rename' , 'ThisMethod:') asSymbol.
	self executeRefactoring: refactoring.
	class := refactoring model classNamed: #RBRefactoryTestDataApp.
	self assert: (class parseTreeFor: #renameThisMethod) = (RBParser parseMethod: 'renameThisMethod
								^self').
	self assert: (class parseTreeFor: #callMethod) = (RBParser parseMethod: 'callMethod
								^(self renameThisMethod)').
	self deny: (class directlyDefinesMethod: ('rename' , 'ThisMethod:') asSymbol)
]
