"
This class provides a compact bit encoding for the most commonly used layout properties.
"
Class {
	#name : #LayoutProperties,
	#superclass : #Object,
	#instVars : [
		'hResizing',
		'vResizing',
		'disableLayout'
	],
	#category : #Morphic-Base-Layouts,
	#timestamp : '<historical>'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>asTableLayoutProperties [
	^(TableLayoutProperties new)
		hResizing: self hResizing;
		vResizing: self vResizing;
		disableTableLayout: self disableTableLayout;
		yourself
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>cellInset [
	"Default"
	^0
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>cellPositioning [
	^#center
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>cellSpacing [
	"Default"
	^#none
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>disableTableLayout [
	^disableLayout
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>disableTableLayout: aBool [
	disableLayout := aBool
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>hResizing [
	^hResizing
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>hResizing: aSymbol [
	hResizing := aSymbol
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>includesTableProperties [
	^false
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>initialize [
	super initialize.
	hResizing := vResizing := #rigid.
	disableLayout := false.
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>initializeFrom: defaultProvider [
	"Initialize the receiver from a default provider"
	self hResizing: defaultProvider hResizing.
	self vResizing: defaultProvider vResizing.
	self disableTableLayout: defaultProvider disableTableLayout.
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>layoutInset [
	^0
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>listCentering [
	"Default"
	^#topLeft
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>listDirection [
	"Default"
	^#topToBottom
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>listSpacing [
	"Default"
	^#none
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>maxCellSize [
	^SmallInteger maxVal
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>minCellSize [
	^0
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>reverseTableCells [
	^false
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>rubberBandCells [
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>vResizing [
	^vResizing
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>vResizing: aSymbol [
	vResizing := aSymbol
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>wrapCentering [
	^#topLeft
]

{
	#category : #'table defaults',
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutProperties>>wrapDirection [
	^#none
]
