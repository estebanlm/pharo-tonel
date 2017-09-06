"

"
Class {
	#name : #GLMTextModel,
	#superclass : #GLMMorphicModel,
	#instVars : [
		'text'
	],
	#category : #Glamour-Morphic-Widgets,
	#timestamp : ''
}

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTextModel>>accept: aText notifying: anObject  [
	aText asString trimBoth ifEmpty: [^self].
	self text: aText.
	self changed: #text
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTextModel>>changedText: aTextOrString [
	text := aTextOrString.
	self changed: #text
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTextModel>>keystroke: anEvent from: aMorph [
	anEvent anyModifierKeyPressed ifTrue: [ ^ super keystroke: anEvent from: aMorph ].
	self glamourPresentation text: self text.
	^ false
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTextModel>>menu: aMorphMenu shifted: b [
	^ self menu: aMorphMenu
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTextModel>>selectSilently: anIndex [
	self changed: #selection
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTextModel>>selection [
	^ self glamourPresentation selectionInterval ifNil: [1 to: 0]
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTextModel>>text [
	^text
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTextModel>>text: aTextOrString [
	text := aTextOrString.
	self glamourPresentation ifNotNil: [ :presentation | presentation text: text ]
]
