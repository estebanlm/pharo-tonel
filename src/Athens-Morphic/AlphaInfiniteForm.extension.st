Extension {
	#name : #AlphaInfiniteForm
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
AlphaInfiniteForm>>asAthensPaintOn: canvas [
	^ (canvas surface createFormPaint: self asForm)
		repeat;
		origin: self origin;
		direction: self direction;
		extent: self extent;
		yourself
]
