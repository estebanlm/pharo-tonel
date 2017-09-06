"
BalloonEdgeData defines an entry in the internal edge table of the Balloon engine.

Instance Variables:
	index	<Integer>	The index into the external objects array of the associated graphics engine
	xValue	<Integer>	The computed x-value of the requested operation
	yValue	<Integer>	The y-value for the requested operation
	height	<Integer>	The (remaining) height of the edge
	source	<Object>		The object from the external objects array
"
Class {
	#name : #BalloonEdgeData,
	#superclass : #Object,
	#instVars : [
		'index',
		'xValue',
		'yValue',
		'zValue',
		'lines',
		'source'
	],
	#category : #Balloon-Simulation,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonEdgeData>>index [
	^index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonEdgeData>>index: anInteger [
	index := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonEdgeData>>lines [
	^lines
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonEdgeData>>lines: anInteger [
	^lines := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonEdgeData>>source [
	^source
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonEdgeData>>source: anObject [
	source := anObject
]

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonEdgeData>>stepToFirstScanLine [
	source stepToFirstScanLineAt: yValue in: self
]

{
	#category : #computing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonEdgeData>>stepToNextScanLine [
	source stepToNextScanLineAt: yValue in: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonEdgeData>>xValue [
	^xValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonEdgeData>>xValue: anInteger [
	xValue := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonEdgeData>>yValue [
	^yValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonEdgeData>>yValue: anInteger [
	yValue := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonEdgeData>>zValue [
	^zValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
BalloonEdgeData>>zValue: anInteger [
	zValue := anInteger
]
