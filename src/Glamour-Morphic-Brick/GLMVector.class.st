"

"
Class {
	#name : #GLMVector,
	#superclass : #Object,
	#instVars : [
		'direction',
		'length',
		'next',
		'previous'
	],
	#classVars : [
		'East',
		'North',
		'South',
		'West'
	],
	#category : #Glamour-Morphic-Brick-Utils-Geometry,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector class>>direction: aDirection [
	^ self new
		direction: aDirection;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector class>>east: aLength [
	^ self new
		east;
		length: aLength;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector class>>horizontal: aNumber [
	^ aNumber >= 0
		ifTrue: [ self east: aNumber ]
		ifFalse: [ self west: aNumber abs ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector class>>initialize [
	super initialize.
	
	North := GLMNorthDirection uniqueInstance.
	South := GLMSouthDirection uniqueInstance.
	West := GLMWestDirection uniqueInstance.
	East := GLMEastDirection uniqueInstance 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector class>>north: aLength [
	^ self new
		north;
		length: aLength;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector class>>south: aLength [
	^ self new
		south;
		length: aLength;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector class>>vertical: aNumber [
	^ aNumber >= 0
		ifTrue: [ self south: aNumber ]
		ifFalse: [ self north: aNumber abs ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector class>>west: aLength [
	^ self new
		west;
		length: aLength;
		yourself
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>* aNumber [
	^ self direction * aNumber
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>+ aPoint [
	^ aPoint + self offset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>direction [
	^ direction
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>direction: aDirection [
	direction := aDirection
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>east [
	direction := East
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>initialize [
	super initialize.
	
	next := self.
	previous := self
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>left [
	"Return a vector representing left projection"
	^ (GLMVector direction: self direction left)
		length: self length
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>length [
	^ length value
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>length: aNumber [

	self
		assert: [ aNumber >= 0 ]
		description: [ 'Length must be non-negative' ].

	length := aNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>next [
	"Return a next vector"
	<return: #GLMVector>

	^ next
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>next: aVector [
	next := aVector
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>north [
	direction := North
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>offset [
	<return: #Point>
	^ self direction * self length
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>origin: aPoint breadth: aNumber [
	"Creates a rectangle to the left of a vector"
	<return: #Rectangle>

	^ self direction origin: aPoint length: length breadth: aNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>previous [
	^ previous
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>previous: aVector [
	previous := aVector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>rightAngle: aVector [
	"Return true if angle between me and a given angle is right"
	^ self direction rightAngle: aVector direction
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>similar: aLength [
	^ (self class direction: self direction)
		length: aLength;
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>south [
	direction := South
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMVector>>west [
	direction := West
]
