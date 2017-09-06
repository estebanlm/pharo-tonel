"
I am emitted when a window content pane is scrolled.
I provide the scroll step value.
"
Class {
	#name : #WindowScrolling,
	#superclass : #WindowAnnouncement,
	#instVars : [
		'step'
	],
	#category : #Morphic-Widgets-Windows-Announcements,
	#timestamp : 'NicolaiHess 4/25/2015 23:18'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowScrolling>>isScrolled [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowScrolling>>step [
	^ step
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowScrolling>>step: anObject [
	step := anObject
]
