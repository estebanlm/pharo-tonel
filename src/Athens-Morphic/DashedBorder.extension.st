Extension {
	#name : #DashedBorder
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
DashedBorder>>asAthensPaintOn: anAthensCanvas [
	^ AthensCompositeStrokePaint new fromDashedBorderStyle: self on: anAthensCanvas
]
