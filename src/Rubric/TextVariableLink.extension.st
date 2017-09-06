Extension {
	#name : #TextVariableLink
}

{
	#category : #'*Rubric-Editing-Core',
	#timestamp : ' 8/31/2017 05:26:20'
}
TextVariableLink>>rubActOnClick: anEvent for: aNautilusUI in: aParagraph editor: anEditor [
	anEditor editor referencesTo: self variableName.
	^ true
]
