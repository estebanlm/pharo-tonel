"
I am a refactoring for moving a instance variable down to my subclasses.

My precondition verifies that the moved variable is not referenced in the methods of the original class.
"
Class {
	#name : #RBPushDownInstanceVariableRefactoring,
	#superclass : #RBVariableRefactoring,
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 21:22'
}

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPushDownInstanceVariableRefactoring>>preconditions [
	| references |
	references := RBCondition referencesInstanceVariable: variableName
				in: class.
	class realClass isNil 
		ifTrue: 
			[references 
				errorMacro: ('<1s> is referenced.' expandMacrosWith: variableName)]
		ifFalse: 
			[references
				errorMacro: ('<1s> is referenced.<n>Browse references?' 
							expandMacrosWith: variableName);
				errorBlock: 
						[self openBrowserOn: (RBBrowserEnvironment new instVarRefsTo: variableName
									in: class realClass)]].
	^(RBCondition definesInstanceVariable: variableName in: class) 
		& references not
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBPushDownInstanceVariableRefactoring>>transform [
	class removeInstanceVariable: variableName.
	class subclasses do: [:each | each addInstanceVariable: variableName]
]
