"
Move segment always indicates starting of a new contour.
If contour ends with close command, then my insntance will have 'closed' flag set to true.

See AthensPathBuilder , which is responsible for building paths.
"
Class {
	#name : #AthensMoveSegment,
	#superclass : #AthensLineSegment,
	#instVars : [
		'closed'
	],
	#category : #Athens-Core-Paths,
	#timestamp : 'IgorStasenko 5/2/2011 05:35'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensMoveSegment>>accept: aVisitor [
	^ aVisitor moveSegment: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensMoveSegment>>closed: aBoolean [
	closed := aBoolean
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensMoveSegment>>isClosed [
	^ closed == true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensMoveSegment>>isMove [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensMoveSegment>>reopen: aBoolean [
	closed := aBoolean
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensMoveSegment>>sendCommandTo: aBuilder [
	^ aBuilder moveTo: point
	
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensMoveSegment>>visitWith: visitor [

	visitor visitMoveSegment: self
]
