"
i represent a path shape in balloon backend
"
Class {
	#name : #AthensBalloonPath,
	#superclass : #AthensPath,
	#instVars : [
		'bounds',
		'contours',
		'last'
	],
	#category : #Athens-Balloon,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonPath>>contours [
	
	^ contours
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonPath>>contoursForFilling [
	"answer a collection of contours, ready for filling by balloon engine"
	^ contours collect: [:contour |
		contour last = contour first 
		ifTrue: [contour asArray] 
		ifFalse: [ (contour , { contour last. contour last. contour first }) ]
	]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonPath>>contoursForStroke [
	"answer a collection of contours, ready for stroking by balloon engine"
	^ contours collect: [:contour | contour asArray ]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonPath>>convertFromBuilder: aBuilder [
	| segment cContours |
	bounds := aBuilder pathBounds.
	segment := aBuilder pathStart.
	

	[ segment notNil ] whileTrue: [
		segment visitWith: self.
		segment := segment next ].
	
	" finally make all OrderedColllections ==> Array "
	cContours := Array new: contours size.
	1 to: cContours size do: [:i |
		cContours at: i put: (contours at: i) asArray.
		].
	contours := cContours.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonPath>>duplicateLastPoint [

	contours last size < 2 ifFalse: [
		"duplicate last contour point"
		contours last add: (contours last last).
		]. 

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonPath>>numContours [
	^ contours size
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonPath>>paintFillsUsing: aPaint on: anAthensCanvas  [
	
	"This method is a part of rendering dispatch  Canvas->receiver->paint"
	
	^ aPaint athensFillPath: self on: anAthensCanvas
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonPath>>paintStrokeUsing: paint on: anAthensCanvas  [
	
	^ paint strokePath: self on: anAthensCanvas

]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonPath>>visitCloseSegment: closeSegment [
	
	"see if its alredy closed"
	contours last last = contours last first ifFalse: [
		
		contours last 
			add: (contours last last);
			add: closeSegment endPoint;
			add: closeSegment endPoint
	]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonPath>>visitLineSegment: line [
	self duplicateLastPoint.
	contours last add: line endPoint;
		add: line endPoint.
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonPath>>visitMoveSegment: seg [
	
	contours ifNil: [
		contours := OrderedCollection new ].
	
	contours add: OrderedCollection new.
	contours last add: seg endPoint.
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensBalloonPath>>visitQuadSegment: quadSegment [

	self duplicateLastPoint.

	contours last add: quadSegment via;
		add: quadSegment to
]
