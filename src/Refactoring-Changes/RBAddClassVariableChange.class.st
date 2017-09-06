"
I am a refactoring for a class variable addition. My changes are executed on the instance side.
"
Class {
	#name : #RBAddClassVariableChange,
	#superclass : #RBRefactoryVariableChange,
	#category : #Refactoring-Changes,
	#timestamp : 'NicolaiHess 9/9/2016 20:40'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddClassVariableChange>>asUndoOperation [
	^ RBRefactoryChangeManager changeFactory
		removeClassVariable: self variable
		from: self changeClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddClassVariableChange>>changeClass: aBehavior [
	super changeClass: aBehavior.
	isMeta := false
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddClassVariableChange>>changeString [
	^ 'Add class variable <1s> to <2s>' 
		expandMacrosWith: self variable
		with: self displayClassName
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddClassVariableChange>>changeSymbol [
	^ #addClassVarNamed:
]
