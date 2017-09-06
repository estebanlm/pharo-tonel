"
I represent the execution of a ""rename class"" (RBRenameClassRefactoring) refactoring.
"
Class {
	#name : #EpRenameClassRefactoring,
	#superclass : #EpRefactoring,
	#instVars : [
		'newName',
		'oldName'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 15:19'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRenameClassRefactoring class>>rename: oldName to: newName [
	^ self basicNew
		initializeFrom: oldName
		to: newName;
		yourself
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRenameClassRefactoring>>asRBRefactoring [
	^ RBRenameClassRefactoring
		rename: oldName
		to: newName
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRenameClassRefactoring>>initializeFrom: anOldName to: aNewName [
	self initialize.
	
	oldName := anOldName.
	newName := aNewName.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRenameClassRefactoring>>newName [
	^ newName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRenameClassRefactoring>>oldName [
	^ oldName
]
