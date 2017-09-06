"
I am emitted when a window is resized.
Collapsing and expanding a window changes the size and therefore it may 
trigger this announcement.

I provide the old and new window size.
"
Class {
	#name : #WindowResizing,
	#superclass : #WindowAnnouncement,
	#instVars : [
		'oldSize',
		'newSize'
	],
	#category : #Morphic-Widgets-Windows-Announcements,
	#timestamp : 'NicolaiHess 4/25/2015 23:18'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowResizing>>isResized [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowResizing>>newSize [
	^ newSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowResizing>>newSize: anObject [
	newSize := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowResizing>>oldSize [
	^ oldSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowResizing>>oldSize: anObject [
	oldSize := anObject
]
