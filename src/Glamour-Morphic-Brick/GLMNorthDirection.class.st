"

"
Class {
	#name : #GLMNorthDirection,
	#superclass : #GLMDirection,
	#category : #Glamour-Morphic-Brick-Utils-Geometry,
	#timestamp : ''
}

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMNorthDirection>>* aNumber [
	<return: #Point>

	^ 0 @ aNumber negated
]

{
	#category : #direction,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMNorthDirection>>left [
	^ GLMWestDirection uniqueInstance
]

{
	#category : #direction,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMNorthDirection>>origin: aPoint length: aLength breadth: aBreadth [
	^ aPoint - (0 @ aLength) extent: aBreadth @ aLength
]

{
	#category : #direction,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMNorthDirection>>rightAngle: aDirection [
	^ aDirection = GLMWestDirection uniqueInstance
]
