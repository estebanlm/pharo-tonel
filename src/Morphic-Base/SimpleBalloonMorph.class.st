"

"
Class {
	#name : #SimpleBalloonMorph,
	#superclass : #BalloonMorph,
	#category : #Morphic-Base-Widgets,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
SimpleBalloonMorph class>>getVertices: bounds [
	"Construct vertices for a balloon up and to left of anchor."

	^(bounds expandBy: 3) corners atAll: #(1 4 3 2)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
SimpleBalloonMorph>>initialize [
	"Initialize the the receiver."
	
	super initialize.
	self beStraightSegments
]
