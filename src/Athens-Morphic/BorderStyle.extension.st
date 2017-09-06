Extension {
	#name : #BorderStyle
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
BorderStyle>>asAthensPaintOn: anAthensCanvas [
	| stroke |
	stroke := self color asStrokePaintOn: anAthensCanvas.
	stroke width: self width.
	stroke joinMiter.
	^ stroke
]
