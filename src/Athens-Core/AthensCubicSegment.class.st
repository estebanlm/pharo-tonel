"
i represent a cubic Bezier path segment
"
Class {
	#name : #AthensCubicSegment,
	#superclass : #AthensPathSegment,
	#instVars : [
		'via1',
		'via2',
		'to'
	],
	#category : #Athens-Core-Paths,
	#timestamp : 'IgorStasenko 3/7/2012 13:32'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCubicSegment>>accept: aVisitor [
	^ aVisitor cubicBezierSegment: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCubicSegment>>endPoint [
	^ to
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCubicSegment>>from: origin
	via: controlPoint
	and: secondControlPoint
	to: destination [
	
	
	via1:= controlPoint.
	via2 := secondControlPoint.
	to := destination.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCubicSegment>>isCubic [
	^true
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCubicSegment>>sendCommandTo: aBuilder [
	^ aBuilder curveVia: via1 and: via2  to: to 
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCubicSegment>>to [

	^ to
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCubicSegment>>via1 [
	^ via1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCubicSegment>>via2 [
	^ via2
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCubicSegment>>via2reflected [
	^self endPoint * 2 - via2
]
