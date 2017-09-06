"
I am a specialization of EllipseMorph that knows enough to remain circular.

"
Class {
	#name : #CircleMorph,
	#superclass : #EllipseMorph,
	#instVars : [
		'referencePosition',
		'originalCenter',
		'originalAngle'
	],
	#category : #Morphic-Base-Basic,
	#timestamp : '<historical>'
}

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:13'
}
CircleMorph class>>exampleCircleMorph [
	(CircleMorph new)
	 extent: 50 @ 50;color: Color blue;
	 openInWorld.
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:13'
}
CircleMorph>>bounds: aRectangle [
	| size |
	size := aRectangle width min: aRectangle height.
	super bounds: (Rectangle origin: aRectangle origin extent: size @ size).
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
CircleMorph>>defaultBounds [

	^0@0 extent: 40@40
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
CircleMorph>>defaultColor [

	^Color green lighter
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:13'
}
CircleMorph>>extent: aPoint [
	| size oldRotationCenter |
	oldRotationCenter := self rotationCenter.
	size := aPoint x min: aPoint y.
	super extent: size @ size.
	self rotationCenter: oldRotationCenter.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
CircleMorph>>initialize [
	super initialize. 
	referencePosition := self center.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
CircleMorph>>originalCenter [
	^ originalCenter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
CircleMorph>>originalCenter: anObject [
	originalCenter := anObject
]

{
	#category : #'rotate scale and flex',
	#timestamp : ' 8/31/2017 05:26:13'
}
CircleMorph>>prepareForRotating [
	"When rotating from a halo, I can do this without a flex shell"

	^ self

]

{
	#category : #'rotate scale and flex',
	#timestamp : ' 8/31/2017 05:26:13'
}
CircleMorph>>prepareForScaling [
	"When scaling from a halo, I can do this without a flex shell"

	^ self

]

{
	#category : #'rotate scale and flex',
	#timestamp : ' 8/31/2017 05:26:13'
}
CircleMorph>>privateMoveBy: delta [
	referencePosition := referencePosition + delta.
	originalCenter := (originalCenter ifNil: [ self center ]) + delta.
	super privateMoveBy: delta
]

{
	#category : #'geometry etoy',
	#timestamp : ' 8/31/2017 05:26:13'
}
CircleMorph>>referencePosition [
	"Return the current reference position of the receiver"

	^ referencePosition
]

{
	#category : #'geometry etoy',
	#timestamp : ' 8/31/2017 05:26:13'
}
CircleMorph>>rotationCenter [
	"Return the rotation center of the receiver. The rotation center defines the relative offset inside the receiver's bounds for locating the reference position."
	| refPos |
	refPos := self referencePosition.
	^ (refPos - self bounds origin) / self bounds extent asFloatPoint
]

{
	#category : #'geometry etoy',
	#timestamp : ' 8/31/2017 05:26:13'
}
CircleMorph>>rotationCenter: aPointOrNil [
	"Set the new rotation center of the receiver. The rotation center defines the relative offset inside the receiver's bounds for locating the reference position."

	| newRef box |
	aPointOrNil
		ifNotNil: [ box := self bounds.
			newRef := box origin + (aPointOrNil * box extent).
			self setRotationCenterFrom: newRef ]
]

{
	#category : #'rotate scale and flex',
	#timestamp : ' 8/31/2017 05:26:13'
}
CircleMorph>>rotationDegrees [

	^ self forwardDirection
]

{
	#category : #'rotate scale and flex',
	#timestamp : ' 8/31/2017 05:26:13'
}
CircleMorph>>rotationDegrees: degrees [
	| ref newPos flex origAngle origCenter |
	ref := self referencePosition.
	origAngle := originalAngle ifNil: [ self heading ].
	origCenter := originalCenter ifNil: [ self center ].
	flex := (MorphicTransform offset: ref negated)
		withAngle: (degrees - origAngle) degreesToRadians.
	newPos := (flex transform: origCenter) - flex offset.
	self position: (self position + newPos - self center) asIntegerPoint.
	referencePosition := ref.
	originalAngle := origAngle.
	originalCenter := origCenter.
	self forwardDirection: degrees.
	self changed
]

{
	#category : #menus,
	#timestamp : ' 8/31/2017 05:26:13'
}
CircleMorph>>setRotationCenterFrom: aPoint [
	"Called by halo rotation code.
	Circles store their referencePosition."

	referencePosition := aPoint.
	originalCenter := self center.
	originalAngle := self heading
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:13'
}
CircleMorph>>transformedBy: aTransform [
	aTransform isIdentity ifTrue:[^self].
	^self center: (aTransform localPointToGlobal: self center).

]
