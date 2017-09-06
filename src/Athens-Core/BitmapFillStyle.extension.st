Extension {
	#name : #BitmapFillStyle
}

{
	#category : #'*Athens-Core',
	#timestamp : ' 8/31/2017 05:26:26'
}
BitmapFillStyle>>asAthensPaintOn: anAthensCanvas [
	| paint |
	paint := (anAthensCanvas surface createFormPaint: form)
		origin: origin;
		direction: self direction; yourself.
	self isTiled
		ifTrue: [ paint repeat ].
	^ paint
]
