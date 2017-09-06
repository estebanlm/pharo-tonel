"
I am a refactoring for removing instance variables.

My precondition verifies that there is no reference to this instance  variable.
"
Class {
	#name : #RBRemoveInstanceVariableRefactoring,
	#superclass : #RBVariableRefactoring,
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 21:23'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveInstanceVariableRefactoring class>>model: aNamespace remove: variable from: class [
	^ self model: aNamespace variable: variable class: class
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveInstanceVariableRefactoring class>>remove: variable from: class [
	^ self variable: variable class: class
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveInstanceVariableRefactoring>>preconditions [
	| references |
	references := RBCondition hierarchyOf: class
				referencesInstanceVariable: variableName.
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
	^(RBCondition definesInstanceVariable: variableName asString in: class) 
		& references not
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveInstanceVariableRefactoring>>transform [
	class removeInstanceVariable: variableName
]
