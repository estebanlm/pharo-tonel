"
i represent a quadric Bezier path segment.

Any quadratic spline can be expressed as a cubic (where the cubic term is zero). The end points of the cubic will be the same as the quadratic's.

    CP0 = QP0
    CP3 = QP2 

The two control points for the cubic are:

    CP1 = QP0 + 2/3 *(QP1-QP0)
    CP2 = QP2 + 2/3 *(QP1-QP2) 
"
Class {
	#name : #AthensQuadSegment,
	#superclass : #AthensPathSegment,
	#instVars : [
		'via',
		'to'
	],
	#category : #Athens-Core-Paths,
	#timestamp : 'IgorStasenko 3/7/2012 13:32'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensQuadSegment>>accept: aVisitor [
	^ aVisitor quadricBezierSegment: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensQuadSegment>>endPoint [
	^ to
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensQuadSegment>>from: pt0 via: pt1 to: p [

	via := pt1.
	to := p.
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensQuadSegment>>sendCommandTo: aBuilder [
	^ aBuilder curveVia: via to: to 
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensQuadSegment>>to [

	^ to
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensQuadSegment>>via [

	^ via
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensQuadSegment>>visitWith: visitor [

	visitor visitQuadSegment: self
]
