"
i am special kind of shape which using only straight line segments, unlike from more generic paths.
"
Class {
	#name : #AthensPolygon,
	#superclass : #Object,
	#instVars : [
		'contours',
		'currentContour'
	],
	#category : #Athens-Core-Paths,
	#timestamp : 'IgorStasenko 12/20/2011 18:38'
}

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensPolygon>>finish [
	"Finally convert contours to arrays"
	
	contours := contours collect: [:ea | ea asArray ]
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensPolygon>>lineTo: aPoint  [
	currentContour add: aPoint
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensPolygon>>moveTo: aPoint  [
	" create a new contour "
	
	self newContour.
	currentContour add: aPoint.
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensPolygon>>newContour [
	contours ifNil: [ contours := OrderedCollection new ].
	
	currentContour := contours add: OrderedCollection new.
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensPolygon>>paintFillsUsing: aPaint on: anAthensCanvas  [
	
	"This method is a part of rendering dispatch  Canvas->receiver->paint"
	
	^ aPaint fillPolygon: self on: anAthensCanvas
]
