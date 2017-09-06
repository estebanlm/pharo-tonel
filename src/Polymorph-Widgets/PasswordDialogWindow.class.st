"
I'm a Dialog whose TextEditors characters are replaced by *. 

Example:
(UITheme builder openModal: 
        (PasswordDialogWindow new
                title: 'Authentification';
                textFont: StandardFonts defaultFont;
                text: 'Enter your password')) entryText explore
"
Class {
	#name : #PasswordDialogWindow,
	#superclass : #TextEntryDialogWindow,
	#instVars : [
		'textEditor',
		'showPassword'
	],
	#category : #Polymorph-Widgets-Windows,
	#timestamp : 'LaurentLaffont 4/15/2011 20:17'
}

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
PasswordDialogWindow>>beDecrypted [

	textEditor font: self theme textFont
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
PasswordDialogWindow>>beEncrypted [

	textEditor font: (StrikeFont passwordFontSize: self theme textFont pointSize)
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:15'
}
PasswordDialogWindow>>newContentMorph [
	"Answer a new content morph."

	self iconMorph: self newIconMorph.
	self textMorph: self newTextMorph.
	self textMorph wrapFlag: false.
	self textEditorMorph: self newTextEditorMorph.
	^self newGroupboxForAll: {
		self newRow: {self iconMorph. self textMorph}.
		self textEditorMorph.
		self showPasswordButton}
]

{
	#category : #creation,
	#timestamp : ' 8/31/2017 05:26:15'
}
PasswordDialogWindow>>newTextEditorMorph [
	"Answer a new morph for the text entry using a password font."

	textEditor := super newTextEditorMorph.
	self beEncrypted.
	^ textEditor
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
PasswordDialogWindow>>showPassword [
	
	^ showPassword ifNil: [ showPassword := false ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
PasswordDialogWindow>>showPassword: aBoolean [

	(showPassword := aBoolean)
		ifTrue: [ self beDecrypted ]
		ifFalse: [ self beEncrypted ].
	self changed: #showPassword
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
PasswordDialogWindow>>showPasswordButton [

	^ (CheckboxMorph 
			on: self 
			selected: #showPassword
			changeSelected: #showPassword:)
			label: 'Show password';
			labelClickable: true;
			height: 25.
]
