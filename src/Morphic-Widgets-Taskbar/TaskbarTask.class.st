"
Holds the state of a taskbar/tasklist entry.
"
Class {
	#name : #TaskbarTask,
	#superclass : #Object,
	#instVars : [
		'morph',
		'state',
		'label',
		'icon'
	],
	#category : #Morphic-Widgets-Taskbar,
	#timestamp : 'gvc 5/18/2007 11:20'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskbarTask class>>morph: aMorph state: aSymbol icon: aForm label: aString [
	"Answer a new instance of the receiver with the given parameters."

	^self new
		morph: aMorph;
		state: aSymbol;
		icon: aForm;
		label: aString
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskbarTask>>= aTaskbarTask [
	"Answer whether equal."

	^self species = aTaskbarTask species
		and: [self morph == aTaskbarTask morph
		and: [self state == aTaskbarTask state
		and: [self icon = aTaskbarTask icon
		and: [self label = aTaskbarTask label]]]]
]

{
	#category : #activation,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskbarTask>>activate [
	"Activate the task."
	
	(self morph respondsTo: #restoreAndActivate)
		ifTrue: [self morph restoreAndActivate]
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskbarTask>>buttonClickedForTaskList: aTasklist [
	"Notify the tasklist."
	
	aTasklist taskClicked: self
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskbarTask>>hash [
	"Hash is implemented because #= is implemented."
	
	^self morph hash
		bitXor: (self state hash
		bitXor: (self icon hash
		bitXor: self label hash))
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskbarTask>>icon [
	"Answer the value of icon"

	^ icon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskbarTask>>icon: anObject [
	"Set the value of icon"

	icon := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskbarTask>>isActive [
	"Answer whether the task is active."

	^self state == #active
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskbarTask>>isMinimized [
	"Answer whether the task is minimized."

	^self state == #minimized
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskbarTask>>label [
	"Answer the value of label"

	^ label
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskbarTask>>label: anObject [
	"Set the value of label"

	label := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskbarTask>>morph [
	"Answer the value of morph"

	^ morph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskbarTask>>morph: anObject [
	"Set the value of morph"

	morph := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskbarTask>>state [
	"Answer the value of state"

	^ state
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskbarTask>>state: anObject [
	"Set the value of state"

	state := anObject
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskbarTask>>taskListButtonFor: aTasklist [
	"Answer a button for the task."
	
	^self theme
		newTaskListButtonIn: aTasklist
		for: self
]

{
	#category : #user-interface,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskbarTask>>taskbarButtonFor: aTaskBar [
	"Answer a button for the task."
	
	^self morph taskbarButtonFor: aTaskBar
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
TaskbarTask>>theme [
	^ Smalltalk ui theme
]
