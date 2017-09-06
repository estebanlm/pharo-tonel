Extension {
	#name : #RBMessageNode
}

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMessageNode>>executeRenameRefactoringBy: aNautilusRefactoring [

	aNautilusRefactoring renameMessageFor: self
]
