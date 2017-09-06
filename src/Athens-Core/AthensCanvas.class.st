"
The Athens canvas is a central object which is used to performs drawings on a surface.
Please note, that Athens does not allows you to instantiate canvas directly, instead you obtain a ready for use instance as an argument in 
#drawDuring: message, sent to athens surface:

surface drawDuring: [:canvas | .... ]

Using canvas outside a #drawDuring: method is highly discouraged. Doing so may lead to unpredicted behavior/data corruption/image crash.
"
Class {
	#name : #AthensCanvas,
	#superclass : #Object,
	#instVars : [
		'paint',
		'surface',
		'shape',
		'fontRenderer',
		'paintMode'
	],
	#category : #Athens-Core,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas class>>new [
	"use #on: instead"
	self shouldNotImplement
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas class>>on: aSurface [
	^ self basicNew initializeWithSurface: aSurface
]

{
	#category : #caching,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>cacheAt: anObject ifAbsentPut: aBlock [

	^ surface cacheAt: anObject ifAbsentPut: aBlock
]

{
	#category : #masking,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>clearMask: aShape [
	"set mask pixels to 0 for all pixels covered by shape, aShape"
	^ aShape paintFillsUsing: surface clearMaskPaint on: self

]

{
	#category : #clipping,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>clipBy: aRectangle during: aBlock [
	
	"Set a clipping rectangle during drawing operations performed in aBlock.
	Note that the clipping rectangle is intersected with the currently active clipping rectangle"
	
	 ^surface clipBy: aRectangle during: aBlock
]

{
	#category : #paths,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>createPath: aPathCreatingBlock [
	"Create new path. A path creating block should be a monadic block,
	which will get a path builder instance as argument. See AthensPathBuilder
	for available protocol.
	The resulting path object can be later used for drawing.
	" 
	^ surface createPath: aPathCreatingBlock
]

{
	#category : #paths,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>createRectanglePath: aRectangle  [
	^ surface createRectanglePath: aRectangle 

]

{
	#category : #masking,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>disableMask [
	^ surface disableMask
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>draw [
	"Fill the currently selected shape with currently selected paint"
	
	^ shape paintFillsUsing: paint on: self


]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>draw: anObject [
	"A generic dispatch method to draw anObject on receiver. 
	the object should understand #drawOnAthensCanvas: message"
	^ anObject drawOnAthensCanvas: self
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>drawShape: anObject [
	"A convenience method, which sets the current shape to anObject and then fills it
	with currently selected paint" 
	self setShape: anObject.
	self draw.
	
]

{
	#category : #'drawing text',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>drawString: aString [
	"Draw a string using currently selected font.
	Answer a total advance of rendered string "
	^ fontRenderer renderCharacters: aString from: 1 to: aString size.
]

{
	#category : #'drawing text',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>drawString: aString from: start to: end [

	"Draw a portion of string using currently selected font.
	Answer a total advance of rendered portion"
	^ fontRenderer renderCharacters: aString from: start to: end
]

{
	#category : #masking,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>enableMask [
	^ surface enableMask
]

{
	#category : #caching,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>flushCacheAt: anObject [
	"Flush (delete) any cached value(s) identified by given object, anObject.
	A surface using identity comparison for object identifiers.

	Answer receiver.
	"

	surface flushCacheAt: anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>initializeWithSurface: anAthensSurface	 [
	surface := anAthensSurface
]

{
	#category : #clipping,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>isVisible: aRectangle  [
	"check if rectangle are not fully clipped by current clipping coordinates"
	
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>paint [
	^ paint  
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>paintMode [
	"Answer the current paint mode controller.
	The answered object should conform to AthensPaintMode public protocol."

	^ paintMode
]

{
	#category : #'transformation matrices',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>paintTransform [
	"Answer the paint transformation matrix controller.
	The answered object should conform to AthensTransform public protocol."

	^ surface paintTransform

]

{
	#category : #'transformation matrices',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>pathTransform [
	"Answer the path transformation matrix controller.
	The answered object should conform to AthensTransform public protocol."
	^ surface pathTransform

]

{
	#category : #'drawing text',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>setFont: aFont [
	"Set the current font of receiver. Font object should answer a glyph renderer instance,
	compatible with glyph renderer protocol" 
	^ fontRenderer := aFont glyphRendererOn: surface.
]

{
	#category : #masking,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>setMask: aShape [
	"set mask pixels to 1 for all pixels covered by shape, aShape"

	^ aShape paintFillsUsing: surface setMaskPaint on: self

]

{
	#category : #paint,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>setPaint: aPaint [
	"set the current paint of receiver"
	paint = aPaint ifTrue:[ ^ paint ].
	paint := aPaint asAthensPaintOn: self.
	^ paint.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>setShape: anObject [
	"Set the current shape of receiver"
	shape := anObject asAthensShapeOn: self.
]

{
	#category : #paint,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>setStrokePaint: aPaint [
	"use paint as stroke paint, note conversion to #asStrokePaintOn:"
	paint := (aPaint asAthensPaintOn: self) asStrokePaintOn: self.
	^ paint
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCanvas>>surface [
	"Answer an Athens surface, to which receiver is bound to"
	^ surface
]
