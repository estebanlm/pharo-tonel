"
I am a refactoring for adding new class variables.

My precondition verifies that the variable name is valid, not yet used in the whole hierarchy and not a global name.
"
Class {
	#name : #RBAddClassVariableRefactoring,
	#superclass : #RBVariableRefactoring,
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 5/21/2016 19:55'
}

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAddClassVariableRefactoring>>preconditions [
	^(RBCondition isMetaclass: class) not 
		& (RBCondition isValidClassVarName: variableName for: class) 
			& (RBCondition hierarchyOf: class definesVariable: variableName asString) 
					not 
			& (RBCondition isGlobal: variableName in: self model) not
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBAddClassVariableRefactoring>>transform [
	class addClassVariable: variableName
]
