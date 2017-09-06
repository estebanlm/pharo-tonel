"
Message dialog with a warning icon.
"
Class {
	#name : #AlertDialogWindow,
	#superclass : #MessageDialogWindow,
	#category : #Polymorph-Widgets-Windows,
	#timestamp : 'gvc 5/18/2007 13:52'
}

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:15'
}
AlertDialogWindow class>>taskbarIconName [
	"Answer the icon for the receiver in a task bar."

	^ #smallWarningIcon
]

{
	#category : #'visual properties',
	#timestamp : ' 8/31/2017 05:26:15'
}
AlertDialogWindow>>icon [
	"Answer an icon for the receiver."

	^ self iconNamed: #warningIcon
]
