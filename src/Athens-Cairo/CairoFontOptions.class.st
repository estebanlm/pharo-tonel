"
i represent various font options exposed by cairo library
"
Class {
	#name : #CairoFontOptions,
	#superclass : #FFIExternalObject,
	#traits : 'TCairoLibrary',
	#classTraits : 'TCairoLibrary classTrait',
	#pools : [
		'AthensCairoDefs'
	],
	#category : #Athens-Cairo-Text,
	#timestamp : '<historical>'
}

{
	#category : #finalizing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions class>>finalizeResourceData: aData [
	"finalize the external resource data, returned by #resourceData on instance side"
	
	self primDestroy: aData
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions class>>new [
	^ self primCreate initialize
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions class>>primCreate [
"cairo_font_options_t * cairo_font_options_create        (void);

Allocates a new font options object with all options initialized to default values.

Returns :
	a newly allocated cairo_font_options_t. Free with cairo_font_options_destroy(). This function always returns a valid pointer; if memory cannot be allocated, then a special error object is returned where all operations on the object do nothing. You can check for this with cairo_font_options_status().

"	
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^ self nbCall: #(CairoFontOptions cairo_font_options_create ())
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions class>>primDestroy: anOptions [
"void                cairo_font_options_destroy          (cairo_font_options_t *options);

Destroys a cairo_font_options_t object created with cairo_font_options_create() or cairo_font_options_copy().

options :
	a cairo_font_options_t"

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^ self nbCall: #(void cairo_font_options_destroy (size_t anOptions))
]

{
	#category : #antialiasing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>aaBest [

	^ self setAA: CAIRO_ANTIALIAS_BEST.
]

{
	#category : #antialiasing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>aaDefault [

	^ self setAA: CAIRO_ANTIALIAS_DEFAULT.
]

{
	#category : #antialiasing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>aaFast [

	^ self setAA: CAIRO_ANTIALIAS_FAST.
]

{
	#category : #antialiasing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>aaGood [

	^ self setAA: CAIRO_ANTIALIAS_GOOD.
]

{
	#category : #antialiasing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>aaGray [

	^ self setAA: CAIRO_ANTIALIAS_GRAY.
]

{
	#category : #antialiasing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>aaNone [

	^ self setAA: CAIRO_ANTIALIAS_NONE.
]

{
	#category : #antialiasing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>aaSubpixel [

	^ self setAA: CAIRO_ANTIALIAS_SUBPIXEL.
]

{
	#category : #'hint options',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>hintMetricsDefault [
	^ self setHintMetrics: CAIRO_HINT_METRICS_DEFAULT
]

{
	#category : #'hint options',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>hintMetricsOff [
	^ self setHintMetrics: CAIRO_HINT_METRICS_OFF
]

{
	#category : #'hint options',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>hintMetricsOn [
	^ self setHintMetrics: CAIRO_HINT_METRICS_ON
]

{
	#category : #'hint options',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>hintStyleDefault [
	^ self setHintStyle: CAIRO_HINT_STYLE_DEFAULT
]

{
	#category : #'hint options',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>hintStyleFull [
	^ self setHintStyle: CAIRO_HINT_STYLE_FULL
]

{
	#category : #'hint options',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>hintStyleMedium [
	^ self setHintStyle: CAIRO_HINT_STYLE_MEDIUM
]

{
	#category : #'hint options',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>hintStyleNone [
	^ self setHintStyle: CAIRO_HINT_STYLE_NONE
]

{
	#category : #'hint options',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>hintStyleSlight [
	^ self setHintStyle: CAIRO_HINT_STYLE_SLIGHT
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>initialize  [
	self autoRelease.
	self setDefaults
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>resourceData [

	^ handle value
]

{
	#category : #antialiasing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>setAA: antialias [

"cairo_font_options_set_antialias ()

void                cairo_font_options_set_antialias    (cairo_font_options_t *options,
                                                         cairo_antialias_t antialias);

Sets the antialiasing mode for the font options object. This specifies the type of antialiasing to do when rendering text.

options :
	a cairo_font_options_t

antialias :
	the new antialiasing mode"
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^ self nbCall: #( 
	void cairo_font_options_set_antialias (self, uint antialias))

]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>setDefaults [

	self hintStyleSlight; hintMetricsOff; subpixelOrderRGB; aaSubpixel
]

{
	#category : #'hint options',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>setHintMetrics: hintMetrics [
"
	void	cairo_font_options_set_hint_metrics (cairo_font_options_t *options,
		cairo_hint_metrics_t hint_metrics);

 Sets the metrics hinting mode for the font options object. This controls whether metrics are quantized to integer values in device units. See the documentation for cairo_hint_metrics_t for full details.

"
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^ self nbCall: #(void cairo_font_options_set_hint_metrics (self,  uint hintMetrics))

 
]

{
	#category : #'hint options',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>setHintStyle: aStyle [
	"cairo_font_options_set_hint_style ()

void                cairo_font_options_set_hint_style   (cairo_font_options_t *options,
                                                         cairo_hint_style_t hint_style);

Sets the hint style for font outlines for the font options object. This controls whether to fit font outlines to the pixel grid, and if so, whether to optimize for fidelity or contrast. See the documentation for cairo_hint_style_t for full details. "
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^ self nbCall: #( 
		void cairo_font_options_set_hint_style (self, uint aStyle))

 
]

{
	#category : #'subpixel order',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>setSubpixelOrder: order [
	"void cairo_font_options_set_subpixel_order
		(cairo_font_options_t *options,
		cairo_subpixel_order_t subpixel_order)"
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^ self nbCall: #(
		void cairo_font_options_set_subpixel_order (self, uint order))
 
]

{
	#category : #'subpixel order',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>subpixelOrderBGR [
	^ self setSubpixelOrder: CAIRO_SUBPIXEL_ORDER_BGR
]

{
	#category : #'subpixel order',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>subpixelOrderDefault [
	^ self setSubpixelOrder: CAIRO_SUBPIXEL_ORDER_DEFAULT
]

{
	#category : #'subpixel order',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>subpixelOrderRGB [
	^ self setSubpixelOrder: CAIRO_SUBPIXEL_ORDER_RGB
]

{
	#category : #'subpixel order',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>subpixelOrderVBGR [
	^ self setSubpixelOrder: CAIRO_SUBPIXEL_ORDER_VBGR
]

{
	#category : #'subpixel order',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontOptions>>subpixelOrderVRGB [
	^ self setSubpixelOrder: CAIRO_SUBPIXEL_ORDER_VRGB
]
