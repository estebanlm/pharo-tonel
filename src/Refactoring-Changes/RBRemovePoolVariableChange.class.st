"
I am a refactoring for removing a pool variable. My changes are executed on the instance side.
"
Class {
	#name : #RBRemovePoolVariableChange,
	#superclass : #RBRefactoryVariableChange,
	#category : #Refactoring-Changes,
	#timestamp : 'NicolaiHess 9/9/2016 20:41'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemovePoolVariableChange>>asUndoOperation [
	^ RBRefactoryChangeManager changeFactory addPoolVariable: self variable to: self changeClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemovePoolVariableChange>>changeClass: aBehavior [
	super changeClass: aBehavior.
	isMeta := false
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemovePoolVariableChange>>changeString [
	^ 'Remove pool variable <1s> from <2s>' 
		expandMacrosWith: self variable
		with: self displayClassName
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRemovePoolVariableChange>>changeSymbol [
	^ #removeSharedPool:
]
