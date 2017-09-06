"
i represent texture/image/form/surface paints in cairo backend.
"
Class {
	#name : #AthensCairoPatternSurfacePaint,
	#superclass : #AthensCairoPatternPaint,
	#pools : [
		'AthensCairoDefs'
	],
	#category : #Athens-Cairo-Paints,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPatternSurfacePaint class>>createForSurface: anAthensCairoSurface [
	|pat|
	pat := self primCreateForSurface: anAthensCairoSurface .
	pat initializeFor: anAthensCairoSurface  .
	^ pat
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPatternSurfacePaint class>>primCreateForSurface: anAthensCairoSurface [
	
"	pattern = cairo_pattern_create_for_surface (image);"
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	^self nbCall: #(AthensCairoPatternSurfacePaint cairo_pattern_create_for_surface(
		cairo_surface_t  anAthensCairoSurface ) )

]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPatternSurfacePaint>>athensFillRectangle: aRectangle on: aCanvas [
	"This is a terminal method in rendering dispatch scheme
	canvas->shape->paint. See AthensCanvas>>fillShape: "

	extent
		ifNotNil: [ self setRect: (origin extent: extent) forFillOn: aCanvas ]
		ifNil: [ self setRect: aRectangle forFillOn: aCanvas ].
		
	self setMatrix: aCanvas paintTransform inverted.
	self loadOnCairoCanvas: aCanvas.
	aCanvas fill
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPatternSurfacePaint>>direction: aPoint  [
	direction := aPoint.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPatternSurfacePaint>>extent [
	^ extent ifNil:[surface extent]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPatternSurfacePaint>>extent: aPatternExtent [
	extent:= aPatternExtent
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPatternSurfacePaint>>initializeFor: anAthensCairoSurface  [
	self initialize.
	surface := anAthensCairoSurface .
	
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPatternSurfacePaint>>origin: aPoint  [
	origin := aPoint.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPatternSurfacePaint>>setMatrix: aMatrix [

	aMatrix restoreAfter: [
		origin ifNotNil: [ aMatrix translateBy: origin negated ].
		super setMatrix: aMatrix.
	]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPatternSurfacePaint>>setRect: aRectangle forFillOn: aCanvas [
	aCanvas
		rectangleX: aRectangle left
		y: aRectangle top
		width: aRectangle width
		height: aRectangle height
]
