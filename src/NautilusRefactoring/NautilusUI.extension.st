Extension {
	#name : #NautilusUI
}

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusUI>>basicRenameClass: aClass [
	" Override to set the class rename with RB by default "

	self renameClassWithRefactoringEngine: aClass
]

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusUI>>refactor [

	^ NautilusRefactoring model: self
]

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusUI>>refactorCode: aText [
	acceptor := CodeRefactoringAcceptor model: self.
	self sourceCode: aText
]

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusUI>>removeClassWithRefactoringEngine: aCollection [

	^ self refactor removeClasses: aCollection 
]

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusUI>>renameClassWithRefactoringEngine: aClass [

	self refactor renameClass: aClass 
]

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusUI>>rewriteCode: aText [

	acceptor := CodeRewritingAcceptor model: self.
	self sourceCode: aText
]

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
NautilusUI>>searchCode: aText [
	acceptor := CodeSearchingAcceptor model: self.
	self setStylerClass: nil.
	self pendingText: aText
]
