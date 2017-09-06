"
I represent the execution of a ""rename instance variable"" (RBRenameInstanceVariableRefactoring) refactoring.
"
Class {
	#name : #EpRenameInstanceVariableRefactoring,
	#superclass : #EpRefactoring,
	#instVars : [
		'newName',
		'oldName',
		'affectedClassName'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 15:19'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRenameInstanceVariableRefactoring class>>rename: oldName to: newName in: affectedClassName [
	^ self basicNew 
		initializeIn: affectedClassName
		from: oldName 
		to: newName;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRenameInstanceVariableRefactoring>>affectedClassName [
	^ affectedClassName
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRenameInstanceVariableRefactoring>>asRBRefactoring [
	^ RBRenameInstanceVariableRefactoring 
		rename: oldName 
		to: newName 
		in: affectedClassName
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRenameInstanceVariableRefactoring>>initializeIn: aClassName from:  anOldName to: aNewName [
	self initialize.

	affectedClassName := aClassName.
	newName := aNewName.
	oldName := anOldName.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRenameInstanceVariableRefactoring>>newName [
	^ newName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRenameInstanceVariableRefactoring>>oldName [
	^ oldName
]
