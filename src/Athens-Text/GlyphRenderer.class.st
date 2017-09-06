"
Renderer for font glyphs
"
Class {
	#name : #GlyphRenderer,
	#superclass : #Object,
	#instVars : [
		'font'
	],
	#category : #Athens-Text,
	#timestamp : 'TorstenBergmann 2/12/2014 22:21'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
GlyphRenderer class>>forFont: aFont [
	^ self basicNew initForFont: aFont
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
GlyphRenderer>>initForFont: aFont [

	self subclassResponsibility 
]
