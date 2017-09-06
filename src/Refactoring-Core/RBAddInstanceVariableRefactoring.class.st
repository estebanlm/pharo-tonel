"
I am a refactoring for adding new instance variables.

My precondition verifies that the variable name is valid, not yet used in the whole hierarchy and not a global name.
"
Class {
	#name : #RBAddInstanceVariableRefactoring,
	#superclass : #RBVariableRefactoring,
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 19:56'
}

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAddInstanceVariableRefactoring>>preconditions [
	^(RBCondition isValidInstanceVariableName: variableName for: class) 
		& (RBCondition hierarchyOf: class definesVariable: variableName) not 
			& (RBCondition isGlobal: variableName in: self model) not
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAddInstanceVariableRefactoring>>transform [
	class addInstanceVariable: variableName
]
