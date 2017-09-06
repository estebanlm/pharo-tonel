"
This is the chapter of the refactoring help book about source code refactorings available from System Browsers code pane.
"
Class {
	#name : #RBBrowserSourceRefactoringHelp,
	#superclass : #RBBrowserSupportHelp,
	#category : #Refactoring-Help,
	#timestamp : 'NicolaiHess 7/27/2016 21:38'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
RBBrowserSourceRefactoringHelp class>>bookName [
	^ 'Source Refactorings'
]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:44'
}
RBBrowserSourceRefactoringHelp class>>createCascadeRefactoring [
	^HelpTopic
		title: 'Create cascade'
		contents: RBCreateCascadeRefactoring comment

]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:44'
}
RBBrowserSourceRefactoringHelp class>>extractMethodRefactoring [
	^HelpTopic
		title: 'Extract method'
		contents: RBExtractMethodRefactoring comment

]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:44'
}
RBBrowserSourceRefactoringHelp class>>extractMethodToComponentRefactoring [
	^HelpTopic
		title: 'Extract method to component'
		contents: RBExtractMethodToComponentRefactoring comment

]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:44'
}
RBBrowserSourceRefactoringHelp class>>extractToTemporaryRefactoring [
	^HelpTopic
		title: 'Extract to temporary'
		contents: RBExtractToTemporaryRefactoring comment

]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:44'
}
RBBrowserSourceRefactoringHelp class>>inlineMethodFromComponentRefactoring [
	^HelpTopic
		title: 'Inline method from component'
		contents: RBInlineMethodFromComponentRefactoring comment

]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:44'
}
RBBrowserSourceRefactoringHelp class>>inlineMethodRefactoring [
	^HelpTopic
		title: 'Inline method'
		contents: RBInlineMethodRefactoring comment

]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:44'
}
RBBrowserSourceRefactoringHelp class>>inlineTemporaryRefactoring [
	^HelpTopic
		title: 'Inline temporary'
		contents: RBInlineTemporaryRefactoring comment

]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:44'
}
RBBrowserSourceRefactoringHelp class>>moveTemporaryToInstvarRefactoring [
	^HelpTopic
		title: 'Move temporary to instvar'
		contents: RBTemporaryToInstanceVariableRefactoring comment.

]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:44'
}
RBBrowserSourceRefactoringHelp class>>moveVariableDefinitionRefactoring [
	^HelpTopic
		title: 'Move variable definition'
		contents: RBMoveVariableDefinitionRefactoring comment

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
RBBrowserSourceRefactoringHelp class>>pages [
	^ #(createCascadeRefactoring extractMethodRefactoring extractMethodToComponentRefactoring extractToTemporaryRefactoring inlineMethodRefactoring inlineMethodFromComponentRefactoring inlineTemporaryRefactoring moveVariableDefinitionRefactoring renameTemporaryRefactoring splitCascadeRefactoring moveTemporaryToInstvarRefactoring)
]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:44'
}
RBBrowserSourceRefactoringHelp class>>renameTemporaryRefactoring [
	^HelpTopic
		title: 'Rename temporary/parameter'
		contents: RBRenameTemporaryRefactoring comment

]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:44'
}
RBBrowserSourceRefactoringHelp class>>splitCascadeRefactoring [
	^HelpTopic
		title: 'Split cascade'
		contents: RBSplitCascadeRefactoring comment

]
