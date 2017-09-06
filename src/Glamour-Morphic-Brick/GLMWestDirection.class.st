"

"
Class {
	#name : #GLMWestDirection,
	#superclass : #GLMDirection,
	#category : #Glamour-Morphic-Brick-Utils-Geometry,
	#timestamp : ''
}

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMWestDirection>>* aNumber [
	<return: #Point>
	
	^ aNumber negated @ 0
]

{
	#category : #direction,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMWestDirection>>left [
	^ GLMSouthDirection uniqueInstance
]

{
	#category : #direction,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMWestDirection>>origin: aPoint length: aLength breadth: aBreadth [
	^ aPoint - (aLength @ aBreadth) extent: aLength @ aBreadth
]

{
	#category : #direction,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMWestDirection>>rightAngle: aDirection [
	^ aDirection = GLMSouthDirection uniqueInstance
]
