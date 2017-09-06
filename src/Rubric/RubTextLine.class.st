"
I represent a line of text
"
Class {
	#name : #RubTextLine,
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
		'baseline',
		'actualWidth',
		'lineNumber',
		'stopCondition'
	],
	#pools : [
		'TextConstants'
	],
	#category : #Rubric-Editing-Core,
	#timestamp : 'FranckWarlouzet 7/29/2015 13:23'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine class>>start: startInteger stop: stopInteger internalSpaces: spacesInteger paddingWidth: padWidthInteger [
	"Answer an instance of me with the arguments as the start, stop points, 
	number of spaces in the line, and width of the padding."
	| line |
	line := self new firstIndex: startInteger lastIndex: stopInteger.
	^ line internalSpaces: spacesInteger paddingWidth: padWidthInteger
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>= line [

	self species = line species
		ifTrue: [^((firstIndex = line first and: [lastIndex = line last])
				and: [internalSpaces = line internalSpaces])
				and: [paddingWidth = line paddingWidth]]
		ifFalse: [^false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>actualWidth [
	^ actualWidth ifNil: [ 0 ] "self right - self paddingWidth"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>actualWidth: anObject [
	actualWidth := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>baseline [
	^ baseline
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>bottom [
	^ bottom
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>bottomLeft [
	^ left@bottom
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>bottomRight [
	^ right@bottom
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>first [
	^ firstIndex
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>firstIndex: firstInteger lastIndex: lastInteger [
	firstIndex := firstInteger.
	lastIndex := lastInteger
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>hash [
	"#hash is re-implemented because #= is re-implemented"
	^firstIndex hash bitXor: lastIndex hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>height [
	^ self bottom - self top
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>internalSpaces [
	"Answer the number of spaces in the line."

	^internalSpaces
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>internalSpaces: spacesInteger  [
	"Set the number of spaces in the line to be spacesInteger."

	internalSpaces := spacesInteger
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>internalSpaces: spacesInteger paddingWidth: padWidthInteger [

	internalSpaces := spacesInteger asInteger.
	paddingWidth := padWidthInteger asInteger
]

{
	#category : #scanning,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>justifiedPadFor: spaceIndex  [
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
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>justifiedPadFor: spaceIndex font: aFont [
	"Compute the width of pad for a given space in a line of justified text."

	| pad |
	internalSpaces = 0 ifTrue: [^0].
	^(aFont notNil and:[aFont isSubPixelPositioned])
		ifTrue:[paddingWidth * 1.0 / internalSpaces]
		ifFalse:[
			pad := paddingWidth // internalSpaces.
			spaceIndex <= (paddingWidth \\ internalSpaces)
				ifTrue: [pad + 1]
				ifFalse: [pad]]
		
]

{
	#category : #scanning,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>justifiedTabDeltaFor: spaceIndex  [
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
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>last [
	^ lastIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>left [
	^ left
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>leftMargin [
	"This has to get fixed -- store during composition"
	^ self left
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>leftMargin: lm [
	left := lm
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>leftMarginForAlignment: alignmentCode [
	alignmentCode = RightFlush ifTrue: [^ self left + paddingWidth].
	alignmentCode = Centered ifTrue: [^ self left + (paddingWidth//2)].
	^ self left  "leftFlush and justified"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>lineHeight [
	^ bottom - top
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>lineHeight: height baseline: ascent [
	bottom := top + height.
	baseline := ascent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>lineNumber [
	^ lineNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>lineNumber: anInteger [
	lineNumber := anInteger
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>moveBy: delta  [
	"Move my rectangle by the given delta"
	left := left + delta x.
	right := right + delta x.
	top := top + delta y.
	bottom := bottom + delta y.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>paddingWidth [
	"Answer the amount of space to be added to the font."

	^paddingWidth
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>paddingWidth: padWidthInteger  [
	"Set the amount of space to be added to the font to be padWidthInteger."

	paddingWidth := padWidthInteger asInteger
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>printOn: aStream [
	super printOn: aStream.
	aStream space; print: firstIndex; nextPutAll: ' to: '; print: lastIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>rectangle [
	^ self topLeft corner: self bottomRight
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>rectangle: lineRectangle [
	left := lineRectangle left.
	right := lineRectangle right.
	top := lineRectangle top.
	bottom := lineRectangle bottom
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>right [
	^ right
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>rightMargin [
	"This has to get fixed -- store during composition"
	^ self right
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>setRight: x [
	right := x
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>slide: delta  [
	"Change the starting and stopping points of the line by delta."

	firstIndex := firstIndex + delta.
	lastIndex := lastIndex + delta
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>slideIndexBy: delta andMoveTopTo: newTop [
	"Relocate my character indices and y-values.
	Used to slide constant text up or down in the wake of a text replacement."

	firstIndex := firstIndex + delta.
	lastIndex := lastIndex + delta.
	bottom := bottom + (newTop - top).
	top := newTop.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>stop: stopInteger  [
	"Set the stopping point in the string of the line to be stopInteger."

	lastIndex := stopInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>stopCondition [
	^ stopCondition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>stopCondition: aSymbol [
	stopCondition := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>top [
	^ top
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>topLeft [
	^ left @ top
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>topRight [
	^ right @ top
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextLine>>width [
	^ right - left
]
