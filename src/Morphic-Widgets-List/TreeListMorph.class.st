"
A SimpleHierarchicalListMorph subclass supporting alternative fonts for all items.

This class is badly named and should be merged with its superclass - Stephane Ducasse
"
Class {
	#name : #TreeListMorph,
	#superclass : #SimpleHierarchicalListMorph,
	#instVars : [
		'font'
	],
	#category : #Morphic-Widgets-List,
	#timestamp : 'StephaneDucasse 6/23/2014 16:48'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
TreeListMorph>>addSubmorphsAfter: parentMorph fromCollection: aCollection allowSorting: sortBoolean [
	"Update the font on each morph."
	
	|answer|
	answer := super addSubmorphsAfter: parentMorph fromCollection: aCollection allowSorting: sortBoolean.
	"I commented out the following lines, because it makes this morph incredible slow.
	This is used to browse diffs from monticello which can be really big.
	I couldn't find any place where this Morph is used and needs the following lines.
	nicolai."
	self flag:#issue12027.
	"self scroller submorphsDo: [:i |
		i
			font: self font;
			extent: i minWidth @ i minHeight]."
	^answer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TreeListMorph>>font [
	"Answer the value of font"

	^font ifNil: [TextStyle defaultFont]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TreeListMorph>>font: anObject [
	"Set the value of font"

	font := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
TreeListMorph>>insertNewMorphs: morphList [
	"Update the font on each morph."
	
	morphList do: [:m |
		m
			font: self font;
			extent: m minWidth @ m minHeight].
	^super insertNewMorphs: morphList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TreeListMorph>>keystrokeActionSelector [
	"Answer the selector of the message to send to the model when a keystroke occurs."

	^keystrokeActionSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TreeListMorph>>keystrokeActionSelector: aSymbol [
	"Set the selector of the message to send to the model when a keystroke occurs.
	One or two arguments... 1 for character, 2 for character and sender (self)."

	keystrokeActionSelector := aSymbol
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
TreeListMorph>>layoutBounds: aRectangle [
	"Set the bounds for laying out children of the receiver.
	Update the scroller and scrollbars now since bounds set directly
	(not via #extent:)."
	
	super layoutBounds: aRectangle.
	self
		resizeScroller;
		setScrollDeltas
]
