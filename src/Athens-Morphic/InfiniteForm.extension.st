Extension {
	#name : #InfiniteForm
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
InfiniteForm>>asAthensPaintOn: canvas [
	^ (canvas surface createFormPaint: self asForm)
		repeat;
		origin: self origin;
		direction: self direction;
		yourself
]
