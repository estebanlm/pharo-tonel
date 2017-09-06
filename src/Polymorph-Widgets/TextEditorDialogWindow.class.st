"
Multi-line text entry dialog.
"
Class {
	#name : #TextEditorDialogWindow,
	#superclass : #MessageDialogWindow,
	#instVars : [
		'entryText',
		'textEditorMorph'
	],
	#classVars : [
		'AutoAccept'
	],
	#category : #Polymorph-Widgets-Windows,
	#timestamp : 'gvc 5/18/2007 11:16'
}

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEditorDialogWindow class>>taskbarIconName [
	"Answer the icon for the receiver in a task bar."

	^#smallQuestionIcon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEditorDialogWindow>>cancel [
	"Cancel and close."

	self entryText: nil.
	^super cancel
]

{
	#category : #'focus handling',
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEditorDialogWindow>>defaultFocusMorph [
	"Answer the morph that should have the keyboard
	focus by default when the dialog is opened."
	
	^self textEditorMorph textMorph
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEditorDialogWindow>>entryHeight: aNumber [
	"Set the height of the text editor morph.
	Set the width to be 2 times this also."

	self textEditorMorph
		minHeight: aNumber;
		minWidth: 500
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEditorDialogWindow>>entryText [
	"Answer the value of entryText"

	^ entryText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEditorDialogWindow>>entryText: anObject [
	"Set the value of entryText"

	entryText := anObject.
	self changed: #entryText.
	self textEditorMorph selectAll.
	self ok.
	self textEditorMorph hasUnacceptedEdits: true.
]

{
	#category : #'visual properties',
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEditorDialogWindow>>icon [
	"Answer an icon for the receiver."

	^ self iconNamed: #questionIcon
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEditorDialogWindow>>initialize [
	"Initialize the receiver."

	super initialize.
	self beResizeable.
	entryText := ''.
	self changed: #entryText.
	self textEditorMorph selectAll.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEditorDialogWindow>>newButtons [
	"Answer new buttons as appropriate."

	^{self newOKButton. self newCancelButton}
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEditorDialogWindow>>newContentMorph [
	"Answer a new content morph."

	self iconMorph: self newIconMorph.
	self textMorph: self newTextMorph.
	self textMorph wrapFlag: false.
	self textEditorMorph: self newTextEditorMorph.
	^self newGroupboxForAll: {
		self newRow: {self iconMorph. self textMorph}.
		self textEditorMorph}
]

{
	#category : #creation,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEditorDialogWindow>>newTextEditorMorph [
	"Answer a new text entry morph."
	^(self
		newTextEditorFor: self
		getText: #entryText
		setText: #entryText:
		getEnabled: nil) 
		selectAll
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEditorDialogWindow>>textEditorMorph [
	"Answer the value of textEditorMorph"

	^ textEditorMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEditorDialogWindow>>textEditorMorph: anObject [
	"Set the value of textEditorMorph"

	textEditorMorph := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEditorDialogWindow>>textLines [

	^ super textLines, entryText asString lines.
]
