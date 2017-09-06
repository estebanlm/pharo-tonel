Extension {
	#name : #PluggableButtonMorph
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
PluggableButtonMorph>>drawSubmorphsOnAthensCanvas: anAthensCanvas [
	super 	drawSubmorphsOnAthensCanvas: anAthensCanvas.
	self hasKeyboardFocus ifTrue: [self drawKeyboardFocusOnAthensCanvas: anAthensCanvas].

]
