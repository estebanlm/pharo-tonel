"
I am a refactoring for moving a class variable down to my subclasses.

My precondition verifies that the moved variable is not referenced in the methods of the original class.
"
Class {
	#name : #RBPushDownClassVariableRefactoring,
	#superclass : #RBVariableRefactoring,
	#instVars : [
		'destinationClass'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 21:22'
}

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPushDownClassVariableRefactoring>>findDestinationClass [
	| classes |
	classes := class withAllSubclasses reject: [ :each |
		(each whichSelectorsReferToClassVariable: variableName) isEmpty
			and: [ (each theMetaClass whichSelectorsReferToClassVariable: variableName) isEmpty ] ].
	destinationClass := classes isEmpty 
		ifTrue: [ nil ]
		ifFalse: [ classes asOrderedCollection first ].
	classes do: [ :each | 
		(destinationClass includesClass: each) 
			ifTrue: [ destinationClass := each ]
				ifFalse: [
					(each includesClass: destinationClass) 
						ifFalse: [ self signalMultipleReferenceError ] ] ].
	destinationClass = class 
		ifTrue: [ self signalStillReferencedError ].
	^ destinationClass
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPushDownClassVariableRefactoring>>preconditions [
	"Preconditions are that only one subclass refers to the class variable."

	^(RBCondition definesClassVariable: variableName in: class) 
		& (RBCondition withBlock: 
					[self findDestinationClass.
					true])
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPushDownClassVariableRefactoring>>signalMultipleReferenceError [
	self signalReferenceError: ('Multiple subclasses reference <1s>' 
				expandMacrosWith: variableName)
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPushDownClassVariableRefactoring>>signalReferenceError: errorString  [
	class realClass isNil 
		ifTrue: [ self refactoringError: errorString ]
		ifFalse: [| classVarName error |
			error := '<1s><n>Browse references?' expandMacrosWith: errorString.
			classVarName := variableName asSymbol.
			self 
				refactoringError: error
				with: [ self openBrowserOn: (RBVariableEnvironment 
						referencesToClassVariable: classVarName
						in: class realClass)]]
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPushDownClassVariableRefactoring>>signalStillReferencedError [
	self signalReferenceError: ('<1p> has references to <2s>' 
				expandMacrosWith: class
				with: variableName)
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPushDownClassVariableRefactoring>>transform [
	class removeClassVariable: variableName.
	destinationClass isNil ifTrue: [^self].
	destinationClass addClassVariable: variableName
]
