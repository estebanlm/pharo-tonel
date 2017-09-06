Extension {
	#name : #Morph
}

{
	#category : #'*Morphic-Widgets-ColorPicker',
	#timestamp : ' 8/31/2017 05:26:14'
}
Morph>>changeColor [
	
	| dialog |
	dialog := ColorSelectorDialogWindow new
		title: 'Choose color';
		selectedColor: self color.
	self openModal: dialog.
	dialog cancelled
		ifFalse: [self fillStyle: dialog selectedColor]
	
	
]

{
	#category : #'*Morphic-Widgets-ColorPicker',
	#timestamp : ' 8/31/2017 05:26:14'
}
Morph>>scaledIntoFormOfSize: aSmallInteger  [
	^ self imageForm scaledIntoFormOfSize: aSmallInteger 
]
