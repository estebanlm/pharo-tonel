"
i represent stroke paint in cairo backend
"
Class {
	#name : #AthensCairoStrokePaint,
	#superclass : #AthensStrokePaint,
	#traits : 'TCairoLibrary',
	#classTraits : 'TCairoLibrary classTrait',
	#instVars : [
		'capStyle',
		'joinStyle',
		'dashLenghts',
		'dashOffset'
	],
	#pools : [
		'AthensCairoDefs'
	],
	#category : #Athens-Cairo-Paints,
	#timestamp : '<historical>'
}

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoStrokePaint>>athensFillPath: aPath on: aCanvas [
	
	self prepareForDrawingOn: aCanvas.
	
	aCanvas 
		newPath; 
		loadPath: aPath;
		stroke
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoStrokePaint>>athensFillRectangle: aRect on: aCanvas [

	self prepareForDrawingOn: aCanvas.
	
	aCanvas 
		newPath;
		rectangleX: aRect left
		y: aRect top 
		width: aRect width
		height: aRect height;
		stroke.

]

{
	#category : #'setting cap styles',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoStrokePaint>>capButt [
	capStyle := CAIRO_LINE_CAP_BUTT.
]

{
	#category : #'setting cap styles',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoStrokePaint>>capRound [
	capStyle := CAIRO_LINE_CAP_ROUND
]

{
	#category : #'setting cap styles',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoStrokePaint>>capSquare [
	capStyle := CAIRO_LINE_CAP_SQUARE
]

{
	#category : #'setting dashes',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoStrokePaint>>dashes: anAlternateCollectionOfLenghts offset: anOffset [
	dashLenghts := anAlternateCollectionOfLenghts.
	dashOffset := anOffset asFloat.
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoStrokePaint>>initialize [
	super initialize.

	self setDefaults
]

{
	#category : #'setting join styles',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoStrokePaint>>joinBevel [
	joinStyle := CAIRO_LINE_JOIN_BEVEL
]

{
	#category : #'setting join styles',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoStrokePaint>>joinMiter [
	joinStyle := CAIRO_LINE_JOIN_MITER
]

{
	#category : #'setting join styles',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoStrokePaint>>joinRound [
	joinStyle := CAIRO_LINE_JOIN_ROUND 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoStrokePaint>>prepareForDrawingOn: aCanvas [
	
	fillPaint 
		loadOnCairoCanvas: aCanvas.
	
	aCanvas
		primSetLineWidth: width;
		primSetLineJoin: joinStyle;
		primSetLineCap: capStyle.
	
	dashLenghts 
		ifNil: [ aCanvas resetDash ] 
		ifNotNil: [ self setDashesOn: aCanvas ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoStrokePaint>>primSetDashesOn: aCanvas lengths: dashesLengths count: dashesCount offset: anOffset [
"	void                cairo_set_dash                      (cairo_t *cr,
                                                         double *dashes,
                                                         int num_dashes,
                                                         double offset);"
<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	self nbCall: #(void cairo_set_dash (
				AthensCairoCanvas aCanvas,
				double* dashesLengths,
				int dashesCount,
				double anOffset) )

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoStrokePaint>>primSetLineCapOn: aCanvas [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	^ self nbCall: #(void cairo_set_line_cap (
			AthensCairoCanvas aCanvas,
			cairo_line_cap_t capStyle) )
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoStrokePaint>>primSetLineJoinOn: aCanvas [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	self nbCall: #(void cairo_set_line_join (
			AthensCairoCanvas aCanvas,
			cairo_line_join_t joinStyle) )
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoStrokePaint>>primSetLineWidthOn: aCanvas [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	
	self nbCall: #(void cairo_set_line_width (
				AthensCairoCanvas aCanvas,
				double width) )

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoStrokePaint>>setDashesOn: aCanvas  [
	| buf |
	
	buf := ByteArray new: 8*dashLenghts size.
	
	dashLenghts withIndexDo: [:len :i |
		
		buf nbFloat64AtOffset: (i-1)*8 put: len asFloat
		].

	aCanvas
		primSetDashesLengths: buf
		count: dashLenghts size
		offset: dashOffset
		
]
