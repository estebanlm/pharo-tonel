Extension {
	#name : #Paragraph
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
Paragraph>>displayCaretAndSelectionOnAthensCanvas: anAthensCanvas [
	selectionStart ifNil: [ ^ self ].
	selectionStart = selectionStop
		ifTrue: [ self drawCaretOnAthensCanvas: anAthensCanvas ]
		ifFalse: [ 
			| selection |
			caretRect := nil.
			selection := ParagraphSelectionBlock first: selectionStart last: selectionStop color: self selectionColor.
			self forLinesIn: anAthensCanvas clipRect do: [ :line | selection displayInLine: line onAthensCanvas: anAthensCanvas ] ]
]

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
Paragraph>>displayExtraSelectionOnAthensCanvas: anAthensCanvas [
	| visibleRectangle |
	visibleRectangle := anAthensCanvas clipRect.
	refreshExtraSelection = true
		ifTrue: [ self buildSelectionBlocksFrom: visibleRectangle topLeft to: visibleRectangle bottomRight.
			refreshExtraSelection := false ].
		
	extraSelectionBlocks
		ifNotNil: [ 
			self forLinesIn: visibleRectangle	do: [ :line | 
					extraSelectionBlocks
						do: [ :selblock | self displaySelectionBlock: selblock inLine: line onAthensCanvas: anAthensCanvas ] ] ]
]

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
Paragraph>>displaySelectionBarOnAthensCanvas: anAthensCanvas [
	| visibleRectangle line |
	selectionStart ifNil: [ ^ self ].
	selectionStop ifNil: [ ^ self ].
	visibleRectangle := anAthensCanvas clipRect.
	selectionStart textLine = selectionStop textLine
		ifFalse: [ ^ self ].
	line := selectionStart textLine.
	anAthensCanvas setPaint: self selectionBarColor.
	anAthensCanvas drawShape: (visibleRectangle left @ line top corner: visibleRectangle right @ line bottom)
]

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
Paragraph>>displaySelectionBlock: aSelBlock inLine: line onAthensCanvas: anAthensCanvas [
	(selectionStart notNil and: [ selectionStop notNil and: [ selectionStart ~= selectionStop ] ])
		ifTrue: [ 
			| startIdx stopIdx selSartIdx selStopIdx selBlockRange selRange |
			startIdx := aSelBlock first stringIndex.
			stopIdx := aSelBlock last stringIndex.
			selSartIdx := selectionStart stringIndex.
			selStopIdx := selectionStop stringIndex.
			selBlockRange := startIdx to: stopIdx.
			selRange := selSartIdx to: selStopIdx.
			((selBlockRange rangeIncludes: selSartIdx + 1)
				or: [ 
					(selBlockRange rangeIncludes: selStopIdx - 1)
						or: [ (selRange rangeIncludes: startIdx + 1) or: [ selRange rangeIncludes: stopIdx - 1 ] ] ])
				ifTrue: [ ^ self ] ].	"regular selection and this selection block overlap"
	aSelBlock displayInLine: line onAthensCanvas: anAthensCanvas
]

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
Paragraph>>displayTextOnAthensCanvas: anAthensCanvas in: aRectangle [
	| athensDisplayScanner offset leftInRun |
	anAthensCanvas clipBy: aRectangle during:[
	anAthensCanvas pathTransform
		restoreAfter: [ 
			offset := aRectangle topLeft - positionWhenComposed.
			athensDisplayScanner := AthensDisplayScanner for: self on: anAthensCanvas.
			leftInRun := 0.
			self
				forLinesIn: anAthensCanvas clipRect
				do: [ :line | 
					line first <= line last
						ifTrue: [ leftInRun := athensDisplayScanner displayLine: line offset: offset leftInRun: leftInRun ] ] ] ]
]

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
Paragraph>>drawCaretOnAthensCanvas: anAthensCanvas [
	(self showCaret not or: [ selectionStart isNil ])
		ifTrue: [ ^ self ].
	caretRect := selectionStart topLeft asIntegerPoint extent: 1 @ selectionStart height.
	anAthensCanvas setPaint: self insertionPointColor.
	anAthensCanvas drawShape: self caretRect
]

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
Paragraph>>drawOnAthensCanvas: aCanvas bounds: aRectangle  [
	"do nothing"
]

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
Paragraph>>drawOnAthensCanvas: anAthensCanvas bounds: aRectangle color: aColor [
	self displayCaretAndSelectionOnAthensCanvas: anAthensCanvas.
	self displayExtraSelectionOnAthensCanvas: anAthensCanvas.
	anAthensCanvas setPaint: aColor.
	self displayTextOnAthensCanvas: anAthensCanvas in: aRectangle.

]

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
Paragraph>>forLinesIn: aVisibleRect do: aBlock [
	(self lineIndexForPoint: aVisibleRect topLeft) to: 
	(self lineIndexForPoint: aVisibleRect bottomRight) do: 
		[:i | aBlock value: (lines at: i) ]
]
