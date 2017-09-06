"
see ColorMappingCanvas comment.
"
Class {
	#name : #ShadowDrawingCanvas,
	#superclass : #ColorMappingCanvas,
	#instVars : [
		'shadowColor'
	],
	#category : #Graphics-Canvas,
	#timestamp : 'LaurentLaffont 2/23/2011 20:17'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
ShadowDrawingCanvas>>image: aForm at: aPoint sourceRect: sourceRect rule: rule [
	"Draw the given form. For the 'paint' combination rule use stenciling otherwise simply fill the source rectangle."
	rule = Form paint ifTrue:[
		^myCanvas
			stencil: aForm
			at: aPoint
			sourceRect: sourceRect
			color: shadowColor
	] ifFalse:[
		^myCanvas
			fillRectangle: (sourceRect translateBy: aPoint)
			color: shadowColor
	].
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
ShadowDrawingCanvas>>isShadowDrawing [
	^true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
ShadowDrawingCanvas>>mapColor: aColor [
	aColor isColor ifFalse:[^aColor]. "Should not happen but who knows..."
	^aColor isTransparent
		ifTrue:[aColor]
		ifFalse:[shadowColor]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
ShadowDrawingCanvas>>on: aCanvas [
	myCanvas := aCanvas.
	shadowColor := Color black.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
ShadowDrawingCanvas>>shadowColor [
	^shadowColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
ShadowDrawingCanvas>>shadowColor: aColor [
	shadowColor := aColor
]
