"
I am a refactoring for a instance  variable addition. My changes are executed on the instance or class side.
"
Class {
	#name : #RBAddInstanceVariableChange,
	#superclass : #RBRefactoryVariableChange,
	#category : #Refactoring-Changes,
	#timestamp : 'NicolaiHess 9/9/2016 20:40'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddInstanceVariableChange>>asUndoOperation [
	^ RBRefactoryChangeManager changeFactory removeInstanceVariable: self variable from: self changeClass
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddInstanceVariableChange>>changeString [
	^ 'Add instance variable <1s> to <2s>'
		expandMacrosWith: self variable
		with: self displayClassName
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddInstanceVariableChange>>changeSymbol [
	^ #addInstVarNamed:
]
