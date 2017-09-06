"
A GTSpotterRecorderActOnEvent models the action of pressing enter (or double clicking) on an element.

"
Class {
	#name : #GTSpotterRecorderActOnEvent,
	#superclass : #GTSpotterRecorderEvent,
	#category : #GT-Spotter-EventRecorder-Events,
	#timestamp : 'AndreiChis 2/27/2015 14:35'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderActOnEvent>>accept: aVisitor [
	^ aVisitor visitActOnEvent: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderActOnEvent>>closeActionSymbol [
	^ #actOn
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderActOnEvent>>elementName [
	^ self infoAt: #elementName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderActOnEvent>>elementType [
	^ self infoAt: #elementType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderActOnEvent>>eventType [
	^ self infoAt: #eventType
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderActOnEvent>>fromAnnouncement: anAnnouncement [
	super fromAnnouncement: anAnnouncement.
	self infoAt: #eventType put: anAnnouncement eventType.
	self infoAt: #elementName putHashForText: anAnnouncement element asString.
	self infoAt: #elementType putHashForText: anAnnouncement element class name asString.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderActOnEvent>>isCloseSpotter [
	^ true
]
