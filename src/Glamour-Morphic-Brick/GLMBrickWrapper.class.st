"

"
Class {
	#name : #GLMBrickWrapper,
	#superclass : #GLMBrickGeneralWrapper,
	#category : #Glamour-Morphic-Brick-Layouts-Utils,
	#timestamp : ''
}

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>brickBounds: aRectangle [

	^ self brick brickBounds: aRectangle
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>extent [

	^ self brick extent
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>innerBounds [

	^ self brick innerBounds
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>invalidateLayout [

	^ self brick invalidateLayout
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>isHeightClean [

	^ self brick wrappedBounds isHeightClean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>isHeightDirty [

	^ self brick wrappedBounds isHeightDirty
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>isWidthClean [

	^ self brick wrappedBounds isWidthClean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>isWidthDirty [

	^ self brick wrappedBounds isWidthDirty
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>marginBottom [

	^ self brick marginBottom
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>marginLeft [

	^ self brick marginLeft
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>marginRight [

	^ self brick marginRight
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>marginTop [

	^ self brick marginTop
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>markHeightClean [

	^ self brick wrappedBounds markHeightClean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>markHeightDirty [

	^ self brick wrappedBounds markHeightDirty
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>markLayoutClean [

	self layout markClean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>markLayoutDirty [

	self layout markDirty
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>markWidthClean [

	^ self brick wrappedBounds markWidthClean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>markWidthDirty [

	^ self brick wrappedBounds markWidthDirty
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>onChildrenLayouted [

	^ self brick onChildrenLayouted
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>onLayoutEvent: aLayoutEvent [

	^ self brick onLayoutEvent: aLayoutEvent
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>onLayouted [

	^ self brick onLayouted
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>outerBounds [

	^ self brick outerBounds
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>outerHeight: anInteger [

	^ self brick wrappedBounds outerHeight: anInteger
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>outerOrigin: aPoint [

	^ self brick wrappedBounds outerOrigin: aPoint
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>outerWidth: anInteger [

	^ self brick wrappedBounds outerWidth: anInteger
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>paddingBottom [

	^ self brick paddingBottom
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>paddingLeft [

	^ self brick paddingLeft
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>paddingRight [

	^ self brick paddingRight
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>paddingTop [

	^ self brick paddingTop
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>translateX: anObject [

	^ self brick translateX: anObject
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>translateY: anObject [

	^ self brick translateY: anObject
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>width [

	^ self brick width
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>withHeight: anInteger [

	^ self brick withHeight: anInteger
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickWrapper>>withWidth: anInteger [

	^ self brick withWidth: anInteger
]
