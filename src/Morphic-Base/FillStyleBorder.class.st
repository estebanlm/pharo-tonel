"
BorderStyle supporting general (potentially composite) fillstyles. 
"
Class {
	#name : #FillStyleBorder,
	#superclass : #SimpleBorder,
	#instVars : [
		'fillStyle'
	],
	#category : #Morphic-Base-Borders,
	#timestamp : 'gvc 9/23/2008 11:56'
}

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:13'
}
FillStyleBorder>>borderRectsFor: aRectangle [
	"Answer a collection of rectangles to fill.
	Just four here for a rectangular border."

	|rTop rBottom rLeft rRight w|
	w := self width.
	rTop := aRectangle topLeft corner: aRectangle right @ (aRectangle top + w).
	rBottom := aRectangle left @ (aRectangle bottom - w) corner: aRectangle bottomRight.
	rLeft := aRectangle left @ (aRectangle top + w) corner: aRectangle left + w @ (aRectangle bottom - w).
	rRight := aRectangle right - w @ (aRectangle top + w) corner: aRectangle right @ (aRectangle bottom - w).
	^{rTop. rBottom. rLeft. rRight}
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FillStyleBorder>>fillStyle [
	"Answer the value of fillStyle"

	^fillStyle ifNil: [self color]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FillStyleBorder>>fillStyle: anObject [
	"Set the value of fillStyle"

	fillStyle := anObject.
	anObject ifNotNil: [self baseColor: anObject asColor]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FillStyleBorder>>frameRectangle: aRectangle on: aCanvas [
	"Fill the border areas with the fill style, clipping for each segment."
	
	(self borderRectsFor: aRectangle) do: [:r |
		aCanvas
			fillRectangle: r
			fillStyle: self fillStyle]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:13'
}
FillStyleBorder>>hasFillStyle [
	"Answer true."

	^true
]
