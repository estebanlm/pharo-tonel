Extension {
	#name : #EmbeddedMenuMorph
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
EmbeddedMenuMorph>>drawOnAthensCanvas: anAthensCanvas [
	"Draw the receiver on the canvas."

	self perform: #drawOnAthensCanvas: withArguments: {anAthensCanvas} inSuperclass: Morph.
	self hasKeyboardFocus ifTrue: [self drawKeyboardFocusOnAthensCanvas: anAthensCanvas]
]
