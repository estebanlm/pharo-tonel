"
I am a refactoring for a pool  variable addition. My changes are executed on the instance side.
"
Class {
	#name : #RBAddPoolVariableChange,
	#superclass : #RBRefactoryVariableChange,
	#category : #Refactoring-Changes,
	#timestamp : 'NicolaiHess 9/9/2016 20:40'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddPoolVariableChange>>asUndoOperation [
	^ RBRefactoryChangeManager changeFactory removePoolVariable: self variable from: self changeClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddPoolVariableChange>>changeClass: aBehavior [
	super changeClass: aBehavior.
	isMeta := false
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddPoolVariableChange>>changeString [
	^ 'Add pool variable <1s> to <2s>' 
		expandMacrosWith: self variable
		with: self displayClassName
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBAddPoolVariableChange>>changeSymbol [
	^ #addSharedPool:
]
