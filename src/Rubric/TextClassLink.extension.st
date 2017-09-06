Extension {
	#name : #TextClassLink
}

{
	#category : #'*Rubric-Editing-Core',
	#timestamp : ' 8/31/2017 05:26:20'
}
TextClassLink>>rubActOnClick: anEvent for: target in: aParagraph editor: anEditor [
	anEvent shiftPressed
		ifFalse: [ anEditor editor browseClassFrom: self className ]
		ifTrue: [ anEditor editor referencesTo: self className ].
	^ true
]
