"
Message dialog containing a drop list for selection of an item.
"
Class {
	#name : #ChooseDropListDialogWindow,
	#superclass : #MessageDialogWindow,
	#instVars : [
		'listMorph',
		'list'
	],
	#category : #Polymorph-Widgets-Windows,
	#timestamp : 'gvc 5/18/2007 13:46'
}

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:15'
}
ChooseDropListDialogWindow class>>taskbarIconName [
	"Answer the icon for the receiver in a task bar."

	^#smallQuestionIcon
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
ChooseDropListDialogWindow>>icon [
	"Answer an icon for the receiver."

	^ self iconNamed: #questionIcon
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
ChooseDropListDialogWindow>>initialize [
	"Initialize the receiver."

	self list: #().
	super initialize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ChooseDropListDialogWindow>>list [
	"Answer the value of list"

	^ list
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ChooseDropListDialogWindow>>list: anObject [
	"Set the value of list"

	list := anObject.
	self
		changed: #list;
		changed: #selectionIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ChooseDropListDialogWindow>>listMorph [
	"Answer the value of listMorph"

	^ listMorph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ChooseDropListDialogWindow>>listMorph: anObject [
	"Set the value of listMorph"

	listMorph := anObject
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
ChooseDropListDialogWindow>>newContentMorph [
	"Answer a new content morph."

	self iconMorph: self newIconMorph.
	self textMorph: self newTextMorph.
	self listMorph: self newListMorph.
	^self newGroupboxForAll: {
		self newRow: {self iconMorph. self textMorph}.
		self listMorph}
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
ChooseDropListDialogWindow>>newListMorph [
	"Answer a new drop-list morph."

	^self
		newDropListFor: self
		list: #list
		getSelected: #selectionIndex
		setSelected: nil
		getEnabled: nil
		help: nil
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
ChooseDropListDialogWindow>>selectedItem [
	"Answer the selected list item or nil if cancelled."

	^self cancelled ifFalse: [self listMorph selectedItem]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
ChooseDropListDialogWindow>>selectionIndex [
	"Answer the initial selection index for the list."

	^self list ifEmpty: [0] ifNotEmpty: [1]
]
