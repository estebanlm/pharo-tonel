"
Move a method from the class to the instance side, or vice versa. Normally this is not considered to be a refactoring.

Only instance methods with no instance variable access or class methods with no class instance variable access can be moved.
"
Class {
	#name : #RBSwapMethodRefactoring,
	#superclass : #RBMethodRefactoring,
	#instVars : [
		'target',
		'selector'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 8/6/2016 14:03'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBSwapMethodRefactoring class>>model: aRBSmalltalk swapMethod: aSelector in: aClass [
	^ self new 
		model: aRBSmalltalk;
		swapMethod: aSelector in: aClass;
		yourself
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBSwapMethodRefactoring class>>swapMethod: aSelector in: aClass [
	^ self new swapMethod: aSelector in: aClass
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBSwapMethodRefactoring>>checkInstVars [
	class instanceVariableNames do: [ :each |
		(target instanceVariableNames includes: each) ifFalse: [
			((class whichSelectorsReferToInstanceVariable: each) includes: selector) ifTrue: [
				self
					refactoringError: ('<1p> refers to <2s>, which is not defined in <3p>' expandMacrosWith: selector with: each with: target) ] ] ]
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBSwapMethodRefactoring>>preconditions [
	^ (RBCondition definesSelector: selector in: class)
		& (RBCondition definesSelector: selector in: target) not
		& (RBCondition withBlock: [ self checkInstVars. true ])
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBSwapMethodRefactoring>>swapMethod: aSelector in: aClass  [
	class := self classObjectFor: aClass.
	target := self classObjectFor: (class isMeta 
			ifTrue: [ class theNonMetaClass ]
			ifFalse: [ class theMetaClass ]).
	selector := aSelector
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBSwapMethodRefactoring>>transform [
	target compile: (class sourceCodeFor: selector) classified: (class protocolsFor: selector).
	class removeMethod: selector
]
