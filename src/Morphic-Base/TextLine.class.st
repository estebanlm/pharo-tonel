"
A TextLine embodies the layout of a line of composed text.
	left right top bottom		The full line rectangle
	firstIndex lastIndex		Starting and stopping indices in the full text
	internalSpaces		Number of spaces to share paddingWidth
	paddingWidth		Number of pixels of extra space in full line
	baseline				Distance of baseline below the top of the line
	leftMargin			Left margin due to paragraph indentation
TextLine's rather verbose message protocol is required for compatibility with the old CharacterScanners.
"
Class {
	#name : #TextLine,
	#superclass : #Object,
	#instVars : [
		'left',
		'right',
		'top',
		'bottom',
		'firstIndex',
		'lastIndex',
		'internalSpaces',
		'paddingWidth',
		'baseline'
	],
	#pools : [
		'TextConstants'
	],
	#category : #'Morphic-Base-Text Support',
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine class>>start: startInteger stop: stopInteger internalSpaces: spacesInteger paddingWidth: padWidthInteger [
	"Answer an instance of me with the arguments as the start, stop points, 
	number of spaces in the line, and width of the padding."
	| line |
	line := self new firstIndex: startInteger lastIndex: stopInteger.
	^ line internalSpaces: spacesInteger paddingWidth: padWidthInteger
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>= line [

	self species = line species
		ifTrue: [^((firstIndex = line first and: [lastIndex = line last])
				and: [internalSpaces = line internalSpaces])
				and: [paddingWidth = line paddingWidth]]
		ifFalse: [^false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>baseline [
	^ baseline
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>bottom [
	^ bottom
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>bottomRight [
	^ right@bottom
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>first [
	^ firstIndex
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>firstIndex: firstInteger lastIndex: lastInteger [
	firstIndex := firstInteger.
	lastIndex := lastInteger
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>hash [
	"#hash is re-implemented because #= is re-implemented"
	^firstIndex hash bitXor: lastIndex hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>internalSpaces [
	"Answer the number of spaces in the line."

	^internalSpaces
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>internalSpaces: spacesInteger  [
	"Set the number of spaces in the line to be spacesInteger."

	internalSpaces := spacesInteger
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>internalSpaces: spacesInteger paddingWidth: padWidthInteger [

	internalSpaces := spacesInteger.
	paddingWidth := padWidthInteger
]

{
	#category : #scanning,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>justifiedPadFor: spaceIndex  [
	"Compute the width of pad for a given space in a line of justified text."

	| pad |
	internalSpaces = 0 ifTrue: [^0].
	pad := paddingWidth // internalSpaces.
	spaceIndex <= (paddingWidth \\ internalSpaces)
		ifTrue: [^pad + 1]
		ifFalse: [^pad]
]

{
	#category : #scanning,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>justifiedTabDeltaFor: spaceIndex  [
	"Compute the delta for a tab in a line of justified text, so tab falls 
	somewhere plausible when line is justified."

	| pad extraPad |
	internalSpaces = 0 ifTrue: [^0].
	pad := paddingWidth // internalSpaces.
	extraPad := paddingWidth \\ internalSpaces.
	spaceIndex <= extraPad
		ifTrue: [^spaceIndex * (pad + 1)]
		ifFalse: [^extraPad * (pad + 1) + (spaceIndex - extraPad * pad)]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>last [
	^ lastIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>left [
	^ left
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>leftMargin [
	"This has to get fixed -- store during composition"
	^ self left
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>leftMargin: lm [
	left := lm
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>leftMarginForAlignment: alignmentCode [
	alignmentCode = RightFlush ifTrue: [^ self left + paddingWidth].
	alignmentCode = Centered ifTrue: [^ self left + (paddingWidth//2)].
	^ self left  "leftFlush and justified"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>lineHeight [
	^ bottom - top
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>lineHeight: height baseline: ascent [
	bottom := top + height.
	baseline := ascent
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>moveBy: delta  [
	"Move my rectangle by the given delta"
	left := left + delta x.
	right := right + delta x.
	top := top + delta y.
	bottom := bottom + delta y.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>paddingWidth [
	"Answer the amount of space to be added to the font."

	^paddingWidth
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>paddingWidth: padWidthInteger  [
	"Set the amount of space to be added to the font to be padWidthInteger."

	paddingWidth := padWidthInteger
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>printOn: aStream [
	super printOn: aStream.
	aStream space; print: firstIndex; nextPutAll: ' to: '; print: lastIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>rectangle [
	^ self topLeft corner: self bottomRight
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>rectangle: lineRectangle [
	left := lineRectangle left.
	right := lineRectangle right.
	top := lineRectangle top.
	bottom := lineRectangle bottom
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>right [
	^ right
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>rightMargin [
	"This has to get fixed -- store during composition"
	^ self right
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>setRight: x [
	right := x
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>slide: delta  [
	"Change the starting and stopping points of the line by delta."

	firstIndex := firstIndex + delta.
	lastIndex := lastIndex + delta
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>slideIndexBy: delta andMoveTopTo: newTop [
	"Relocate my character indices and y-values.
	Used to slide constant text up or down in the wake of a text replacement."

	firstIndex := firstIndex + delta.
	lastIndex := lastIndex + delta.
	bottom := bottom + (newTop - top).
	top := newTop.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>stop: stopInteger  [
	"Set the stopping point in the string of the line to be stopInteger."

	lastIndex := stopInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>top [
	^ top
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>topLeft [
	^ left @ top
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
TextLine>>width [
	^ right - left
]
