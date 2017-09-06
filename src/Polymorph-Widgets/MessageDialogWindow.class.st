"
Dialog window displaying a message with a single OK button. Escape/return will close. Icon is a themed information icon.
"
Class {
	#name : #MessageDialogWindow,
	#superclass : #DialogWindow,
	#instVars : [
		'textMorph',
		'textFont',
		'iconMorph'
	],
	#category : #Polymorph-Widgets-Windows,
	#timestamp : 'gvc 5/18/2007 13:27'
}

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow class>>taskbarIconName [
	"Answer the icon for the receiver in a task bar."

	^#smallInfoIcon
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>defaultTextFont [
	^self theme textFont
]

{
	#category : #'visual properties',
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>icon [
	"Answer an icon for the receiver."

	^ self iconNamed: #infoIcon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>iconMorph [
	"Answer the value of iconMorph"

	^ iconMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>iconMorph: anObject [
	"Set the value of iconMorph"

	iconMorph := anObject
]

{
	#category : #open/close,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>initialExtent [
	"Answer the initial extent for the receiver.
	Adjust the text if the text	would be wider than 1/4 the display width."
	
	|ext|
	ext := super initialExtent.
	self textMorph width > (Display width - 50) ifTrue: [
		self textMorph
			wrapFlag: true;
			hResizing: #rigid;
			extent: (Display width - 50) @ 0.
		ext := super initialExtent].
	^ext
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>initialize [
	super initialize.
	textFont:= self defaultTextFont
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>lineLengths [

	^ self textLines collect: [ :line | self textFont widthOfString: line ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>minimumWidth [
	
	^ (self lineLengths max + 100) min: Display width.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>newButtons [
	"Answer new buttons as appropriate."

	^{self newOKButton isDefault: true}
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>newContentMorph [
	"Answer a new content morph."

	self iconMorph: self newIconMorph.
	self textMorph: self newTextMorph.
	^self newGroupboxFor: (self newRow: {self iconMorph. self textMorph})
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>newIconMorph [
	"Answer an icon for the receiver."
	
	^ImageMorph new form: self icon
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>newTextMorph [
	"Answer a text morph."
	^self newText: ' '
]

{
	#category : #theme,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>playOpenSound [
	"Play the themed sound for opening.
	Do nothing at present, done by the UIManager."
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>text: aStringOrText [
	"Set the text."
	
	|t|
	t := aStringOrText isString
		ifTrue: [aStringOrText asText addAttribute: (TextFontReference toFont: self textFont); yourself]
		ifFalse: [aStringOrText].
	t
		addAttribute: TextAlignment centered;
		addAttribute: (TextColor color: self textMorph textColor).
	self textMorph newContents: t

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>textFont [
	"Answer the text font."
	
	^textFont
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>textFont: aFont [
	"Set the text font."
	
	textFont :=  aFont.
	self textMorph ifNotNil: [:m | m font: aFont]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>textLines [

	^ self textMorph text asString lines.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>textMorph [
	"Answer the value of textMorph"

	^ textMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>textMorph: anObject [
	"Set the value of textMorph"

	textMorph := anObject
]

{
	#category : #theme,
	#timestamp : ' 8/31/2017 05:26:15'
}
MessageDialogWindow>>themeChanged [
	"Update the icon."

	super themeChanged.
	self iconMorph image: self icon

]
