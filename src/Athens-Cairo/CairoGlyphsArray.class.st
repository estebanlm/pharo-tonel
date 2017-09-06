"
Captain obvious tells this is an array of CairoGlyph(s),
corresponds to cairo_glyph_t structure:

typedef struct {
    unsigned long        index;
    double               x;
    double               y;
} cairo_glyph_t;
"
Class {
	#name : #CairoGlyphsArray,
	#superclass : #FFIExternalArray,
	#instVars : [
		'allocatedByCairo'
	],
	#category : #Athens-Cairo-Text,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoGlyphsArray class>>externalNew: size  [
	^ self externalNewType: CairoGlyph size: size
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoGlyphsArray class>>new [
	^ self new: nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoGlyphsArray class>>new: size  [
	^ self newType: CairoGlyph size: size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoGlyphsArray>>allocatedByCairo [
	^ allocatedByCairo 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoGlyphsArray>>allocatedByCairo: aBoolean [
	allocatedByCairo := aBoolean
]
