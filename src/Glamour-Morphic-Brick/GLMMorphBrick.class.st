"
A GLMMorphBrick is used as container for morphs to embed them inside bricks

Instance Variables
	morph:		<Morph>

morph
	- xxxxx

"
Class {
	#name : #GLMMorphBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'morph',
		'resizing',
		'isLayouting',
		'vResizing',
		'hResizing'
	],
	#category : #Glamour-Morphic-Brick-Morphic,
	#timestamp : 'AliakseiSyrel 1/30/2015 10:14'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick class>>on: aMorph [

	^ self new on: aMorph
]

{
	#category : #brick-structure-adding/removing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>addBrickBack: aBrick [
	|link|
	link := aBrick asDoubleLink.
	aBrick brickDoubleLink: link.
	
	self hasSubbricks ifTrue: [
		self lastSubbrick brickDoubleLink nextLink: link.	
		link previousLink: self lastSubbrick brickDoubleLink.
	].
	
	self privateSubbricks: (self subbricks copyWith: aBrick).
	aBrick privateOwner: self.
]

{
	#category : #brick-geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>brickBounds: aRectangle [
	super brickBounds: aRectangle.
	
	self invalidateMorphBounds
]

{
	#category : #morph-drawing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>drawSubmorphsOn: aCanvas [
	aCanvas
		translateBy: self bounds origin - self morph bounds origin + (self paddingLeft @ self paddingTop)
		during: [ :canvas | self morph fullDrawOn: canvas ]
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>hShrinkWrap [
	
	hResizing := #shrinkWrap.
	self width: [ self morph width ]
	
	
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>hSpaceFill: anInteger [
	super hSpaceFill: anInteger.
	
	hResizing := #spaceFill
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>initialize [
	super initialize.
	
	isLayouting := false
]

{
	#category : #brick-layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>invalidateLayout [

	
]

{
	#category : #brick-layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>invalidateMorphBounds [

	self invalidateMorphBounds: false
]

{
	#category : #brick-layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>invalidateMorphBounds: isForce [
	| origin corner newBounds |
	isLayouting & (isForce not) ifTrue: [ ^ self ].
	origin := self paddingLeft @ self paddingTop.
	corner := self paddingRight @ self paddingBottom.
	newBounds := self globalBounds.
	newBounds := ((newBounds origin + origin) corner: (newBounds corner - corner)).
	
	self morph bounds: newBounds
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>isHFilling [

	^ hResizing = #spaceFill
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>isHShrinking [

	^ hResizing = #shrinkWrap
]

{
	#category : #morph-common,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>isMorphBrick [

	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>isShrinking [

	^ self isHShrinking | self isVShrinking
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>isVFilling [

	^ vResizing = #spaceFill
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>isVShrinking [

	^ vResizing = #shrinkWrap
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>layoutChanged [
	super layoutChanged.
	
	self morph ifNil: [ ^ self ].
	self isShrinking ifFalse: [ ^ self ].
	isLayouting ifTrue: [ ^ self ].

	isLayouting := true.
	self changed.
	self isHShrinking
		ifTrue: [ self width: [ self shrinkingWidth + self hPadding ] ].
	self isVShrinking
		ifTrue: [ self height: [ self shrinkingHeight + self vPadding ] ].
		self invalidateMorphBounds: true.
	isLayouting := false.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>morph [

	^ morph
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>on: aMorph [
	
	aMorph layoutProperties ifNil: [ 
		aMorph layoutProperties: GLMBrickLayoutProperties new.
		aMorph layoutProperties hSpaceFill; vSpaceFill ].
	(aMorph layoutProperties isKindOf: GLMBrickLayoutProperties) ifTrue: [
		self layoutProperties: aMorph layoutProperties ].

	morph := aMorph.
	morph layoutProperties: (GLMBrickLayoutProperties new).
	morph layoutProperties hSpaceFill; vSpaceFill.
	
	self addBrickBack: morph.
	super brickBounds: (0@0 extent: (morph width@morph height)).
]

{
	#category : #brick-layout-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>onLayouted [
	super onLayouted.
	
	self invalidateMorphBounds
]

{
	#category : #brick-structure-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>onRemovedFrom: aBrick [
	
	"we should just override it and left empty,
	to prevent recursion calls of this method
	to be propagated to morph"
]

{
	#category : #brick-properties-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>onThemerChanged [
	
]

{
	#category : #brick-geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>shrinkingHeight [

	^ self morph height
]

{
	#category : #brick-geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>shrinkingWidth [

	^ self morph width
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>themerChanged [

	self onThemerChanged.
	self morph brickThemerChanged
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>vShrinkWrap [

	vResizing := #shrinkWrap.
	self height: [ self morph height ]
	
	
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMMorphBrick>>vSpaceFill: anInteger [
	super vSpaceFill: anInteger.
	
	vResizing := #spaceFill
]
