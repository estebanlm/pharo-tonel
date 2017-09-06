Extension {
	#name : #RBTemporaryNode
}

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBTemporaryNode>>executeRenameRefactoringBy: aNautilusRefactoring [

	aNautilusRefactoring renameTemporaryNamed: self name asString Between: (self start to: self stop) from: self methodNode
]
