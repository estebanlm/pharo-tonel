Extension {
	#name : #ThreePhaseButtonMorph
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
ThreePhaseButtonMorph>>drawOnAthensCanvas: anAthensCanvas [
	| paint |
	paint := offImage.
	
	state == #pressed
		ifTrue: [ paint := pressedImage ].
	state == #on
		ifTrue: [ paint := image ].
	paint ifNil: [ ^ self ].
	
	anAthensCanvas setPaint: paint.
	anAthensCanvas paintTransform
		restoreAfter: [ 
			anAthensCanvas paintTransform translateBy: self innerBounds origin.	
			anAthensCanvas drawShape: self innerBounds ]
]
