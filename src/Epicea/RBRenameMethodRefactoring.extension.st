Extension {
	#name : #RBRenameMethodRefactoring
}

{
	#category : #'*Epicea-Refactorings',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenameMethodRefactoring>>asEpiceaEvent [
	^ EpRenameMethodRefactoring 
		renameMethod: oldSelector 
		in: class name
		to: newSelector
]

{
	#category : #'*Epicea-Refactorings',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenameMethodRefactoring>>propagateTransformation [
	self renameMessageSends
]
