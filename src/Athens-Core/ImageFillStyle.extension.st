Extension {
	#name : #ImageFillStyle
}

{
	#category : #'*Athens-Core',
	#timestamp : ' 8/31/2017 05:26:26'
}
ImageFillStyle>>asAthensPaintOn: anAthensCanvas [

	^ (anAthensCanvas cacheAt: self ifAbsentPut: [
		anAthensCanvas surface
		createFormPaint: form ])
		origin: origin;
		direction: (form width@0)

]
