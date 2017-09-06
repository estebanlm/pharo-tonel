Extension {
	#name : #AthensCairoCanvas
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensCairoCanvas>>transformBy: aDisplayTransform withClip: aClipRectangle in: aSubRectangle during: aDrawBlock [
	self
		clipBy: currentClipRect
		during: [ 
			| subClip oldClip |
			subClip := aDisplayTransform globalBoundsToLocal: aClipRectangle.
			oldClip := currentClipRect.
			currentClipRect := aDisplayTransform globalBoundsToLocal: self clipRect.
			pathTransform
				restoreAfter: [ 
					pathTransform translateBy: aDisplayTransform offset negated.
					pathTransform rotateByRadians: aDisplayTransform angle negated.
					pathTransform scaleBy: aDisplayTransform scale.
					self clipBy: subClip during: [ aDrawBlock value: self ] ].
			currentClipRect := oldClip ]
]
