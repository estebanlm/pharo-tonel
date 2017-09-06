"
I am a morph for a text area which has only one line, like search field
"
Class {
	#name : #RubTextFieldMorph,
	#superclass : #RubScrolledTextMorph,
	#instVars : [
		'hasValidText'
	],
	#category : #Rubric-Editing-Widgets,
	#timestamp : 'FranckWarlouzet 7/29/2015 13:40'
}

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldMorph>>adornmentColor [
	"color to Indicate edit status for the given morph."

	self hasValidText
		ifFalse: [ ^ Color red ].
	^ super adornmentColor
]

{
	#category : #configure,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldMorph>>configureGhostText: aTextArea [
	super configureGhostText: aTextArea.
	self hasKeyboardFocus
		ifTrue: [ 
			aTextArea left: self left]
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldMorph>>defaultGhostTextMorph [
	^ super defaultGhostTextMorph beNotWrapped 
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldMorph>>extent: aPoint [
	super extent: aPoint x @ self textFieldHeight
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldMorph>>hasValidText [
	^ hasValidText ifNil: [ hasValidText := true ] 
]

{
	#category : #'model protocol',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldMorph>>hasValidText: aBoolean [
	hasValidText := aBoolean
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldMorph>>initialize [
	super initialize.
	self textArea announcer when: RubReturnEntered  send: #whenReturnEntered: to: self.
	self scrollbarsShowNever.
	self extent: self extent
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldMorph>>resetState [
	hasValidText := nil.
	super resetState
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldMorph>>textAreaClass [
	^ RubTextFieldArea
]

{
	#category : #geometry,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldMorph>>textFieldHeight [
	| vgap |
	vgap := self currentHScrollBarThickness isZero
		ifTrue: [  0 ]
		ifFalse: [ self currentHScrollBarThickness - 1 ].
	^ self textArea height + 1 + (self borderWidth * 2) + vgap
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubTextFieldMorph>>whenReturnEntered: anAnnouncement [
	self changed

]
