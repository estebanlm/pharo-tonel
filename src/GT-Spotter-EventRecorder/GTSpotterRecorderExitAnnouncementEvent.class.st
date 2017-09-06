"
A GTSpotterRecorderExitAnnouncementEvent  models the action of  exiting Spotter. 

Instance Variables
	timestamp:		<Object>

timestamp
	- xxxxx

"
Class {
	#name : #GTSpotterRecorderExitAnnouncementEvent,
	#superclass : #GTSpotterRecorderEvent,
	#category : #GT-Spotter-EventRecorder-Events,
	#timestamp : 'AndreiChis 2/27/2015 14:37'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderExitAnnouncementEvent>>accept: aVisitor [
	^ aVisitor visitExitEvent: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderExitAnnouncementEvent>>closeActionSymbol [
	^ self eventType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderExitAnnouncementEvent>>eventType [
	^ self infoAt: #eventType ifAbsent: [ #missing ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderExitAnnouncementEvent>>fromAnnouncement: anAnnouncement [
	super fromAnnouncement: anAnnouncement.
	self infoAt: #eventType put: anAnnouncement eventType.


]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderExitAnnouncementEvent>>isCloseSpotter [
	^ true
]
