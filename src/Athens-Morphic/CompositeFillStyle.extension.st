Extension {
	#name : #CompositeFillStyle
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
CompositeFillStyle>>asAthensPaintOn: aCanvas  [
	^ AthensCompositePaint new fromFillStyles: fillStyles on: aCanvas
]
