Extension {
	#name : #RBInstanceVariableNode
}

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBInstanceVariableNode>>executeRenameRefactoringBy: aNautilusRefactoring [

	aNautilusRefactoring renameInstVarNamed: self name asString from: self methodNode methodClass
]
