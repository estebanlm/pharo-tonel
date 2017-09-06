"
I am an abstract class that knows my bounds and if a point is contained in me.
"
Class {
	#name : #Shape,
	#superclass : #Object,
	#category : #Graphics-Shapes,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:13'
}
Shape>>basicContainsPoint: aPoint [
	"Answer whether the receiver contains the given point."

	^self bounds containsPoint: aPoint
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
Shape>>bounds [
	"Answer a rectangle that encloses the receiver."

	self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:13'
}
Shape>>containsPoint: aPoint [
	"Answer whether the receiver contains the given point."

	^self basicContainsPoint: aPoint
]
