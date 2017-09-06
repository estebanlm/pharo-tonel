"
I'm a dialog which ask the user to select a element in a list. See me in action:

UIManager default inform:
        (UIManager default 
                chooseFrom: #(one two three) 
                values: #('1' '2' '3')  
                message: 'Select one' 
                title: 'PopupChoiceDialogWindowWithMessage example').
"
Class {
	#name : #PopupChoiceDialogWindowWithMessage,
	#superclass : #PopupChoiceDialogWindow,
	#instVars : [
		'textMorph',
		'iconMorph',
		'textFont',
		'message'
	],
	#category : #Polymorph-Widgets-Windows,
	#timestamp : 'LaurentLaffont 3/4/2011 22:43'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindowWithMessage>>icon [
	"Answer an icon for the receiver."

	^ self iconNamed: #questionIcon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindowWithMessage>>iconMorph [
	"Answer the value of iconMorph"

	^ iconMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindowWithMessage>>iconMorph: anObject [
	"Set the value of iconMorph"

	iconMorph := anObject
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindowWithMessage>>initialExtent [
	"Answer the initial extent for the receiver.
	Adjust the text if the text	would be wider than 1/2 the display width."
	
	|ext|
	ext := super initialExtent.
	self textMorph width > (Display width // 2) ifTrue: [
		self textMorph
			wrapFlag: true;
			hResizing: #rigid;
			extent: Display width // 2 @ 0.
		ext := super initialExtent].
	^ext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindowWithMessage>>message [
	
	^ message
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindowWithMessage>>message: aStringOrText [
	
	message := aStringOrText
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindowWithMessage>>newContentMorph [
	| top bottom |
	self textMorph: self newTextMorph.
	self text: self message.
	self iconMorph: self newIconMorph.
	top := self newRow: {self iconMorph. self textMorph}.
	bottom := super newContentMorph.
	^ self newGroupboxFor: (self newColumn: {top. bottom}).
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindowWithMessage>>newIconMorph [
	"Answer an icon for the receiver."
	
	^ImageMorph new form: self icon
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindowWithMessage>>newTextMorph [
	"Answer a text morph."
	
	^self newText: ''
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindowWithMessage>>text: aStringOrText [
	"Set the text."
	
	|t|
	t := aStringOrText isString
		ifTrue: [aStringOrText asText addAttribute: (TextFontReference toFont: self textFont); yourself]
		ifFalse: [aStringOrText].
	t addAttribute: TextAlignment centered.
	self textMorph newContents: t
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindowWithMessage>>textFont [
	"Answer the text font."
	
	^textFont
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindowWithMessage>>textFont: aFont [
	"Set the text font."
	
	textFont :=  aFont
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindowWithMessage>>textMorph [
	"Answer the value of textMorph"

	^ textMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
PopupChoiceDialogWindowWithMessage>>textMorph: anObject [
	"Set the value of textMorph"

	textMorph := anObject
]
