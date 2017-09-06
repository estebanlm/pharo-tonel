Extension {
	#name : #RBRenameClassRefactoring
}

{
	#category : #'*Epicea-Refactorings',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenameClassRefactoring>>asEpiceaEvent [
	^ EpRenameClassRefactoring 
		rename: className
		to: newName
]

{
	#category : #'*Epicea-Refactorings',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenameClassRefactoring>>propagateTransformation [
	self renameReferences
]
