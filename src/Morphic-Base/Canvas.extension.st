Extension {
	#name : #Canvas
}

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
Canvas>>asAlphaBlendingCanvas: alpha [
	^(AlphaBlendingCanvas on: self) alpha: alpha
]

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
Canvas>>copyClipRect: newClipRect [

	^ ClippingCanvas canvas: self clipRect: newClipRect

]
