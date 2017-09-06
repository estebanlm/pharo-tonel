Extension {
	#name : #MessageBrowser
}

{
	#category : #'*MessageBrowserRefactoringAddition',
	#timestamp : ' 8/31/2017 05:26:21'
}
MessageBrowser>>browsedEnvironment [
	^ browsedEnvironment ifNil: [ browsedEnvironment := RBBrowserEnvironment new ]
]

{
	#category : #'*MessageBrowserRefactoringAddition',
	#timestamp : ' 8/31/2017 05:26:21'
}
MessageBrowser class>>methodRefactoringSubMenu: aBuilder [
	<messageBrowserListMenu>
	| target |
	target := aBuilder model.
	target selectedMethod ifNil: [ ^ target ].
	aBuilder model selectedClass methodRefactoring: aBuilder
]

{
	#category : #'*MessageBrowserRefactoringAddition',
	#timestamp : ' 8/31/2017 05:26:21'
}
MessageBrowser>>refactor [
	^ NautilusRefactoring model: self
]

{
	#category : #'*MessageBrowserRefactoringAddition',
	#timestamp : ' 8/31/2017 05:26:21'
}
MessageBrowser class>>refactoringMethodMenu: aBuilder [
	<messageBrowserListMenu>
	| target |
	target := aBuilder model.
	target selectedMethod ifNil: [ ^ target ].
	aBuilder model selectedClass refactoringMethod: aBuilder
]
