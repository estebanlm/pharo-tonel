"
Dialog window displaying a message with a single OK button. Escape/return will close. Icon is a themed lock icon.
"
Class {
	#name : #DenyDialogWindow,
	#superclass : #MessageDialogWindow,
	#category : #Polymorph-Widgets-Windows,
	#timestamp : 'gvc 5/18/2007 13:27'
}

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:15'
}
DenyDialogWindow class>>taskbarIconName [
	"Answer the icon for the receiver in a task bar."

	^#smallLockIcon
]

{
	#category : #'visual properties',
	#timestamp : ' 8/31/2017 05:26:15'
}
DenyDialogWindow>>icon [
	"Answer an icon for the receiver."

	^ self iconNamed: #lockIcon
]
