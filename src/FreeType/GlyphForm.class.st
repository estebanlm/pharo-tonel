"
A specialized form for glyphs
"
Class {
	#name : #GlyphForm,
	#superclass : #Form,
	#instVars : [
		'advance',
		'linearAdvance'
	],
	#category : #FreeType-Fonts,
	#timestamp : 'TorstenBergmann 2/4/2014 22:11'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
GlyphForm>>advance [
	^advance
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
GlyphForm>>advance: aNumber [
	^advance := aNumber
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:12'
}
GlyphForm>>asFormOfDepth: d [
	| newForm |
	d = self depth ifTrue:[^self].
	newForm := self class extent: self extent depth: d.
	(BitBlt toForm: newForm)
		colorMap: (self colormapIfNeededFor: newForm);
		copy: (self boundingBox)
		from: 0@0 in: self
		fillColor: nil rule: Form over.
	newForm 
		offset: offset;
		advance:advance;
		linearAdvance: linearAdvance.
	^newForm
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
GlyphForm>>linearAdvance [
	^linearAdvance

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
GlyphForm>>linearAdvance: aNumber [
	^linearAdvance := aNumber
]
