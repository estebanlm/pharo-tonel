"

"
Class {
	#name : #GLMArea,
	#superclass : #Object,
	#instVars : [
		'origin',
		'vector',
		'vertices'
	],
	#category : #Glamour-Morphic-Brick-Utils-Geometry,
	#timestamp : ''
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMArea class>>origin: aPoint vectors: theVectors [
	^ self new
		origin: aPoint;
		vectors: theVectors;
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMArea class>>vectors: theVectors [
	^ self new
		vectors: theVectors;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMArea>>computeVertices [
	vector ifNil: [ ^ self ].
	
	vertices := Array streamContents: [ :aStream |
		| currentVector vertex |
		currentVector := vector.
		vertex := origin.
		aStream nextPut: vertex.
		
		[ currentVector next ~= vector ] whileTrue: [ 
			vertex := currentVector + vertex.
			aStream nextPut: vertex.
			currentVector := currentVector next ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMArea>>initialize [
	super initialize.
	
	origin := 0@0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMArea>>origin [
	^ origin
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMArea>>origin: aPoint [

	origin := aPoint.
	self computeVertices
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMArea>>vector [
	^ vector
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMArea>>vectors: theVectors [
	| currentVector |

	self
		assert: [ theVectors size >= 4 ]
		description: [ 'There must be at least four vectors (rectangular area)!' ].

	vector := theVectors first.
	currentVector := vector.

	2 to: theVectors size do: [ :anIndex |
		| aVector |
		aVector := theVectors at: anIndex.
		currentVector next: aVector.
		aVector previous: currentVector.
		currentVector := aVector ].

	currentVector next: vector.
	vector previous: currentVector.

	self computeVertices
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMArea>>vertices [
	^ vertices
]
