"
i represent a circular arc, connecting  
previous segment endpoint and my endpoing
of given angle, passing in clockwise direction.
"
Class {
	#name : #AthensCWArcSegment,
	#superclass : #AthensArcSegment,
	#category : #Athens-Core-Paths,
	#timestamp : '<historical>'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCWArcSegment>>accept: aVisitor [
	^ aVisitor cwArcSegment: self
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCWArcSegment>>sendCommandTo: aBuilder [
	^ aBuilder cwArcTo: endPoint angle: angle
]
