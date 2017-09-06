"
Single-line text entry dialog.
"
Class {
	#name : #TextEntryDialogWindow,
	#superclass : #TextEditorDialogWindow,
	#classVars : [
		'MinimumWidth'
	],
	#category : #Polymorph-Widgets-Windows,
	#timestamp : 'gvc 5/18/2007 11:16'
}

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEntryDialogWindow class>>minimumWidth [
	^ MinimumWidth ifNil: [MinimumWidth := 450]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEntryDialogWindow class>>minimumWidth: anInteger [
	MinimumWidth := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEntryDialogWindow>>entryCompletion: anEntryCompletion [
	anEntryCompletion chooseBlock: [:t | self ok].
	self textEditorMorph entryCompletion: anEntryCompletion


]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEntryDialogWindow>>initialExtent [
	^ self minimumWidth @ (super initialExtent y)

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEntryDialogWindow>>minimumWidth [
	^ (super minimumWidth max: self class minimumWidth) min: (Display width)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEntryDialogWindow>>newButtons [
	"Answer new buttons as appropriate."

	^{self newOKButton isDefault: true. self newCancelButton}
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEntryDialogWindow>>newTextEditorMorph [
	"Answer a new text entry morph."

	^(self
		newTextEntryFor: self
		getText: #entryText
		setText: #entryText:
		getEnabled: nil
		help: nil)
		acceptOnCR: false;
		selectAll
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TextEntryDialogWindow>>withDropListButton [
	self textEditorMorph withDropListButton
]
