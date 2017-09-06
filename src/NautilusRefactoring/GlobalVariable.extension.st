Extension {
	#name : #GlobalVariable
}

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
GlobalVariable>>executeRenameRefactoringBy: aNautilusRefactoring inClass: aClass [
	aNautilusRefactoring renameClass: value 
]
