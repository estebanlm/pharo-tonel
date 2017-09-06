"
I control the paint modes supported by Cairo backend.

for the list and description of paint modes supported by Cairo library, see
http://cairographics.org/operators/
"
Class {
	#name : #AthensCairoPaintMode,
	#superclass : #AthensPaintMode,
	#traits : 'TCairoLibrary',
	#classTraits : 'TCairoLibrary classTrait',
	#instVars : [
		'canvas'
	],
	#pools : [
		'AthensCairoDefs'
	],
	#category : #Athens-Cairo,
	#timestamp : '<historical>'
}

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>add [
	
	^ self setOperator: CAIRO_OPERATOR_ADD
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>atop [
	
	^ self setOperator: CAIRO_OPERATOR_ATOP
]

{
	#category : #capabilities,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>availableModes [

	^ #(
		clear
		source
		over
		in
		out 
		atop
		dest
		destOver
		destIn
		destOut
		destAtop
		xor
		add
		saturate
		multiply
		screen
		overlay
		darken
		lighten
		colorDodge
		colorBurn
		hardLight
		softLight
		difference
		exclusion
		hslHue
		hslSaturation
		hslColor
		hslLuminosity
	)
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>canvas: aCanvas [
	canvas := aCanvas
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>clear [
	"Set 'clear' drawing mode.
	
	Drawing under this mode will clear the surface under the shape boundaries"
	
	^ self setOperator: CAIRO_OPERATOR_CLEAR
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>colorBurn [
	
	^ self setOperator: CAIRO_OPERATOR_COLOR_BURN
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>colorDodge [
	
	^ self setOperator: CAIRO_OPERATOR_COLOR_DODGE
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>darken [
	
	^ self setOperator: CAIRO_OPERATOR_DARKEN
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>dest [
	"Set 'dest' drawing mode.
	
	Drawing under this mode will ignore the source, as if nothing drawn"
		
	^ self setOperator: CAIRO_OPERATOR_DEST
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>destAtop [
	
	^ self setOperator: CAIRO_OPERATOR_DEST_ATOP
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>destIn [
	
	^ self setOperator: CAIRO_OPERATOR_DEST_IN
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>destOut [
	
	^ self setOperator: CAIRO_OPERATOR_DEST_OUT
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>destOver [
	
	^ self setOperator: CAIRO_OPERATOR_DEST_OVER
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>difference [
	
	^ self setOperator: CAIRO_OPERATOR_DIFFERENCE
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>exclusion [
	
	^ self setOperator: CAIRO_OPERATOR_EXCLUSION
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>getOperator [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^ self nbCall: #(
		cairo_operator_t cairo_get_operator (AthensCairoCanvas canvas) )

]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>hardLight [
	
	^ self setOperator: CAIRO_OPERATOR_HARD_LIGHT
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>hslColor [
	
	^ self setOperator: CAIRO_OPERATOR_HSL_COLOR
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>hslHue [
	
	^ self setOperator: CAIRO_OPERATOR_HSL_HUE
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>hslLuminosity [
	
	^ self setOperator: CAIRO_OPERATOR_HSL_LUMINOSITY
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>hslSaturation [
	
	^ self setOperator: CAIRO_OPERATOR_HSL_SATURATION
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>in [
	
	^ self setOperator: CAIRO_OPERATOR_IN
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>lighten [
	
	^ self setOperator: CAIRO_OPERATOR_LIGHTEN
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>multiply [
	
	^ self setOperator: CAIRO_OPERATOR_MULTIPLY
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>out [
	
	^ self setOperator: CAIRO_OPERATOR_OUT
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>over [
	"Set 'over' drawing mode. This is default paint mode.
	
	Drawing under this mode will blend source with destination color using source alpha component"
			
	^ self setOperator: CAIRO_OPERATOR_OVER
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>overlay [
	
	^ self setOperator: CAIRO_OPERATOR_OVERLAY
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>restoreAfter: aBlock [
	| op |
	op := self getOperator.
	
	aBlock ensure: [ self setOperator: op ]
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>saturate [
	
	^ self setOperator: CAIRO_OPERATOR_SATURATE
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>screen [
	
	^ self setOperator: CAIRO_OPERATOR_SCREEN
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>setOperator: aCairoOperatorT [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^ self nbCall: #(void cairo_set_operator (AthensCairoCanvas canvas, cairo_operator_t aCairoOperatorT) )

]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>softLight [
	
	^ self setOperator: CAIRO_OPERATOR_SOFT_LIGHT
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>source [
	"Set 'source' drawing mode.
	
	Drawing under this mode will replace the content with incoming source under the shape boundaries"
	
	^ self setOperator: CAIRO_OPERATOR_SOURCE
]

{
	#category : #modes,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoPaintMode>>xor [
	
	^ self setOperator: CAIRO_OPERATOR_XOR
]
