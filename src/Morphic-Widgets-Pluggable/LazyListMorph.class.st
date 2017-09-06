"
The morph that displays the list in a PluggableListMorph.  It is ""lazy"" because it will only request the list items that it actually needs to display.

I will cache the maximum width of my items in maxWidth to avoid this potentially expensive and frequent computation.
"
Class {
	#name : #LazyListMorph,
	#superclass : #Morph,
	#instVars : [
		'listItems',
		'font',
		'selectedRow',
		'selectedRows',
		'listSource',
		'maxWidth'
	],
	#category : #Morphic-Widgets-Pluggable,
	#timestamp : 'efc 8/6/2005 11:34'
}

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>adjustHeight [
	"private.  Adjust our height to match that of the underlying list"
	self height: (listItems size max: 1) * font height

]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>adjustWidth [
	"private.  Adjust our width to match that of the underlying list"
	self width: ((listSource width max: self hUnadjustedScrollRange) + 20). 

]

{
	#category : #'row management',
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>backgroundColorForRow: row  [
	"Answer the color for the row text."
	^ (self isRowSelected: row )
		ifTrue: [ listSource selectionColorToUse ]
		ifFalse: [ self theme backgroundColor ]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>bottomVisibleRowForCanvas: aCanvas [
        "return the bottom visible row in aCanvas's clip rectangle"
        ^self rowAtLocation: aCanvas clipRect bottomLeft.

]

{
	#category : #'row management',
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>colorForRow: row  [
	"Answer the color for the row text."
	^ (self isRowSelected: row )
		ifTrue: [ self theme selectionTextColor ]
		ifFalse: [ self color ]
]

{
	#category : #'row management',
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>display: item atRow: row on: aCanvas [
	"Display the given item at the given row on the given
	canvas."

	| itemColor backgroundColor drawBounds |
	drawBounds := self drawBoundsForRow: row.
	itemColor := self colorForRow: row.
	backgroundColor := self backgroundColorForRow: row.
	item
		listRenderOn: aCanvas
		atRow: row
		bounds: drawBounds
		color: itemColor
		backgroundColor: backgroundColor 
		from: self.
		
	row = self mouseDownRow
		ifTrue: [ 
			aCanvas
				frameRectangle: (self selectionFrameForRow: row)
				width: 1
				colors: {itemColor. (Color transparent)}
				dashes: #(1 1) ]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>drawBackgroundForPotentialDrop: row on: aCanvas [
	| selectionDrawBounds |
	"shade the background darker, if this row is a potential drop target"

	selectionDrawBounds := self drawBoundsForRow: row.
	selectionDrawBounds := selectionDrawBounds intersect: self bounds ifNone: [^ self ].
	aCanvas fillRectangle: selectionDrawBounds color:  self color muchLighter darker
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>drawBackgroundForRow: row on: aCanvas color: aColor [
	| frame  |
	"shade the background darker, if this row is selected"
 	frame := self selectionFrameForRow: row.
	aCanvas
		fillRectangle: frame
		color: aColor
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>drawBackgroundForSearchedRow: row on: aCanvas [
	
	self drawBackgroundForRow: row on: aCanvas color: listSource secondarySelectionColor
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>drawBackgroundForSelectedRow: row on: aCanvas [

	self drawBackgroundForRow: row on: aCanvas color: listSource selectionColorToUse
]

{
	#category : #'list management',
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>drawBoundsForRow: row [
	"calculate the bounds that row should be drawn at.  This might be outside our bounds!"

	| topLeft drawBounds item height |
	item := [ self getListItem: row ]
		on: SubscriptOutOfBounds
		do: [ :ex | self getListItem: (row min: self getListSize) ].
	height := item heightToDisplayInList: self.
	topLeft := self topLeft x @ (self topLeft y + ((row - 1) * height)).
	drawBounds := topLeft extent: self width @ height.
	^ drawBounds
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>drawOn: aCanvas  [
	listItems isEmpty
		ifTrue: [^ self].
		
	aCanvas fillRectangle: aCanvas clipRect color: (self theme listNormalFillStyleFor: self).
		
	"self drawSelectionOn: aCanvas."
	(self topVisibleRowForCanvas: aCanvas)
		to: (self bottomVisibleRowForCanvas: aCanvas) 
		do: [:row | 
			
			(listSource itemSelectedAmongMultiple: row)
				ifTrue: [ self drawBackgroundForSelectedRow: row on: aCanvas]
				ifFalse: [
					(listSource searchedElement = row)
						ifTrue: [ self drawBackgroundForSearchedRow: row on: aCanvas]
						ifFalse: [
							(listSource backgroundColorFor: row)
								ifNotNil: [:col |
									self drawBackgroundForRow: row on: aCanvas color: col ]]].
						
			selectedRow = row ifTrue: [ self drawSelectionOn: aCanvas ].
			(listSource separatorAfterARow: row) ifTrue: [ self drawSeparatorAfter: row on: aCanvas ].
			self
				display: (self item: row)
				atRow: row
				on: aCanvas].
		
	listSource potentialDropRow > 0
		ifTrue: [self highlightPotentialDropRow: listSource potentialDropRow on: aCanvas]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>drawSelectionOn: aCanvas [
	"Draw the selection background."
	
	selectedRow ifNil: [ ^self ].
	selectedRow = 0 ifTrue: [ ^self ].
	self drawBackgroundForSelectedRow: selectedRow on: aCanvas

]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>drawSeparatorAfter: aRow on: aCanvas [

	| frame rectangle height separatorColor |
	height := listSource separatorSize.
	separatorColor := listSource separatorColor.
	frame := self selectionFrameForRow: aRow.
	rectangle := (frame left@(frame bottom - height)) corner: (frame right@frame bottom).
	aCanvas fillRectangle: rectangle color:  separatorColor
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>font [
	"return the font used for drawing.  The response is never nil"
	^font
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>font: newFont [
	font := (newFont ifNil: [ TextStyle default defaultFont ]).
	self adjustHeight.
	self changed.
]

{
	#category : #'list access',
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>getListItem: index [
	"grab a list item directly from the model"
	^listSource getListItem: index
]

{
	#category : #'list access',
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>getListSize [
	"return the number of items in the list"
	^listSource 
		ifNil: [ 0 ]
		ifNotNil: [ :source | source getListSize]
		
	
]

{
	#category : #'row management',
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>hUnadjustedScrollRange [
"Ok, this is a bit messed up. We need to return the width of the widest item in the list. If we grab every item in the list, it defeats the purpose of LazyListMorph. If we don't, then we don't know the size. 

This is a compromise -- find the widest of the first 30 items, then double it, This width will be updated as new items are installed, so it will always be correct for the visible items. If you know a better way, please chime in."

	| itemsToCheck item index |
	"Check for a cached value"
	maxWidth ifNotNil:[^maxWidth].

	listItems isEmpty ifTrue: [^0]. "don't set maxWidth if empty do will be recomputed when there are some items"
	"Compute from scratch"
	itemsToCheck := 30 min: (listItems size).
	maxWidth := 0. 

	"Check the first few items to get a representative sample of the rest of the list."
	index := 1.
	[index < itemsToCheck] whileTrue:
		[ item := self getListItem: index. "Be careful not to actually install this item"
		maxWidth := maxWidth max: (item widthToDisplayInList: self).
		index:= index + 1.
		].

	"Add some initial fudge if we didn't check all the items."
	(itemsToCheck < listItems size) ifTrue:[maxWidth := maxWidth*2].

	^maxWidth

]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>highlightPotentialDropRow: row  on: aCanvas [
	| drawBounds  |
	drawBounds := self drawBoundsForRow: row.
	drawBounds := drawBounds intersect: self bounds ifNone: [ ^ self ].
	aCanvas frameRectangle: drawBounds color: Color blue
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>initialize [
	super initialize.
	self color: self theme textColor.
	font := StandardFonts listFont.
	listItems := #().
	selectedRow := nil.
	selectedRows := PluggableSet integerSet.
	self adjustHeight.
]

{
	#category : #'row management',
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>isRowSelected: row  [
	"Answer true if the arg row is selected"
	^ ((selectedRow notNil
				and: [row = selectedRow])
			or: [listSource itemSelectedAmongMultiple: row])

]

{
	#category : #'list access',
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>item: index [
	"return the index-th item, using the 'listItems' cache"
	| newItem itemWidth |
	(index between: 1 and: listItems size)
		ifFalse: [ "there should have been an update, but there wasn't!"  ^self getListItem: index].
	(listItems at: index) ifNil: [ 
		newItem := self getListItem: index.
		"Update the width cache."
		maxWidth ifNotNil:[
			itemWidth := newItem widthToDisplayInList: self.
			itemWidth > maxWidth ifTrue:[
				maxWidth := itemWidth.
				self adjustWidth.
			]].
		listItems at: index put: newItem ].
	^listItems at: index
]

{
	#category : #'row management',
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>listChanged [
	"set newList to be the list of strings to display"
	listItems := Array new: self getListSize withAll: nil.
	self removeAllMorphs.
	selectedRow := nil.
	selectedRows := PluggableSet integerSet.
	maxWidth := nil. "recompute"
	self adjustHeight.
	self adjustWidth.
	self changed.

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>listSource: aListSource [
	"set the source of list items -- typically a PluggableListMorph"
	listSource := aListSource.
	self listChanged
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>mouseDownRow [
	"Answer the row that should have mouse down highlighting if any."

	^self valueOfProperty: #mouseDownRow
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>mouseDownRow: anInteger [
	"Set the row that should have mouse down highlighting or nil if none."

	anInteger = self mouseDownRow ifTrue: [^self].
	self mouseDownRowFrameChanged.
	self setProperty: #mouseDownRow toValue: anInteger.
	self mouseDownRowFrameChanged
]

{
	#category : #'row management',
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>mouseDownRowFrameChanged [
	"Invalidate frame of the current mouse down row if any."
	
	|frame row|
	row := self mouseDownRow ifNil: [ ^self ].
	frame := self selectionFrameForRow: row.
	self invalidRect: frame
]

{
	#category : #'list management',
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>rowAtLocation: aPoint [
	"return the number of the row at aPoint"
	| y |
	y := aPoint y.
	y < self top ifTrue: [ ^ 1 ].
	^((y - self top // (font height)) + 1) min: listItems size max: 0
]

{
	#category : #'row management',
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>selectRow: index [
	"Select the index-th row."
	
	selectedRows add: index.
	self invalidRect: (self selectionFrameForRow: index)
]

{
	#category : #'list management',
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>selectedRow [
	"return the currently selected row, or nil if none is selected"
	^selectedRow
]

{
	#category : #'row management',
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>selectedRow: index [
	"Select the index-th row.  if nil, remove the current selection."
	
	selectedRow ifNotNil: [self selectionFrameChanged].
	selectedRow := index.
	selectedRow ifNotNil: [self selectionFrameChanged]
]

{
	#category : #'row management',
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>selectionFrameChanged [
	"Invalidate frame of the current selection if any."
	
	| frame |
	selectedRow ifNil: [ ^self ].
	selectedRow = 0 ifTrue: [ ^self ].
	(selectedRow > self getListSize) ifTrue: [ ^self ].
	frame := self selectionFrameForRow: selectedRow.
	self invalidRect: frame
]

{
	#category : #'row management',
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>selectionFrameForRow: row [
	"Answer the selection frame rectangle."

	|frame| 
	frame := self drawBoundsForRow: row.
	frame := frame intersect: self bounds .
	frame := self bounds: frame in: listSource.
	frame := self
		bounds: ((frame left: listSource innerBounds left) right: listSource innerBounds right)
		from: listSource.
	^frame
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>topVisibleRowForCanvas: aCanvas [
        "return the top visible row in aCanvas's clip rectangle"
        ^self rowAtLocation: aCanvas clipRect topLeft.

]

{
	#category : #'row management',
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>unselectRow: index [
	"Unselect the index-th row."
	
	selectedRows remove: index ifAbsent: [^self].
	self invalidRect: (self selectionFrameForRow: index)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
LazyListMorph>>userString [
	"Do I have a text string to be searched on?"

	^ String streamContents: [:strm |
		1 to: self getListSize do: [:i |
			strm nextPutAll: (self getListItem: i); cr]]
]
