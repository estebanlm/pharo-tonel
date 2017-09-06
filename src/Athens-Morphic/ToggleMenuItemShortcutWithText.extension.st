Extension {
	#name : #ToggleMenuItemShortcutWithText
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
ToggleMenuItemShortcutWithText>>drawOnAthensCanvas: aCanvas [
	| keyBounds |
	
	keyBounds := self boundsForKeyText: self keyText font: self owner fontToUse.
	self owner
		drawText: keyText
		onAthensCanvas: aCanvas
		in: keyBounds
		color: self owner theme disabledTextColor
]
