"

"
Class {
	#name : #RubColumnDisplayer,
	#superclass : #RubScrolledTextExtraSurface,
	#instVars : [
		'tabWidth',
		'tabLineDashesColors',
		'tabLineColor',
		'tabLineDashes',
		'tabLineWidth'
	],
	#category : #Rubric-Editing-Widgets,
	#timestamp : ''
}

{
	#category : #querying,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubColumnDisplayer class>>key [
	^ #column
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubColumnDisplayer>>drawOn: aCanvas [
	| cwidth col dsh lw cw dc nb bnds gap |
	super drawOn: aCanvas.
	bnds := self bounds.
	cwidth := self width.
	cw := self tabWidth.
	gap := self offset x \\ cw .
	col := cw + self margins left.
	dsh := self tabLineDashes.
	dc := {(self tabLineColor). (Color transparent)}.
	lw := self tabLineWidth.
	nb := cwidth // cw.
	nb timesRepeat: [ 
			| b |
			b :=  (bnds topLeft + (col @ 0) ) corner: (bnds bottomLeft + ((col + lw) @ 0) ).
			b := b translateBy: (((cw - gap) - cw)@ 0).
			aCanvas
				frameRectangle: b
				width: 1
				colors: dc
				dashes: dsh.
			col := col + cw ]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubColumnDisplayer>>drawOnAthensCanvas: anAthensCanvas [
	| cwidth col dsh lw cw dc nb bnds gap |
	super drawOnAthensCanvas: anAthensCanvas.
	bnds := self bounds.
	cwidth := self width.
	cw := self tabWidth.
	gap := self offset x \\ cw.
	col := cw + self margins left.
	dsh := self tabLineDashes.
	dc := {(self tabLineColor). (Color transparent)}.
	lw := self tabLineWidth.
	nb := cwidth // cw.
	(anAthensCanvas setStrokePaint: self tabLineColor)
		dashes: self tabLineDashes offset: 0;
		width: 1.
	nb
		timesRepeat: [ 
			| b |
			b := bnds topLeft + (col @ 0) corner: bnds bottomLeft + ((col + lw) @ 0).
			b := b translateBy: (cw - gap - cw) @ 0.
			anAthensCanvas setShape: b.
			anAthensCanvas draw.
			col := col + cw ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubColumnDisplayer>>font [
	| textStyle |
	textStyle := self textStyle.
	^ textStyle fontAt: textStyle defaultFontIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubColumnDisplayer>>tabLineColor [
	^ tabLineColor ifNil: [ tabLineColor := Color lightGray twiceLighter] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubColumnDisplayer>>tabLineColor: aColor [
	tabLineColor := aColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubColumnDisplayer>>tabLineDashes [
	^ tabLineDashes ifNil: [tabLineDashes := {self tabLineWidth. self tabLineWidth*3}].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubColumnDisplayer>>tabLineDashes: anArray [
	 tabLineDashes := anArray

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubColumnDisplayer>>tabLineDashesColors  [
	^ tabLineDashesColors ifNil: [tabLineDashesColors := {(self tabLineColor). (Color transparent)}].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubColumnDisplayer>>tabLineWidth [
	^ tabLineWidth ifNil: [ tabLineWidth := 1 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubColumnDisplayer>>tabLineWidth: anInteger [
	tabLineWidth := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubColumnDisplayer>>tabWidth [
	^ self paragraph tabWidth
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubColumnDisplayer>>tabWidth: anInteger [
	self paragraph tabWidth: anInteger
]
