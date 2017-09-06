"
A trait for morphs able to rotate
"
Trait {
	#name : #TAbleToRotate,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Morphic-Base-Basic,
	#timestamp : 'TorstenBergmann 4/27/2017 10:13'
}

{
	#category : #t-rotating,
	#timestamp : ' 8/31/2017 05:26:13'
}
TAbleToRotate>>forwardDirection [
	"Return the receiver's forward direction (in eToy terms)"
	^self valueOfProperty: #forwardDirection ifAbsent:[0.0]
]

{
	#category : #t-rotating,
	#timestamp : ' 8/31/2017 05:26:13'
}
TAbleToRotate>>forwardDirection: newDirection [
	"Set the receiver's forward direction (in eToy terms)"
	self setProperty: #forwardDirection toValue: newDirection.
]

{
	#category : #t-rotating,
	#timestamp : ' 8/31/2017 05:26:13'
}
TAbleToRotate>>heading [
	"Return the receiver's heading"
	^ self owner 
		ifNil: [self forwardDirection]
		ifNotNil: [self forwardDirection + self owner degreesOfFlex]
]

{
	#category : #t-rotating,
	#timestamp : ' 8/31/2017 05:26:13'
}
TAbleToRotate>>prepareForRotating [
	"If I require a flex shell to rotate,
	then wrap it in one and return it.
	Polygons, eg, may override to do nothing."

	^ self addFlexShell
]

{
	#category : #t-rotating,
	#timestamp : ' 8/31/2017 05:26:13'
}
TAbleToRotate>>rotationDegrees [
	"Default implementation."

	^ 0.0

]

{
	#category : #t-rotating,
	#timestamp : ' 8/31/2017 05:26:13'
}
TAbleToRotate>>rotationDegrees: degrees	 [
	"redefined in all morphs which are using myself"
]

{
	#category : #t-rotating,
	#timestamp : ' 8/31/2017 05:26:13'
}
TAbleToRotate>>setDirectionFrom: aPoint [
	| delta degrees |
	delta := (self transformFromWorld globalPointToLocal: aPoint) - self referencePosition.
	degrees := delta degrees + 90.0.
	self forwardDirection: (degrees \\ 360) rounded.

]
