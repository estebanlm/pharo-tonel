"
I am a refactoring for removing an instance variable. My changes are executed on the instance or class side.
"
Class {
	#name : #RBRemoveInstanceVariableChange,
	#superclass : #RBRefactoryVariableChange,
	#category : #Refactoring-Changes,
	#timestamp : 'NicolaiHess 9/9/2016 20:41'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemoveInstanceVariableChange>>asUndoOperation [
	^ RBRefactoryChangeManager changeFactory addInstanceVariable: self variable to: self changeClass
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemoveInstanceVariableChange>>changeString [
	^ 'Remove instance variable <1s> from <2s>' 
		expandMacrosWith: self variable
		with: self displayClassName
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemoveInstanceVariableChange>>changeSymbol [
	^ #removeInstVarNamed:
]
