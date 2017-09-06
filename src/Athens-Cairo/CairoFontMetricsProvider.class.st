"
Provide font metrics (Cairo)
"
Class {
	#name : #CairoFontMetricsProvider,
	#superclass : #Object,
	#traits : 'TCairoLibrary',
	#classTraits : 'TCairoLibrary classTrait',
	#instVars : [
		'font',
		'utfConverter',
		'cairoFont',
		'extents',
		'glyphExtents',
		'cache'
	],
	#pools : [
		'AthensCairoDefs'
	],
	#category : #Athens-Cairo-Text,
	#timestamp : 'TorstenBergmann 2/12/2014 22:22'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontMetricsProvider>>applyKerningOn: aGlyphs of: aString from: start to: end [
	|kerning  previous|
	kerning := 0.
	previous := nil.
	aGlyphs doWithIndex: [ :glyph :index | |current|
		current := aString at: start + (index - 1).
		index > 1 ifTrue: [
			kerning := kerning + (font kerningLeft: previous right: current).
			glyph x: glyph x + kerning ].
		previous := current ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontMetricsProvider>>cairoFont [
	^ cairoFont
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontMetricsProvider>>convertString: utf8String len: strlen ofFont: aScaledFont toGlyphs: glyphs numGlyphs: numGlyphs x: x y: y [
"
all of this for using 
http://www.cairographics.org/manual/cairo-User-Fonts.html#cairo-user-scaled-font-text-to-glyphs-func-t

"
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^self nbCall: #(
		cairo_status_t cairo_scaled_font_text_to_glyphs (CairoScaledFont aScaledFont,
			double x,
			double y,
			void * utf8String,
			int strlen,
			void ** glyphs,
			int * numGlyphs,
			0,
			0,
			0))
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontMetricsProvider>>extentsOf: aString [
	|glyphs|
	glyphs := self glyphsOf: aString.
   cairoFont getExtentsOfGlyphs: glyphs getHandle ofLength: glyphs size into: glyphExtents.
	^ glyphExtents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontMetricsProvider>>font: aFont [
	font := aFont asFreetypeFont.
	cairoFont :=	CairoScaledFont fromFreetypeFont: font.
	extents := cairoFont extents.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontMetricsProvider>>fontAscent [
	^ extents ascent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontMetricsProvider>>fontHeight [
	^ extents height 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontMetricsProvider>>freeGlyphs: glyphs [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	
	^self nbCall: #( void cairo_glyph_free (void *glyphs))
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontMetricsProvider>>getGlyphWidth: aCharacter [
	cairoFont getExtentsOf: (utfConverter convertChar: aCharacter) into: glyphExtents.
	^ glyphExtents x_advance
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontMetricsProvider>>glyphsOf: aString [
	^ self glyphsOf: aString from: 1 to: aString size
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontMetricsProvider>>glyphsOf: aString from: start to: end [
	| len ptr glyphs lenValue glyphsSize utf8Len error |

	len := end-start+1.
	utf8Len := utfConverter convert: aString from: start to: end.

	ptr := ExternalAddress new.
	lenValue := ByteArray new: 4.
	lenValue nbUInt32AtOffset: 0 put: len.
		
	error := self 
		convertString: utfConverter buffer 
		len: utf8Len
		ofFont: cairoFont 
		toGlyphs: ptr
		numGlyphs: lenValue 
		x: 0.0 
		y: 0.0.
		
	error = CAIRO_STATUS_SUCCESS ifFalse: [  ^ CairoGlyphsArray new: 0 ].

	glyphsSize := lenValue nbUInt32AtOffset: 0.
   cairoFont getExtentsOfGlyphs: ptr ofLength: glyphsSize into: glyphExtents.
	
	glyphs := CairoGlyphsArray new: glyphsSize.
	LibC memCopy: ptr to: glyphs getHandle size: (glyphsSize * glyphs typeSize).
	"Apply kerning on glyphs if font supports it"
	font face hasKerning
		ifTrue: [ self applyKerningOn: glyphs of: aString from: start to: end ].
	self freeGlyphs: ptr.
		
	^ glyphs 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoFontMetricsProvider>>initialize [
	utfConverter := CairoUTF8Converter new.
	glyphExtents := CairoTextExtents new.
	cache := CairoBackendCache soleInstance.
]
