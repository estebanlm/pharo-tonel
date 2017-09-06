Extension {
	#name : #RBRenameVariableChange
}

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenameVariableChange>>nameToDisplay [

	^ 'Rename ', self oldName, ' into ', self newName
]

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenameVariableChange>>textToDisplay [

	self printString
]

{
	#category : #'*NautilusRefactoring',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBRenameVariableChange>>whatToDisplayIn: aChangeBrowser [

	| result |
	result := OrderedCollection with: self.
	^ result, (self changes flatCollect: [:e | e changes ])
]
