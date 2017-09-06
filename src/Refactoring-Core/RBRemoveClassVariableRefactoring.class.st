"
I am a refactoring for removing class variables.

My precondition verifies that there is no reference to this class variable.
"
Class {
	#name : #RBRemoveClassVariableRefactoring,
	#superclass : #RBVariableRefactoring,
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 21:23'
}

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveClassVariableRefactoring>>preconditions [
	^ (RBCondition isMetaclass: class) not & (RBCondition 
			definesClassVariable: variableName
			in: class) & (RBCondition withBlock: 
			[ | block |
			block := 
			[ :each | 
			(each whichSelectorsReferToClassVariable: variableName) isEmpty ifFalse: 
				[ class realClass isNil 
					ifTrue: 
						[ self refactoringError: ('<1s> is referenced.' expandMacrosWith: variableName) ]
					ifFalse: 
						[ self 
							refactoringError: ('<1s> is referenced.<n>Browse references?' expandMacrosWith: variableName)
							with: 
								[ self openBrowserOn: (RBVariableEnvironment 
										referencesToClassVariable: variableName
										in: class realClass) ] ] ] ].
			class withAllSubclasses do: block.
			class theMetaClass withAllSubclasses do: block.
			true ])
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveClassVariableRefactoring>>transform [
	class removeClassVariable: variableName
]
