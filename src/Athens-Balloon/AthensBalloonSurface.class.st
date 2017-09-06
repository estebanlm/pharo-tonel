"
I am concrete implementation of Athens surface which using balloon engine for rendering. 
"
Class {
	#name : #AthensBalloonSurface,
	#superclass : #AthensSurface,
	#instVars : [
		'form',
		'mask',
		'maskEnabled',
		'pathTransform',
		'paintTransform',
		'imageTransform',
		'fillTransform',
		'strokeTransform',
		'engine'
	],
	#category : #Athens-Balloon,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface class>>extent: aPoint [
	"Create a new surface with given extent."
	
	^ self new form: (Form extent: aPoint depth: 32)
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>asAthensPaintOn: aCanvas [
	^ AthensBalloonImagePaint new form: self asForm; yourself
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>asForm [
	^ form
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>clear [
	^ self clearForm
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>clearForm [

	form bits: ( Bitmap new: form bits size).
	
]

{
	#category : #clipping,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>clipBy: aRectangle during: aBlock [

	| oldRect transformedClip|
	transformedClip := (pathTransform transform:aRectangle origin) corner: (pathTransform transform:aRectangle corner).
	oldRect := engine clipRect.
	engine clipRect: (oldRect intersect: transformedClip).

	aBlock ensure: [ engine clipRect: oldRect ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>clipRect [
	^ engine clipRect
]

{
	#category : #paints,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>createCircularGradient: colorRamp center: aCenter radius: aRadius [

	^ AthensBalloonRadialGradient new
		colorRamp: colorRamp;
		center: aCenter;
		radius: aRadius;
		yourself
]

{
	#category : #paints,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>createFormPaint: aForm   [
	^ AthensBalloonImagePaint new
		form: aForm
]

{
	#category : #paints,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>createLinearGradient: colorRamp start: pt1 stop: pt2 [
 
	^ AthensBalloonLinearGradient new
		colorRamp: colorRamp;
		origin: pt1;
		corner: pt2;
		yourself
]

{
	#category : #paths,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>createPath: aPathCreatingBlock [
	"Create a path from provided path builder instance"
	
	| builder |
	builder := AthensSimplePathBuilder new.
	aPathCreatingBlock value: builder.

	^ AthensBalloonPath new convertFromBuilder: builder.
	
	
]

{
	#category : #paints,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>createRadialGradient: colorRamp center: aCenter radius: aRadius focalPoint: fp [
	^ self createCircularGradient: colorRamp center: aCenter radius: aRadius
]

{
	#category : #paints,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>createSolidColorPaint: aColor  [
	^ AthensBalloonSolidColorPaint new color: aColor
]

{
	#category : #paints,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>createStrokePaintFor: aPaint [

	^ AthensBalloonStrokePaint new fillPaint: aPaint
]

{
	#category : #masking,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>disableMask [
	maskEnabled := false.
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>drawImage: aForm  [

	engine drawImage: aForm transform: imageTransform
]

{
	#category : #masking,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>enableMask [
	maskEnabled := true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>engine [
	^ engine
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>fillBezierShape: contours color: aColor  [

	engine
		prepareForRendering;
		registerColorFill: aColor	;
		fillBezierShape: contours
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>fillBezierShape: anArray color: aColor width: aSmallInteger  [
	self shouldBeImplemented.
]

{
	#category : #'rendering dispatch',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>fillPath: aPath withSolidColor: aColor [
	self fillBezierShape: aPath contoursForFilling color: aColor
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>fillRectangle: rect color: aColor [

	engine
		prepareForRendering;
		registerColorFill: aColor	;
		fillRectangle: rect

]

{
	#category : #'rendering dispatch',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>fillRectangle: aRectangle withSolidColor: aColor [
	self fillRectangle: aRectangle color: aColor
]

{
	#category : #'accessing matrices',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>fillTransform [

	^ fillTransform
]

{
	#category : #'accessing matrices',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>fillTransform: anObject [

	fillTransform := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>form [
	^ form
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>form: aForm [

	form := aForm.
	mask := Form extent: form extent depth: 1. 

	engine := AthensBalloonEngine new.
	engine bitBlt: (GrafPort toForm: form) .
	engine clipRect: (0@0 extent: form extent).
	engine edgeTransform: pathTransform.
	engine destOffset: 0@0.
	engine reset.
]

{
	#category : #fonts,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>getFreetypeFontRendererFor: aFreeTypeFont  [
	
	^ (FT2GlyphRenderer forFont: aFreeTypeFont surface: self)
]

{
	#category : #'accessing matrices',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>imageTransform [

	^ imageTransform
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>initialize [
	pathTransform := AthensAffineTransform new.
	paintTransform := AthensAffineTransform new.
	
	imageTransform := AthensAffineTransform new " AthensGenericTransform new".
	fillTransform := AthensAffineTransform new.
	strokeTransform := AthensAffineTransform new.
	maskEnabled := false.
]

{
	#category : #masking,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>maskEnabled [
	^ maskEnabled
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>paintTransform  [
	^ paintTransform 
]

{
	#category : #'accessing matrices',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>pathTransform [

	^ pathTransform
]

{
	#category : #'accessing matrices',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>pathTransform: anObject [

	pathTransform := anObject copy.
	engine edgeTransform: pathTransform.
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>strokeBezierShape: contours color: aColor width: aWidth  [
	
	engine
		prepareForRendering;
		registerColorFill: aColor	;
		strokeBezierShape: contours width: aWidth
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>strokeRectangle: rect color: aColor width: aWidth [
	 
	engine
		prepareForRendering;
		registerColorFill: aColor	;
		strokeRectangle: rect width: aWidth
]

{
	#category : #'accessing matrices',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>strokeTransform [

	^ strokeTransform
]

{
	#category : #'accessing matrices',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonSurface>>strokeTransform: anObject [

	strokeTransform := anObject
]
