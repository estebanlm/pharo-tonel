"

"
Class {
	#name : #RubSurfaceSelectionShape,
	#superclass : #Object,
	#instVars : [
		'color',
		'borderColor',
		'borderWidth',
		'firstIndex',
		'lastIndex',
		'tag',
		'vertices'
	],
	#category : #Rubric-Editing-Core,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSurfaceSelectionShape class>>vertices: aCollectionOfPoints firstIndex: firstCharBlock lastIndex: lastCharBlock color: aColor borderWidth: aBorderWidth borderColor: aBorderColor [
	^ self new
		vertices: aCollectionOfPoints
		firstIndex: firstCharBlock
		lastIndex: lastCharBlock
		color: aColor
		borderWidth: aBorderWidth
		borderColor: aBorderColor

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSurfaceSelectionShape>>backgroundColor [
	^ color
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSurfaceSelectionShape>>borderColor [
	^ borderColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSurfaceSelectionShape>>borderWidth [
	^ borderWidth
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSurfaceSelectionShape>>bounds [
	^ self polygon bounds
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSurfaceSelectionShape>>drawOn: aCanvas  [
	aCanvas drawPolygon: self vertices color: self backgroundColor borderWidth: borderWidth borderColor:  borderColor
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSurfaceSelectionShape>>drawOnAthensCanvas: aCanvas [
	| path |
	path := aCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveTo: self vertices first.
			self vertices allButFirstDo: [ :pt | builder lineTo: pt ].
			builder close ].
	aCanvas setShape: path.
	aCanvas setPaint: self backgroundColor.
	aCanvas draw.
	borderWidth > 0
		ifTrue: [ 
			(aCanvas setStrokePaint: borderColor)
				capSquare;
				width: borderWidth.
			aCanvas draw ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSurfaceSelectionShape>>firstIndex [
	^ firstIndex 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSurfaceSelectionShape>>lastIndex [
	^ lastIndex
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSurfaceSelectionShape>>polygon [
	^ Polygon vertices: self vertices
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSurfaceSelectionShape>>vertices [
	^ vertices
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSurfaceSelectionShape>>vertices: aCollectionOfPoints firstIndex: firstCharIndex lastIndex: lastCharIndex color: aColor borderWidth: aBorderWidth borderColor: aBorderColor [
	firstIndex := firstCharIndex.
	lastIndex := lastCharIndex.
	vertices := aCollectionOfPoints.
	color := aColor.
	borderWidth := aBorderWidth.
	borderColor := aBorderColor
]
