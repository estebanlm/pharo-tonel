"
A GTSpotterRecorderDiveInElementEvent models the action of diving in a selected element.

"
Class {
	#name : #GTSpotterRecorderDiveInElementEvent,
	#superclass : #GTSpotterRecorderEvent,
	#category : #GT-Spotter-EventRecorder-Events,
	#timestamp : 'AndreiChis 2/27/2015 14:36'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderDiveInElementEvent>>accept: aVisitor [
	^ aVisitor visitDiveInElementEvent: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderDiveInElementEvent>>elementName [
	^ self infoAt: #elementName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderDiveInElementEvent>>elementType [
	^ self infoAt: #elementType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderDiveInElementEvent>>eventType [
	^ self infoAt: #eventType
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderDiveInElementEvent>>fromAnnouncement: anAnnouncement [
	super fromAnnouncement: anAnnouncement.
	self infoAt: #eventType put: anAnnouncement eventType.
	self infoAt: #elementName putHashForText: anAnnouncement element asString.
	self infoAt: #elementType putHashForText: anAnnouncement element class name asString.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderDiveInElementEvent>>isDiveIn [
	^ true
]
