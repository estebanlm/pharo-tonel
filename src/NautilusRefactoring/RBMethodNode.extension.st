Extension {
	#name : #RBMethodNode
}

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMethodNode>>executeRenameRefactoringBy: aNautilusRefactoring [

	aNautilusRefactoring renameMessageFor: self
]
