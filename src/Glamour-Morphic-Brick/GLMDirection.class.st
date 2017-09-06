"

"
Class {
	#name : #GLMDirection,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #Glamour-Morphic-Brick-Utils-Geometry,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMDirection class>>cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMDirection class>>uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMDirection>>* aNumber [
	<return: #Point>

	^ self subclassResponsibility
]

{
	#category : #direction,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMDirection>>left [
	"Return a direction which is a left projection"
	^ self subclassResponsibility
]

{
	#category : #direction,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMDirection>>origin: aPoint length: aLength breadth: aBreadth [
	^ self subclassResponsibility
]

{
	#category : #direction,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMDirection>>rightAngle: aDirection [
	^ self subclassResponsibility
]
