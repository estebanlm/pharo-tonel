Extension {
	#name : #ColorFillStyle
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
ColorFillStyle>>asAthensPaintOn: anAthensCanvas [
	^ (anAthensCanvas surface createSolidColorPaint: color)
		origin: origin;
		extent: extent;
		yourself
]
