Extension {
	#name : #RBRenameInstanceVariableRefactoring
}

{
	#category : #'*Epicea-Refactorings',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenameInstanceVariableRefactoring>>asEpiceaEvent [
	^ EpRenameInstanceVariableRefactoring 
		rename: variableName
		to: newName
		in: class name
]

{
	#category : #'*Epicea-Refactorings',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenameInstanceVariableRefactoring>>propagateTransformation [
	self renameReferences
]
