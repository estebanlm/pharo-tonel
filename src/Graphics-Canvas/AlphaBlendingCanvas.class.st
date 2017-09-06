"
see ColorMappingCanvas comment.
"
Class {
	#name : #AlphaBlendingCanvas,
	#superclass : #ColorMappingCanvas,
	#instVars : [
		'alpha'
	],
	#category : #Graphics-Canvas,
	#timestamp : 'LaurentLaffont 2/23/2011 20:17'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
AlphaBlendingCanvas>>alpha [
	^alpha
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
AlphaBlendingCanvas>>alpha: newAlpha [
	alpha := newAlpha.
]

{
	#category : #drawing-images,
	#timestamp : ' 8/31/2017 05:26:10'
}
AlphaBlendingCanvas>>image: aForm at: aPoint sourceRect: sourceRect rule: rule [
	"Draw the given form. For the 'paint' combination rule use stenciling otherwise simply fill the source rectangle.
	Do a blendAlpha if the rule is blend to cope with translucent images being drawn (via translucentImage:...)."
	
	rule = Form paint ifTrue:[
		^myCanvas
			image: aForm
			at: aPoint
			sourceRect: sourceRect
			rule: Form paintAlpha
			alpha: alpha.
	].
	rule = Form over ifTrue:[
		^myCanvas
			image: aForm
			at: aPoint
			sourceRect: sourceRect
			rule: Form blendAlpha
			alpha: alpha.
	].
	rule = Form blend ifTrue:[
		^myCanvas
			image: aForm
			at: aPoint
			sourceRect: sourceRect
			rule: Form blendAlpha
			alpha: alpha.
	].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
AlphaBlendingCanvas>>mapColor: aColor [
	aColor isColor ifFalse:[^aColor]. "Should not happen but who knows..."
	aColor isTransparent ifTrue:[^aColor].
	aColor isOpaque ifTrue:[^aColor alpha: alpha].
	^aColor alpha: (aColor alpha * alpha)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
AlphaBlendingCanvas>>on: aCanvas [
	myCanvas := aCanvas.
	alpha := 1.0.
]
