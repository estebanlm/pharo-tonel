"
OrientedFill is an abstract superclass for fills which can be aligned appropriately.

Instance variables:
	origin	<Point>	The point at which to align the fill.
	direction <Point>	The direction in which the fill is defined
	normal	<Point>	Typically, just the direction rotated by 90 degrees.
"
Class {
	#name : #OrientedFillStyle,
	#superclass : #FillStyle,
	#instVars : [
		'origin',
		'direction',
		'normal'
	],
	#category : #Balloon-Fills,
	#timestamp : '<historical>'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:11'
}
OrientedFillStyle>>= anOrientedFillStyle [
	"Answer whether equal."

	^self species = anOrientedFillStyle species
		and: [self origin = anOrientedFillStyle origin
		and: [self direction = anOrientedFillStyle direction
		and: [self normal = anOrientedFillStyle normal]]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
OrientedFillStyle>>direction [
	^direction ifNil:[direction := normal y @ normal x negated]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
OrientedFillStyle>>direction: aPoint [
	direction := aPoint
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:11'
}
OrientedFillStyle>>hash [
	"Hash is implemented because #= is implemented."
	
	^self species hash
		bitXor: (self origin hash
		bitXor: (self direction hash
		bitXor: (self normal hash)))
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
OrientedFillStyle>>isOrientedFill [
	"Return true if the receiver keeps an orientation (e.g., origin, direction, and normal)"
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
OrientedFillStyle>>normal [
	^normal ifNil:[normal := direction y negated @ direction x]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
OrientedFillStyle>>normal: aPoint [
	normal := aPoint
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
OrientedFillStyle>>origin [
	^origin
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
OrientedFillStyle>>origin: aPoint [
	origin := aPoint.
]
