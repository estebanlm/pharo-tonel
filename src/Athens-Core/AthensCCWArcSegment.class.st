"
i represent a circular arc, connecting  
previous segment endpoint and my endpoing
of given angle, passing in counter-clockwise direction.
"
Class {
	#name : #AthensCCWArcSegment,
	#superclass : #AthensArcSegment,
	#category : #Athens-Core-Paths,
	#timestamp : '<historical>'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCCWArcSegment>>accept: aVisitor [
	^ aVisitor ccwArcSegment: self
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCCWArcSegment>>sendCommandTo: aBuilder [
	^ aBuilder ccwArcTo: endPoint angle: angle
]
