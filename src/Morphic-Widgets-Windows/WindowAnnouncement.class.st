"
I am the base class for all WindowAnnouncements

I define the common interface for WindowAnnouncements. 
You can check the type of the announcement (isMoved/isScrolled ...)
My subclasses implement the specific window announcements and may provide further states.

"
Class {
	#name : #WindowAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'window'
	],
	#category : #Morphic-Widgets-Windows-Announcements,
	#timestamp : 'HenrikNergaard 11/8/2015 13:51'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowAnnouncement>>isActivated [

	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowAnnouncement>>isClosed [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowAnnouncement>>isCollapsed [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowAnnouncement>>isDeActivated [

	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowAnnouncement>>isExpanded [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowAnnouncement>>isLabelled [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowAnnouncement>>isMoved [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowAnnouncement>>isResized [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowAnnouncement>>isScrolled [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowAnnouncement>>window [
	^ window
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowAnnouncement>>window: anObject [
	window := anObject
]
