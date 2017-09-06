"
Creates a new font description from a string representation in the form 
""[FAMILY-LIST] [STYLE-OPTIONS] [SIZE]"", 

1)FAMILY-LIST is a comma separated list of families optionally terminated by a comma,

2)STYLE_OPTIONS is a whitespace separated list of words where each WORD describes one of style, variant, weight, stretch, or gravity. If STYLE-OPTIONS is missing, then all style options will be set to the default values

3)SIZE is a decimal number (size in points) or optionally followed by the unit modifier ""px"" for absolute size. 


"
Class {
	#name : #AthensFontDescription,
	#superclass : #Object,
	#instVars : [
		'family',
		'options',
		'size'
	],
	#category : #Athens-Cairo-Text,
	#timestamp : 'FernandoOlivero 1/24/2012 18:30'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription class>>example [
	| fDesc |
	fDesc := AthensFontDescription new. 
	fDesc
		family: 'monospace';
		fontSize: 22.
	^ fDesc
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>asString [
	"[FAMILY-LIST] [STYLE-OPTIONS] [SIZE]"
	| str |
	str := '' writeStream.
	str nextPutAll:  family; space.
	"	
2)STYLE_OPTIONS is a whitespace separated list of words where each WORD describes one of style, variant, weight, stretch, or gravity. If STYLE-OPTIONS is missing, then all style options will be set to the default values
"
	#(slant. variant. weight. stretch. gravity) do:[:each|
		|val|
		val := options at: each ifAbsent: nil.
		val notNil ifTrue:[str nextPutAll: val ; space ]].
	
	self fontSize notNil ifTrue:[
		str
			space;
			nextPutAll: self fontSize asString ].
	^ str contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>beBold [
	self weight: #bold
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>beItalic [
	self slant: #italic
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>beNormal [
	self slant: #normal ; weight: #normal.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>beOblique [
	self slant: #oblique
]

{
	#category : #cairo-options,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>family: aFamilyName [
	"CSS2 generic family names: serif, sans-serif, cursive, fantasy, monospace"
	family := aFamilyName.
	
]

{
	#category : #cairo-options,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>fontFamily [
	^ family
]

{
	#category : #pango-options,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>fontGravity [
	^ options at: #gravity
]

{
	#category : #cairo-options,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>fontSize [
	^ size 
]

{
	#category : #cairo-options,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>fontSize: aPointSize [
	size := aPointSize
]

{
	#category : #cairo-options,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>fontSlant [
	^ options at: #slant 
]

{
	#category : #pango-options,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>fontStretch [
	^ options at: #stretch
]

{
	#category : #pango-options,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>fontVariant [
	^ options at: #variant 
]

{
	#category : #cairo-options,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>fontWeight [
	^ options at: #weight 
]

{
	#category : #pango-options,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>gravity: aNumber [
	options at: #gravity put: aNumber.		

]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>initialize [
	super initialize.
	family := 'monospace'.
	options := Dictionary new.
	options
		at:#weight put: #normal; 
		at:#slant put: #normal.
	size := 14.
	
]

{
	#category : #cairo-options,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>slant: aNumber [
	options at: #slant put: aNumber.		

]

{
	#category : #pango-options,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>stretch: aNumber [
	options at: #stretch put: aNumber.		

]

{
	#category : #pango-options,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>variant: aNumber [
	options at: #variant put: aNumber.		

]

{
	#category : #cairo-options,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensFontDescription>>weight: aNumber [
	options at: #weight put: aNumber.		

]
