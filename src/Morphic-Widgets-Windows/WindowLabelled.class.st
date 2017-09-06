"
I am emitted when a window title changed. You can ask me for the window
and the changed label (no old/new label data is provided, just the actual one).

This is usefull for window manager or window grouper that provide an overview
for the active windows. Or like the window grouper, that creates tab panes and labels
the tabs with the current window title.
"
Class {
	#name : #WindowLabelled,
	#superclass : #WindowAnnouncement,
	#instVars : [
		'label'
	],
	#category : #Morphic-Widgets-Windows-Announcements,
	#timestamp : 'NicolaiHess 4/25/2015 23:21'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowLabelled>>isLabelled [

	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowLabelled>>label [

	^ label
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowLabelled>>label: anObject [

	label := anObject
]
