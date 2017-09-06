Extension {
	#name : #AthensBalloonSurface
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>displayOnMorphicCanvas: canvas at: aPoint [
	"display receiver on morphic canvas"
	canvas
		image: self asForm
		at: aPoint
		sourceRect: (0@0 extent: self asForm extent )
		rule: 34.
]
