"
A GLMFoundationBrick is connection layer between brick widgets and morphic.

See GLMBrick class comment for more info.

Instance Variables
	brickRoot:		<Object>

brickRoot
	- xxxxx

"
Class {
	#name : #GLMFoundationBrick,
	#superclass : #Morph,
	#instVars : [
		'brickRoot',
		'vResizing',
		'hResizing'
	],
	#category : #Glamour-Morphic-Brick-Morphic,
	#timestamp : 'AliakseiSyrel 10/17/2014 10:32'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick class>>root: aBrick [

	^ self new brickRoot: aBrick
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>addAllBricks: aCollection [

	self brickRoot addAllBricks: aCollection
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>addBrickBack: aBrick [

	self brickRoot addBrickBack: aBrick.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>brickRoot [

	^ brickRoot
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>brickRoot: aBrick [

	self brickRoot ifNotNil: [
		self removeMorph: self brickRoot.
		brickRoot := nil ].
	
	brickRoot := aBrick.
	self addMorphBack: brickRoot.
	brickRoot onThemerChanged
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>brickThemerChanged [

	self brickRoot themerChanged
]

{
	#category : #recategorized,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>changed [
	"Report that the area occupied by this morph should be redrawn.
	Fixed to include submorphs outside the outerBounds"
	
	self brickRoot changed
]

{
	#category : #layouting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>doLayout [

	self brickRoot doLayoutForce.
]

{
	#category : #'reflective operations',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>doesNotUnderstand: aMessage [

	^ self brickRoot perform: aMessage selector withArguments: aMessage arguments
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>extent: aPoint [
	|left top right bottom|
	
	super extent: aPoint.
	
	left := self brickRoot marginLeft.
	top := self brickRoot marginTop.
	
	right := self extent x - self brickRoot marginRight.
	bottom := self extent y - self brickRoot marginBottom.
	
	self isHFilling ifTrue: [ self brickRoot width: right - left ].
	self isVFilling ifTrue: [ self brickRoot height: bottom - top ].
	self brickRoot wrappedBounds bounds: (left@top corner: (right@bottom)).
	
	self brickRoot doLayoutForce
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>fullBounds [
	super fullBounds.
	^ self brickRoot globalClippingBounds
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>fullDrawOn: aCanvas [
	"preventing from drawing outside of me"
	super fullDrawOn: (aCanvas copyClipRect: self fullBounds).
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>globalBounds [

	^ self bounds
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>globalBoundsTranslateFactor [

	^ self globalBounds origin
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>hShrinkWrap [

	hResizing:= #shrinkWrap
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>hSpaceFill [

	hResizing:= #spaceFill.
	self hResizing: #spaceFill
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>initialize [
	super initialize.

	vResizing := #spaceFill.
	hResizing := #spaceFill.

	self
		beTransparent;
		brickRoot: GLMBrick new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>isFocused [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>isFoundationBrick [

	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>isHFilling [

	^ hResizing = #spaceFill
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>isHShrinking [

	^ hResizing = #shrinkWrap
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>isVFilling [

	^ vResizing = #spaceFill
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>isVShrinking [

	^ vResizing = #shrinkWrap
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>outOfWorld: aWorld [
	super outOfWorld: aWorld.
	
	self brickRoot onRemovedFrom: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>privateExtent: aPoint [

	super extent: aPoint.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>privateThemer [

	^ self valueOfProperty: #brickThemer ifAbsentPut: [ nil ]
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>removeAllBricks [

	self brickRoot removeAllBricks
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>removeBrick: aBrick [

	self brickRoot removeBrick: aBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>themer [

	^ self privateThemer
		ifNotNil: [ self privateThemer ]
		ifNil: [ self owner isNotNil
			ifTrue: [ self owner isBrick ifTrue: [ self owner themer ] ifFalse: [ super brickThemer ] ]
			ifFalse: [ self theme brickThemer ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>themer: aThemer [

	self setProperty: #brickThemer toValue: aThemer.
	self brickRoot themerChanged
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>vShrinkWrap [

	vResizing:= #shrinkWrap
]

{
	#category : #brick-layout-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFoundationBrick>>vSpaceFill [

	vResizing:= #spaceFill
]
