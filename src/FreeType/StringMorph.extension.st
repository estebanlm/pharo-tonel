Extension {
	#name : #StringMorph
}

{
	#category : #'*FreeType-override',
	#timestamp : ' 8/31/2017 05:26:12'
}
StringMorph>>changeFont [
	| newFont chooser |
	chooser := FontChooser 
		windowTitle: 'Choose a Font' 
		for: self 
		setSelector: #font: 
		getSelector: self fontToUse.
	self openModal: chooser.
	newFont := chooser result.
	newFont ifNotNil: [self font: newFont].
]
