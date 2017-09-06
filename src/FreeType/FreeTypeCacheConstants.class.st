"
Constants for the FreeType cache
"
Class {
	#name : #FreeTypeCacheConstants,
	#superclass : #SharedPool,
	#classVars : [
		'FreeTypeCacheGlyph',
		'FreeTypeCacheGlyphLCD',
		'FreeTypeCacheGlyphMono',
		'FreeTypeCacheLinearWidth',
		'FreeTypeCacheWidth'
	],
	#category : #FreeType-Cache,
	#timestamp : 'TorstenBergmann 2/4/2014 22:09'
}

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeCacheConstants class>>initialize [
	"
	FreeTypeCacheConstants initialize
	"
	
	FreeTypeCacheWidth := 0.
	FreeTypeCacheGlyph := 100.	"start at 100 and allow room for 64 subpixel positioned glyphs"
	FreeTypeCacheGlyphLCD := 200. "start at 200 and allow room for 64 subpixel positioned glyphs"
	FreeTypeCacheGlyphMono := 3.
	FreeTypeCacheLinearWidth := 4
	
]
