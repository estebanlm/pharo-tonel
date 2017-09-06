"
i represent a line segment,
created using 
	#lineTo: 
command of AthensPathBuilder
"
Class {
	#name : #AthensLineSegment,
	#superclass : #AthensPathSegment,
	#instVars : [
		'point'
	],
	#category : #Athens-Core-Paths,
	#timestamp : '<historical>'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensLineSegment>>accept: aVisitor [
	^ aVisitor lineSegment: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensLineSegment>>endPoint [
	^ point
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensLineSegment>>point [

	^ point
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensLineSegment>>point: anObject [

	point := anObject
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensLineSegment>>sendCommandTo: aBuilder [
	^ aBuilder lineTo: point
	
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensLineSegment>>visitWith: visitor [

	visitor visitLineSegment:  self
]
