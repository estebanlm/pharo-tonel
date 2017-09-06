"
A modified canvas which clips all drawing commands.
"
Class {
	#name : #ClippingCanvas,
	#superclass : #PluggableCanvas,
	#instVars : [
		'canvas',
		'clipRect'
	],
	#category : #Graphics-Canvas,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:10'
}
ClippingCanvas class>>canvas: aCanvas  clipRect: aRectangle [
	^self new canvas: aCanvas  clipRect: aRectangle
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
ClippingCanvas>>apply: aBlock [
	"apply the given block to the inner canvas with clipRect as the clipping rectangle"
	canvas clipBy: clipRect during: aBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
ClippingCanvas>>canvas: aCanvas  clipRect: aRectangle [
	canvas := aCanvas.
	clipRect := aRectangle.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
ClippingCanvas>>clipRect [
	^clipRect
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
ClippingCanvas>>contentsOfArea: aRectangle into: aForm [
	self flag: #hack.    "ignore the clipping specification for this command.  This is purely so that CachingCanvas will work properly when clipped.  There *has* to be a clean way to do this...."
	
	^canvas contentsOfArea: aRectangle into: aForm
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
ClippingCanvas>>form [
	^canvas form
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
ClippingCanvas>>isBalloonCanvas [
	^canvas isBalloonCanvas
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
ClippingCanvas>>isShadowDrawing [
	^canvas isShadowDrawing
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
ClippingCanvas>>shadowColor [
	^canvas shadowColor
]
