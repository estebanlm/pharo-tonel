Extension {
	#name : #RBProgramNode
}

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBProgramNode>>executeRenameRefactoringBy: aNautilusRefactoring [

	self inform: self class name, ' not supports rename'
]
