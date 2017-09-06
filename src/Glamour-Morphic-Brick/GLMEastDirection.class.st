"

"
Class {
	#name : #GLMEastDirection,
	#superclass : #GLMDirection,
	#category : #Glamour-Morphic-Brick-Utils-Geometry,
	#timestamp : ''
}

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEastDirection>>* aNumber [
	<return: #Point>
	
	^ aNumber @ 0
]

{
	#category : #direction,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEastDirection>>left [
	^ GLMNorthDirection uniqueInstance
]

{
	#category : #direction,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEastDirection>>origin: aPoint length: aLength breadth: aBreadth [
	^ aPoint extent: aLength @ aBreadth
]

{
	#category : #direction,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEastDirection>>rightAngle: aDirection [
	^ aDirection = GLMNorthDirection uniqueInstance
]
