"
do not use this class. this is subject of change or removal
"
Class {
	#name : #AthensCairoText,
	#superclass : #Object,
	#traits : 'TCairoLibrary',
	#classTraits : 'TCairoLibrary classTrait',
	#instVars : [
		'text',
		'fontFamily',
		'fontSlant',
		'fontWeight',
		'fontSize'
	],
	#pools : [
		'AthensCairoDefs'
	],
	#category : #Athens-Cairo-Text,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>asString [
	^ text asString
]

{
	#category : #'font description',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>beBold [
	self fontWeight: CAIRO_FONT_WEIGHT_BOLD
]

{
	#category : #'font description',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>beNormal [
	self fontWeight: CAIRO_FONT_WEIGHT_NORMAL
]

{
	#category : #'font description',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>beSlantNormal [
	self fontSlant: CAIRO_FONT_SLANT_NORMAL
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>convertTextUtf8: aString [
	| encoder buffer |
	buffer := ByteArray new: (aString size + 2) * 4.
	encoder := ZnUTF8Encoder new.
	encoder
		next: aString size
		putAll: aString
		startingAt: 1
		toStream: buffer writeStream.
	^ buffer
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>drawOn: aCanvas [
	self loadOn: aCanvas.
	self showOn: aCanvas
]

{
	#category : #'font description',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>fontFamily [

	^ fontFamily
]

{
	#category : #'font description',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>fontFamily: anObject [
	"CSS2 generic family names: serif, sans-serif, cursive, fantasy, monospace"
	fontFamily := anObject
]

{
	#category : #'font description',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>fontSize [

	^ fontSize
]

{
	#category : #'font description',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>fontSize: anObject [

	fontSize := anObject
]

{
	#category : #'font description',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>fontSlant [

	^ fontSlant
]

{
	#category : #'font description',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>fontSlant: anObject [
	anObject isSymbol
		ifTrue:[ fontSlant := self slantFrom: anObject ]
		ifFalse:[ fontSlant := anObject ]
]

{
	#category : #'font description',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>fontWeight [

	^ fontWeight
]

{
	#category : #'font description',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>fontWeight: anObject [
	anObject isSymbol
		ifTrue:[ fontWeight := self weightFrom: anObject ]
		ifFalse:[ fontWeight :=  anObject ] 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>initialize [
	super initialize.
	
	self beNormal; beSlantNormal.
	 fontSize := 10.
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>loadOn: aCanvas [
	fontFamily notNil ifTrue:[
		self
			primSelectFont:  fontFamily
				slant:  fontSlant
				weight:  fontWeight 
				on: aCanvas] .
	fontSize notNil ifTrue:[		
		self primSetFontSize:  (TextStyle pointsToPixels: fontSize) on: aCanvas ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>primSelectFont: aFontFamily
		slant: aFontSlant
		weight: aFontWeight  [
		on: aCanvas
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	self nbCall: #(void cairo_select_font_face (
			cairo_t aCanvas,
   			char * aFontFamily,
      		cairo_font_slant_t aFontSlant,
        	cairo_font_weight_t aFontWeight) )
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>primSetFontSize: aFontSize on: aCanvas [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	self nbCall: #(void cairo_set_font_size (
			cairo_t aCanvas,
			double aFontSize) )

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>primShowText: aString on: aCanvas [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin>
	self nbCall: #(void cairo_show_text (
			cairo_t aCanvas,
			char * aString) )

]

{
	#category : #'font description',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>readFrom: aFontDescription [
	self fontFamily: aFontDescription fontFamily.
	self fontSlant: aFontDescription fontSlant.
	self fontWeight:  aFontDescription fontWeight.
	self fontSize: aFontDescription fontSize.
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>showOn: aCanvas [
	| utf8String |
	aCanvas setPathMatrix.
	utf8String := self convertTextUtf8: self asString.
	self primShowText: utf8String on: aCanvas
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>slantFrom: aSymbol [
	^ aSymbol caseOf: {
		[#normal]->[ CAIRO_FONT_SLANT_NORMAL ].
 		[#italic]->[   CAIRO_FONT_SLANT_ITALIC ].
		[#oblique]->[ CAIRO_FONT_SLANT_OBLIQUE ] }
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>text [

	^ text
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>text: anObject [

	text := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensCairoText>>weightFrom: aSymbol [
	^ aSymbol caseOf: {
		[#normal]->[ CAIRO_FONT_WEIGHT_NORMAL  ].
 		[#bold]->[    CAIRO_FONT_WEIGHT_BOLD ] }

]
