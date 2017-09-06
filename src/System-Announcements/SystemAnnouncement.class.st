"
The root announcement for the events coming from the Pharo system.

Currently, it wraps the event that comes from the SystemChangeNotifier.
"
Class {
	#name : #SystemAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'timeStamp'
	],
	#category : #System-Announcements-System-Base,
	#timestamp : '<historical>'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncement>>initialize [
	super initialize.
	self setTimeStamp.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncement>>setTimeStamp [

	timeStamp := DateAndTime current
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncement>>timeStamp [

	^ timeStamp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncement>>timeStamp: aTimeStamp [

	timeStamp := aTimeStamp
]
