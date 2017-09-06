"
The tiger shape (see VGTigerDemo runDemo)
"
Class {
	#name : #AthensTigerShape,
	#superclass : #Object,
	#instVars : [
		'paint',
		'path',
		'fillRule',
		'fill',
		'capStyle',
		'joinStyle',
		'miterLimit',
		'strokeWidth',
		'strokePaint',
		'fillPaint',
		'stroke'
	],
	#category : #Athens-Examples,
	#timestamp : 'TorstenBergmann 2/12/2014 22:16'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTigerShape>>addFill [
	fill := true.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTigerShape>>addStroke [
	stroke := true.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTigerShape>>capStyle: cap [
	capStyle := cap.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTigerShape>>fillPaint: aColor  [
	fillPaint := aColor
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTigerShape>>fillRule [
	^ fillRule
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTigerShape>>fillRule: rule  [
	fillRule := rule.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTigerShape>>initialize  [
	fill := stroke := false.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTigerShape>>joinStyle: join [
	joinStyle := join.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTigerShape>>miterLimit: lim [
	miterLimit := lim.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTigerShape>>prepareFor: surface [
	fill ifTrue: [
		fillPaint := surface createSolidColorPaint: fillPaint.
	].

	stroke ifTrue: [
		strokePaint := 
			surface createStrokePaintFor: (surface createSolidColorPaint: strokePaint).
	].

	
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTigerShape>>renderOn: can [

	fill ifTrue: [ 
		can setPaint: fillPaint.
		can drawShape: path.	
	].

	stroke ifTrue: [
		can setStrokePaint: strokePaint.	
		can drawShape: path.	
	]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTigerShape>>setPath: anAthensCairoPath [
		path := anAthensCairoPath
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTigerShape>>strokePaint: aColor  [
	strokePaint := aColor
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
AthensTigerShape>>strokeWidth: w [
	strokeWidth := w
]
