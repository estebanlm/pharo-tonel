"
I representing a surface, where all drawing operations will happen.

I also having a number of factory methods to create paints, paths and other objects involved in drawing.

AthensSurface is an abstract, while subclasses implement a specific kind of surface for one or another backend.

The primary role of AthensSurface class is to define a public protocol for all Athens surfaces, which can be used by applications which using Athens framework.

To get a new surface, use:

<one of my subclasses> extent: x@y

for surfaces which don't need to have dimensions specified,
it would just #new.
"
Class {
	#name : #AthensSurface,
	#superclass : #Object,
	#instVars : [
		'currentCanvas'
	],
	#category : #Athens-Core,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface class>>extent: aPoint [
	"Create a new surface with given extent. 
	Note that some surfaces may not support this method, since they may represent an infinite surface."
	
	self subclassResponsibility
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>asForm [
	"Answer a Form , which contains a bits, converted from surface "
	self subclassResponsibility
]

{
	#category : #caching,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>cacheAt: anObject ifAbsentPut: aBlock [
	"Answer an object from surface's cache identified by anObject,
	if there is no cached object under such identifier, evaluate a block
	and put it into cache. Then answer the result of evaluation.
	A surface using identity comparison for object identifiers.
	"

	self subclassResponsibility
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>clear [
	"clear the surface"
	
	self subclassResponsibility
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>clear: clearColor [
	"clear the surface"
	
	self subclassResponsibility
]

{
	#category : #clipping,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>clipBy: aRectangle during: aBlockClosure  [
	self subclassResponsibility.
]

{
	#category : #paints,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>createFormPaint: aForm  [
	self subclassResponsibility.
]

{
	#category : #paints,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>createLinearGradient: colorRamp start: pt1 stop: pt2 [
 
	"This protocol is deprecated. Use #createLinearGradient: start:stop: instead"
	
	
	self shouldNotImplement 
]

{
	#category : #paths,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>createPath: aPathBuilder [
	"Create a path from provided path builder instance"
	self subclassResponsibility
]

{
	#category : #paints,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>createRadialGradient: colorRamp center: aCenter radius: aRadius [
	"by default, focal point coincede with center"
	^ self createRadialGradient: colorRamp center: aCenter radius: aRadius focalPoint: aCenter

]

{
	#category : #paints,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>createRadialGradient: colorRamp center: aCenter radius: aRadius focalPoint: fp [
 
	self subclassResponsibility
]

{
	#category : #paths,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>createRectanglePath: aRectangle  [
	^ aRectangle
]

{
	#category : #paints,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>createShadowPaint: aColor  [
	 "Answer an instance of AthensPaint, valid for use with given surface"
	
	self subclassResponsibility
]

{
	#category : #paints,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>createSolidColorPaint: aColor  [
	 "Answer an instance of AthensPaint, valid for use with given surface"
	
	self subclassResponsibility
]

{
	#category : #paints,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>createStrokePaintFor: aPaint [
	 "Answer an instance of AthensPaint, valid for use as stroke paint on receiver,
	using an argument, paint for fills"
	
	self subclassResponsibility
]

{
	#category : #masking,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>disableMask [
	self subclassResponsibility
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>drawDuring: aBlock [

	"You may draw on receiver only when inside a block and only using provided canvas object.
	This ensures releasing system resources used after finishing drawing"


	currentCanvas ifNotNil: [ self attemptToRecurseDrawing ].
	
	[
		currentCanvas := self newCanvas.
		aBlock value: currentCanvas.
	] ensure: [
		self releaseCanvas.
		currentCanvas := nil.
	].
]

{
	#category : #masking,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>enableMask [
	self subclassResponsibility
]

{
	#category : #'rendering dispatch',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>fillPath: aPath withSolidColor: aColor  [

	self subclassResponsibility
]

{
	#category : #'rendering dispatch',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>fillRectangle: aRectangle withSolidColor: aColor [

	self subclassResponsibility
]

{
	#category : #caching,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>flushCacheAt: anObject [

	"Flush (delete) any cached value(s) identified by given object, anObject.
	A surface using identity comparison for object identifiers.

	Answer receiver.
	"

	self subclassResponsibility
]

{
	#category : #masking,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>maskEnabled [
	self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>newCanvas [
	"Answer a preinitialized instance of AthensCanvas.
	Private to receiver and its subclasses, override seldom"
	^ AthensCanvas on: self

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensSurface>>releaseCanvas [
	currentCanvas := nil
]
