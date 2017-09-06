"

"
Class {
	#name : #GLMSouthDirection,
	#superclass : #GLMDirection,
	#category : #Glamour-Morphic-Brick-Utils-Geometry,
	#timestamp : ''
}

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSouthDirection>>* aNumber [
	<return: #Point>

	^ 0 @ aNumber
]

{
	#category : #direction,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSouthDirection>>left [
	^ GLMEastDirection uniqueInstance
]

{
	#category : #direction,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSouthDirection>>origin: aPoint length: aLength breadth: aBreadth [
	"Creates a rectangle to the right of the vector pointing in direction I define"
	^ aPoint - (aBreadth @ 0) extent: aBreadth @ aLength
]

{
	#category : #direction,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMSouthDirection>>rightAngle: aDirection [
	^ aDirection = GLMEastDirection uniqueInstance
]
