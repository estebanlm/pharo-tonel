Extension {
	#name : #SolidFillStyle
}

{
	#category : #'*Athens-Core',
	#timestamp : ' 8/31/2017 05:26:26'
}
SolidFillStyle>>asAthensPaintOn: anAthensCanvas  [

	^ anAthensCanvas surface createSolidColorPaint: color
]
