"
i am used to convert CompositeBorderStyle into paint, used in Morphic.
The ""withInset"" attribute defines whether each sub stroke  outlines
a smaller rectangle. If not, all strokes draw the same rectangle.
(useful for multi-color-dashes)
"
Class {
	#name : #AthensCompositeStrokePaint,
	#superclass : #AthensPaint,
	#instVars : [
		'strokePaints',
		'withInset'
	],
	#category : #Athens-Morphic,
	#timestamp : '<historical>'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensCompositeStrokePaint>>asStrokePaintOn: aCanvas [
	"receiver is stroke paint already"
	^ self
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensCompositeStrokePaint>>athensFillRectangle: aRect on: anAthensCanvas [
	"This is a terminal method in rendering dispatch scheme
	canvas->shape->paint. See AthensCanvas>>fillShape: "

	| r |
	r := aRect.
	strokePaints
		do: [ :paint | 
			paint athensFillRectangle: r on: anAthensCanvas.
			withInset ifTrue:[r := r insetBy: paint width ]]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensCompositeStrokePaint>>fromBorderStyles: borders on: anAthensCanvas [
	strokePaints := borders collect: [:each | (each asAthensPaintOn: anAthensCanvas ) asStrokePaintOn: anAthensCanvas]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensCompositeStrokePaint>>fromDashedBorderStyle: border on: anAthensCanvas [
	| allDashLength offset width |
	width := border width.
	allDashLength := border dashLengths detectSum: #yourself.
	offset := 0.
	strokePaints := border dashColors
		collectWithIndex: [ :c :i | 
			| stroke dashLength |
			dashLength := border dashLengths at: i.
			stroke := c asStrokePaintOn: anAthensCanvas.
			stroke width: width.
			stroke capButt.
			stroke
				dashes:
					{(dashLength * width).
					((allDashLength - dashLength) * width)}
				offset: (allDashLength - offset) * width.
			offset := offset + dashLength.
			stroke ].
	self withInset: false
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensCompositeStrokePaint>>initialize [

	super initialize.

	strokePaints := nil.
	withInset := true.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensCompositeStrokePaint>>withInset: aBoolean [
	withInset := aBoolean
]
