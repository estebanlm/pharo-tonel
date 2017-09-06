Extension {
	#name : #RBGlobalNode
}

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBGlobalNode>>executeRenameRefactoringBy: aNautilusRefactoring [

	self binding variable executeRenameRefactoringBy: aNautilusRefactoring inClass: self methodNode methodClass
]
