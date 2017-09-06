Extension {
	#name : #CompositeBorder
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
CompositeBorder>>asAthensPaintOn: anAthensCanvas [
	^ AthensCompositeStrokePaint new fromBorderStyles: borders on: anAthensCanvas
]
