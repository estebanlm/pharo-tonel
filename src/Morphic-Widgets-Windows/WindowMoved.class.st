"
I am emitted when a window is moved.
I provide the old and new window position. 
A window position changes even when the topleft corner changed by a window resize operation 
or the windows collapses.
"
Class {
	#name : #WindowMoved,
	#superclass : #WindowAnnouncement,
	#instVars : [
		'oldPosition',
		'newPosition'
	],
	#category : #Morphic-Widgets-Windows-Announcements,
	#timestamp : 'NicolaiHess 4/25/2015 23:16'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowMoved>>isMoved [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowMoved>>newPosition [
	^ newPosition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowMoved>>newPosition: anObject [
	newPosition := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowMoved>>oldPosition [
	^ oldPosition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowMoved>>oldPosition: anObject [
	oldPosition := anObject
]
