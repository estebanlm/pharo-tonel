"
This announcement is emitted when a window is collapsed, by pressing the '-' top left button of a window.
"
Class {
	#name : #WindowCollapsed,
	#superclass : #WindowAnnouncement,
	#category : #Morphic-Widgets-Windows-Announcements,
	#timestamp : 'Alexandre.Bergel 8/8/2009 13:20'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowCollapsed>>isCollapsed [
	^ true
]
