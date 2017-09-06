"
I am used to render font with cairo ""toy"" text api if no freetype
font is used.


AthensCairoSurfaceExamples exampleDrawText
"
Class {
	#name : #AthensStrikeFontRenderer,
	#superclass : #Object,
	#instVars : [
		'font',
		'canvas'
	],
	#category : #Athens-Cairo-Text,
	#timestamp : 'StephaneDucasse 7/6/2014 18:39'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensStrikeFontRenderer class>>on: aCanvas forFont: aFont [
	^ self new canvas: aCanvas; font: aFont; yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensStrikeFontRenderer>>canvas: aCanvas [
	canvas := aCanvas
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensStrikeFontRenderer>>createCairoText: aString [
	| fdesc at |
	at := AthensCairoText new.
	at text: aString.
	fdesc := font asAthensFontDescription.
	at readFrom: fdesc.
	^ at
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensStrikeFontRenderer>>font [
	
	^ font
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensStrikeFontRenderer>>font: anObject [
	
	font := anObject
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensStrikeFontRenderer>>initialize [
	super initialize.
	font := nil.
	canvas := nil
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:26'
}
AthensStrikeFontRenderer>>renderCharacters: aString from: start to: end [
	| cairoText |
	aString isEmpty
		ifTrue: [ ^ self ].
	cairoText := self createCairoText: (aString copyFrom: start to: end).
	canvas paint loadOnCairoCanvas: canvas.
	canvas newPath.
	cairoText drawOn: canvas
]
