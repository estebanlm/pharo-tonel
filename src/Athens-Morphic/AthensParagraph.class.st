"
this class is subject of changes/removal. do not use it.
"
Class {
	#name : #AthensParagraph,
	#superclass : #Object,
	#instVars : [
		'text',
		'textStyle',
		'containerRect',
		'lines',
		'positionWhenComposed',
		'selectionStart',
		'selectionStop'
	],
	#category : #Athens-Morphic,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>caretRect ^ (0@0 corner: 0@0)   [

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>characterBlockForIndex: index  [

		^ self defaultCharacterBlock
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>compose: aText style: aTextStyle from: startingIndex in: aRectangle  [
	text := aText.
	textStyle := aTextStyle
	
	self shouldBeImplemented.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>compose: aText style: aTextStyle in: rect  [

	text := aText.
	textStyle := aTextStyle.
	containerRect := rect.
	lines := (AthensTextComposer scan: aText for: AthensTextScanner new) lines.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>defaultCharacterBlock [
	^ (CharacterBlock new stringIndex: 1 text: text
			topLeft: 0@0 extent: 0 @ 0)
		textLine: lines first
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>drawOnAthensCanvas: canvas bounds: aRectangle  [

	| renderer |
	"self halt."
"	canvas
		clipBy: aRectangle 
		during: [  
"			renderer := AthensTextRenderer new.
			renderer render: text lines: lines on: canvas.
"		].
"
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>extent [
	^ containerRect width @ lines last bottom
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>extraSelectionChanged [
"
	refreshExtraSelection := true
"

	self flag: #foo
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>findReplaceSelectionRegex: aRegex [
"	findReplaceSelectionRegex := aRegex. "
	self flag: #foo

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>focused ^ false [

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>focused: bool [

	"why we should care?"
	
	"self flag: #ooo"
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>positionWhenComposed: pos [
	positionWhenComposed := pos
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>secondarySelection: aSubstring [
"	secondarySelection := aSubstring."
	self flag: #foo.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>selectionColor: anUndefinedObject  [
	self shouldBeImplemented.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>selectionRects [
	^ #()
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>selectionStart: startBlock selectionStop: stopBlock [
	selectionStart := startBlock.
	selectionStop := stopBlock.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>showCared  [

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>showCaret   [

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>showCaret: abool   [

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>text [
	^ text
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensParagraph>>textOwner: anUndefinedObject  [
	self shouldBeImplemented.
]
