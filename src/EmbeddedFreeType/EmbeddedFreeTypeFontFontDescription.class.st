"
Common superclass handling fonts that are not found on the disc but embedded in the image.

Subclasses should redefine fontContents and originalFileName class methods. 



To do in the future:
	- a proper way to load font file and install them to avoid bloating the image with text that represent binary font data in addition to font themselves!!
"
Class {
	#name : #EmbeddedFreeTypeFontFontDescription,
	#superclass : #Object,
	#category : #EmbeddedFreeType,
	#timestamp : 'IgorStasenko 4/8/2014 17:19'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:11'
}
EmbeddedFreeTypeFontFontDescription class>>canBeInstalled [
	"By default, font can be installed anywhere"
	^ true
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
EmbeddedFreeTypeFontFontDescription class>>fontContents [
	self subclassResponsibility

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
EmbeddedFreeTypeFontFontDescription class>>installAllFontsIn: provider [
	self allSubclasses do: [ :each | each installFontsIn: provider ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
EmbeddedFreeTypeFontFontDescription class>>installFontsIn: provider [
	self canBeInstalled ifFalse: [ ^ self ].
	provider
		addFromFileContents: self fontContents 
		baseName: self originalFileName 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
EmbeddedFreeTypeFontFontDescription class>>originalFileName [
	self subclassResponsibility

]
