Extension {
	#name : #ClassVariable
}

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
ClassVariable>>executeRenameRefactoringBy: aNautilusRefactoring inClass: aClass [
	aNautilusRefactoring renameClassVarNamed: self name from: aClass
]
