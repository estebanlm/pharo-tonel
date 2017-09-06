"

"
Class {
	#name : #TableLayoutProperties,
	#superclass : #LayoutProperties,
	#instVars : [
		'cellInset',
		'cellPositioning',
		'cellSpacing',
		'layoutInset',
		'listCentering',
		'listDirection',
		'listSpacing',
		'reverseTableCells',
		'rubberBandCells',
		'wrapCentering',
		'wrapDirection',
		'minCellSize',
		'maxCellSize'
	],
	#category : #Morphic-Base-Layouts,
	#timestamp : ''
}

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>cellInset [
	^cellInset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>cellInset: aNumber [
	cellInset := aNumber
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>cellPositioning [
	^cellPositioning
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>cellPositioning: aSymbol [
	cellPositioning := aSymbol
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>cellSpacing [
	^cellSpacing
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>cellSpacing: aSymbol [
	cellSpacing := aSymbol.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>includesTableProperties [
	^true
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>initialize [
	super initialize.
	cellSpacing := listSpacing := wrapDirection := #none.
	cellPositioning := #center.
	listCentering := wrapCentering := #topLeft.
	listDirection := #topToBottom.
	reverseTableCells := rubberBandCells := false.
	layoutInset := cellInset := minCellSize := 0.
	maxCellSize := 1073741823. "SmallInteger maxVal"

]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>layoutInset [
	^layoutInset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>layoutInset: aNumber [
	layoutInset := aNumber
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>listCentering [
	^listCentering
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>listCentering: aSymbol [
	listCentering := aSymbol
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>listDirection [
	^listDirection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>listDirection: aSymbol [
	listDirection := aSymbol.
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>listSpacing [
	^listSpacing
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>listSpacing: aSymbol [
	listSpacing := aSymbol
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>maxCellSize [
	^maxCellSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>maxCellSize: aNumber [
	maxCellSize := aNumber.
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>minCellSize [
	^minCellSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>minCellSize: aNumber [
	minCellSize := aNumber.
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>reverseTableCells [
	^reverseTableCells
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>reverseTableCells: aBool [
	reverseTableCells := aBool
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>rubberBandCells [
	^rubberBandCells
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>rubberBandCells: aBool [
	rubberBandCells := aBool.
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>wrapCentering [
	^wrapCentering
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>wrapCentering: aSymbol [
	wrapCentering := aSymbol
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>wrapDirection [
	^wrapDirection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TableLayoutProperties>>wrapDirection: aSymbol [
	wrapDirection := aSymbol
]
