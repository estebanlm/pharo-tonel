"
I represent the execution of a ""rename method"" (RBRenameMethodRefactoring) refactoring.
"
Class {
	#name : #EpRenameMethodRefactoring,
	#superclass : #EpRefactoring,
	#instVars : [
		'oldSelector',
		'newSelector',
		'affectedClassName'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 15:20'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRenameMethodRefactoring class>>renameMethod: oldSelector in: affectedClassName to: newSelector [
	^ self basicNew
		initializeFrom: oldSelector 
		to: newSelector 
		in: affectedClassName;
		yourself
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRenameMethodRefactoring>>asRBRefactoring [
	^ RBRenameMethodRefactoring
		renameMethod: oldSelector 
		in: affectedClassName 
		to: newSelector 
		permutation: #()
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRenameMethodRefactoring>>initializeFrom: anOldSelector to: aNewSelector in: aClassName [
	self initialize.
	
	oldSelector := anOldSelector.
	newSelector := aNewSelector.
	affectedClassName := aClassName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRenameMethodRefactoring>>newSelector [
	^ newSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRenameMethodRefactoring>>oldSelector [
	^ oldSelector
]
