Extension {
	#name : #PasteUpMorph
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
PasteUpMorph>>drawOnAthensCanvas: aCanvas  [
	"Draw in order:
	- background color
	- background sketch, if any
	- Update and draw the turtleTrails form. See the comment in updateTrailsForm.

	Later (in drawSubmorphsOn:) I will skip drawing the background sketch."

	"draw background fill"
	super drawOnAthensCanvas: aCanvas.

	backgroundMorph ifNotNil: [
		aCanvas clipBy: self clippingBounds
			during: [ aCanvas fullDrawMorph: backgroundMorph ]
	]				

]
