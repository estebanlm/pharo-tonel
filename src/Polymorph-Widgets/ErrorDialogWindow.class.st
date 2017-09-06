"
A message dialog with an error icon.
"
Class {
	#name : #ErrorDialogWindow,
	#superclass : #MessageDialogWindow,
	#category : #Polymorph-Widgets-Windows,
	#timestamp : 'gvc 5/18/2007 14:51'
}

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:15'
}
ErrorDialogWindow class>>taskbarIconName [
	"Answer the icon for the receiver in a task bar."

	^#smallErrorIcon
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
ErrorDialogWindow>>icon [
	"Answer an icon for the receiver."

	^ self iconNamed: #errorIcon
]
