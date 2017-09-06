"
A GLMScrollbarBrick is vertical scollbar for a scrollpane. User can't interact with it

Instance Variables
	bar:		<Object>
	scrollPane:		<Object>

bar
	- xxxxx

scrollPane
	- xxxxx

"
Class {
	#name : #GLMScrollbarBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'scrollPane',
		'bar'
	],
	#category : #Glamour-Morphic-Brick-Widgets-Scrollpane,
	#timestamp : 'AliakseiSyrel 11/19/2014 20:32'
}

{
	#category : #scrollbar-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>bar [

	^ bar
]

{
	#category : #scrollbar-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>bar: aBrick [

	bar := aBrick.
	self addBrickBack: aBrick
]

{
	#category : #scrollbar-calculations,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>calculateScrollbarHeight [

	^ (((self scrollPane height min: (self scrollPane layout maxHeight brickValue: self scrollPane)) / (self scrollPane band height)) * (self height min: (self scrollPane layout maxHeight brickValue: self scrollPane) )) ceiling.
]

{
	#category : #scrollbar-calculations,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>calculateScrollbarTopOffset [

	^ (((self height) / (self scrollPane band height)) * (self scrollPane band brickBounds top abs)) floor.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>initialize [
	super initialize.
	
	self
		useVerticalLinearLayout;
		bar: self newBar.
]

{
	#category : #scrollbar-brick-creation,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>newBar [

	^ GLMBrick new
]

{
	#category : #brick-properties-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>onThemerChanged [
	super onThemerChanged.

	self updateStyle
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>scrollBarColor [

	^ self valueOfProperty: #brickScrollbarColor ifAbsent: [ self themer scrollbarColor ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>scrollBarColor: aColor [

	self setProperty: #brickScrollbarColor toValue: aColor.
	self updateStyle
]

{
	#category : #scrollbar-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>scrollPane [

	^ scrollPane
]

{
	#category : #scrollbar-brick-accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>scrollPane: anObject [

	scrollPane := anObject.
	self updatePosition.
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>scrollbarCornerRadius [

	^ self valueOfProperty: #brickScrollbarCornerRadius ifAbsent: [ self themer scrollbarCornerRadius ]
	
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>scrollbarCornerRadius: anInteger [

	self setProperty: #brickScrollbarCornerRadius toValue: anInteger.
	self updateStyle
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>scrollbarOffset [

	^ self valueOfProperty: #brickScrollbarOffset ifAbsent: [ self themer scrollbarOffset ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>scrollbarOffset: anInteger [

	self setProperty: #brickScrollbarOffset toValue: anInteger.
	self updateStyle
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>scrollbarPosition [

	^ self valueOfProperty: #brickScrollbarPosition ifAbsent: [ self themer scrollbarPosition ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>scrollbarPosition: aSymbol [

	self setProperty: #brickScrollbarPosition toValue: aSymbol.
	self updateStyle
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>scrollbarWidth [

	^ self valueOfProperty: #brickScrollbarWidth ifAbsent: [ self themer scrollbarWidth ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>scrollbarWidth: anInteger [

	self setProperty: #brickScrollbarWidth toValue: anInteger.
	self updateStyle
]

{
	#category : #scrollbar-updating,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>updatePosition [
	|height top width|
	self scrollPane ifNil: [ ^ self ].
	self scrollPane band height = 0 ifTrue: [
		self bar brickBounds: ((0@0) extent: 0@0).
		^ self changed ].
	
	height := self calculateScrollbarHeight.
	top := self calculateScrollbarTopOffset.
	
	width := (height >= self height)
		ifTrue: [ 0 ]
		ifFalse: [ self width ].
	
	self bar brickBounds: (0@top extent: width@height).
	
	self changed
]

{
	#category : #scrollbar-updating,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMScrollbarBrick>>updateStyle [

	self bar color: self scrollBarColor.
	self layout floating: self scrollbarPosition.
	self width: self scrollbarWidth.
	
	self layout floating = #right ifTrue: [ self marginRight: self scrollbarOffset ].
	self layout floating = #bottom ifTrue: [ self marginBottom: self scrollbarOffset ].
	self layout floating = #left ifTrue: [ self marginLeft: self scrollbarOffset ].
	self layout floating = #top ifTrue: [ self marginTop: self scrollbarOffset ]
]
