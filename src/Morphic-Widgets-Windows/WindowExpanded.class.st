"
This announcement is emitted when a window leaves a collapsed mode. This happens when you press on a window icon in the taskbar.
"
Class {
	#name : #WindowExpanded,
	#superclass : #WindowAnnouncement,
	#category : #Morphic-Widgets-Windows-Announcements,
	#timestamp : 'Alexandre.Bergel 8/8/2009 13:20'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowExpanded>>isExpanded [
	^ true
]
