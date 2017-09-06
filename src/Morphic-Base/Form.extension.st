Extension {
	#name : #Form
}

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
Form>>asAlphaImageMorph [

	^ AlphaImageMorph new image: self
]

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
Form>>asMorph [
	^ImageMorph new form: self
]

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
Form class>>floodFillTolerance [
	^ FloodFillTolerance ifNil: [FloodFillTolerance := 0.0]
]

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
Form>>floodFillTolerance [
	^ self class floodFillTolerance
]

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
Form>>iconOrThumbnailOfSize: aNumberOrPoint  [
	"Answer an appropiate form to represent the receiver"
	^ self scaledIntoFormOfSize: aNumberOrPoint
]

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
Form>>scaledIntoFormOfSize: aNumberOrPoint  [
	"Scale and center the receiver into a form of a given size"

	| extent scale scaledForm result |

	extent := aNumberOrPoint asPoint.
	extent = self extent ifTrue: [^ self].

	(self height isZero or: [self width isZero])
		ifTrue: [^ Form extent: extent depth: self depth].

	scale := extent y / self height min: extent x / self width.
	scaledForm := self
				magnify: self boundingBox
				by: scale
				smoothing: 8.

	result := Form extent: extent depth: 32.
	result getCanvas
		translucentImage: scaledForm
		at: extent - scaledForm extent // 2.

	^ result

]

{
	#category : #'*Morphic-Base-Support',
	#timestamp : ' 8/31/2017 05:26:13'
}
Form>>stencil [
	"return a 1-bit deep, black-and-white stencil of myself"

	| canvas |
	canvas := FormCanvas extent: self extent depth: 1.
	canvas fillColor: (Color white).

	canvas stencil: self at: 0@0  
				sourceRect: (Rectangle origin: 0@0 corner: self extent) color: Color black.

	^ canvas form

]
