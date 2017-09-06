"
RubAdornmentDisplayer adds a simple adornment for text area
"
Class {
	#name : #RubAdornmentDisplayer,
	#superclass : #RubScrolledTextExtraSurface,
	#category : #Rubric-Editing-Widgets,
	#timestamp : 'FranckWarlouzet 7/29/2015 15:52'
}

{
	#category : #querying,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAdornmentDisplayer class>>key [
	^ #adornment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAdornmentDisplayer>>computedHeightFrom: aRectangle [

	^ aRectangle height min: self computedSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAdornmentDisplayer>>computedPositionFrom: aRectangle [
	^  ((aRectangle right min: self scrollBounds right) - (self computedWidthFrom: aRectangle)) @ aRectangle top

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAdornmentDisplayer>>computedSize [
	^  25
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAdornmentDisplayer>>computedWidthFrom: aRectangle [
	^  (super computedWidthFrom: aRectangle) min: self computedSize

]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAdornmentDisplayer>>drawOn: aCanvas [
	| bnds adorncolor size fillStyle |
	super drawOn: aCanvas.
	self paragraphProvider isReadOnly ifTrue: [ ^self ].
	self paragraphProvider hasUnacceptedEdits ifFalse: [ ^self ].
	bnds := self bounds.
	adorncolor := self paragraphProvider adornmentColor.
	size := self width.
	fillStyle := (GradientFillStyle ramp: {
			0.0->(Color white alpha: 0.3).
			0.8->adorncolor.
			1.0->adorncolor})
		origin: bnds topRight - (size@0);
		direction: (size @ size negated) // 4;
		radial: false.
	aCanvas
		drawPolygon:  {bnds topRight. bnds topRight + (0@size). bnds topRight - (size@0)}
		fillStyle: fillStyle
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAdornmentDisplayer>>drawOnAthensCanvas: anAthensCanvas [
	| bnds adorncolor size fillStyle vertices polygonPath |
	super drawOnAthensCanvas: anAthensCanvas.
	self paragraphProvider hasUnacceptedEdits
		ifFalse: [ ^ self ].
	bnds := self bounds.
	adorncolor := self paragraphProvider adornmentColor.
	size := self width.
	fillStyle := (GradientFillStyle
		ramp:
			{(0.0 -> (Color white alpha: 0.3)).
			(0.8 -> adorncolor).
			(1.0 -> adorncolor)})
		origin: bnds topRight - (size @ 0);
		direction: size @ size negated // 4;
		radial: false.
	vertices := {(bnds topRight).
	(bnds topRight + (0 @ size)).
	(bnds topRight - (size @ 0))}.
	polygonPath := anAthensCanvas
		createPath: [ :builder | 
			builder
				absolute;
				moveTo: vertices first.
			vertices allButFirstDo: [ :pt | builder lineTo: pt ].
			builder close ].
	anAthensCanvas setPaint: fillStyle.
	anAthensCanvas setShape: polygonPath.
	anAthensCanvas draw
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubAdornmentDisplayer>>level [
	^ SmallInteger maxVal 
]
