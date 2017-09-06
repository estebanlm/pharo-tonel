"
i am abstract class , representing an arc segment
"
Class {
	#name : #AthensArcSegment,
	#superclass : #AthensPathSegment,
	#instVars : [
		'endPoint',
		'angle'
	],
	#category : #Athens-Core-Paths,
	#timestamp : 'IgorStasenko 3/7/2012 13:41'
}

{
	#category : #accessors,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensArcSegment>>angle [
	^ angle
]

{
	#category : #accessors,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensArcSegment>>endPoint [
	^ endPoint
]

{
	#category : #accessors,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensArcSegment>>endPoint: pt angle: a [

	endPoint := pt.
	angle := a
]
