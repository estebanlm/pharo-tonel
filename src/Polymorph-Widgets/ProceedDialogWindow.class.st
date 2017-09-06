"
Yes/no dialog. Test result as to whether the dialog is cancelled (no) or not (yes).
"
Class {
	#name : #ProceedDialogWindow,
	#superclass : #MessageDialogWindow,
	#category : #Polymorph-Widgets-Windows,
	#timestamp : 'gvc 5/18/2007 12:22'
}

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:15'
}
ProceedDialogWindow class>>taskbarIconName [
	"Answer the icon for the receiver in a task bar."

	^#smallQuestionIcon
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
ProceedDialogWindow>>handlesKeyboard: evt [
	"Return true if the receiver wishes to handle the given keyboard event"
	
	(super handlesKeyboard: evt) ifTrue: [^true].
	^evt keyCharacter = $y or: [
		evt keyCharacter = $n]
	
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
ProceedDialogWindow>>icon [
	"Answer an icon for the receiver."

	^ self iconNamed: #questionIcon
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
ProceedDialogWindow>>keyStroke: evt [
	"Additionally check for y and n keys (aliases for ok and cancel)."

	(super keyStroke: evt) ifTrue: [^true].
	evt keyCharacter = $y ifTrue: [self yes. ^true].
	evt keyCharacter = $n ifTrue: [self no. ^true].
	^false
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
ProceedDialogWindow>>newButtons [
	"Answer new buttons as appropriate."

	^{self newOKButton. self newCancelButton isDefault: true}
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
ProceedDialogWindow>>no [
	"Answer no."

	self cancel
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
ProceedDialogWindow>>yes [
	"Answer yes."

	self ok
]
