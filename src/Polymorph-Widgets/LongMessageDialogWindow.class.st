"
Dialog window displaying a message with a single OK button. Escape/return will close. Icon is a themed information icon.
Handles long messages through use of a text editor with potential for scrolling.
"
Class {
	#name : #LongMessageDialogWindow,
	#superclass : #MessageDialogWindow,
	#instVars : [
		'entryText'
	],
	#category : #Polymorph-Widgets-Windows,
	#timestamp : 'gvc 9/23/2008 11:36'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
LongMessageDialogWindow>>entryText [
	"Answer the value of entryText"

	^ entryText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
LongMessageDialogWindow>>entryText: anObject [
	"Set the value of entryText"

	entryText := anObject.
	self changed: #entryText
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
LongMessageDialogWindow>>isResizeable [
	"Answer whether we are not we can be resized."

	^true
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
LongMessageDialogWindow>>newContentMorph [
	"Answer a new content morph."

	self iconMorph: self newIconMorph.
	self textMorph: self newTextMorph.
	^self newGroupboxFor: (
		(self newRow: {self iconMorph. self textMorph})
			cellPositioning: #top;
			vResizing: #spaceFill)
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
LongMessageDialogWindow>>newTextMorph [
	"Answer a new text editor morph."

	|tm|
	tm := (self
		newTextEditorFor: self
		getText: #entryText
		setText: #entryText:
		getEnabled: nil)
			styled: false;
			minWidth: Display width // 4;
			minHeight: Display height // 4;
			disable.
	^tm
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
LongMessageDialogWindow>>text: aStringOrText [
	"Set the text."
	
	|t|
	t := aStringOrText isString
		ifTrue: [aStringOrText asText addAttribute: (TextFontReference toFont: self textFont); yourself]
		ifFalse: [aStringOrText].
	self entryText: t
]
