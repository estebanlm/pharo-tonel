"
Simple glyph infos
"
Class {
	#name : #SimpleTextGlyphInfo,
	#superclass : #FT2GlyphSlot,
	#category : #Athens-Text,
	#timestamp : 'TorstenBergmann 2/12/2014 22:21'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 05:26:39'
}
SimpleTextGlyphInfo class>>fromFace: anFT2Face [
	^(self new)
		loadFrom: anFT2Face;
		yourself.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SimpleTextGlyphInfo>>face [
	^ face
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:39'
}
SimpleTextGlyphInfo>>loadFrom: anFT2Face [
	"Same as in superclass, but avoid converting coordinates to not waste CPU cycles"
	
	face := anFT2Face.
	self primLoadFrom: anFT2Face.
	format := ((Smalltalk isLittleEndian) ifTrue: [ format reversed ] ifFalse: [ format ]) asString.

]
