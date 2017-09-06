"
A GTSpotterRecorderSelectedCandidateChangedEvent models the action of  selecting an element in the search results.

"
Class {
	#name : #GTSpotterRecorderSelectedCandidateChangedEvent,
	#superclass : #GTSpotterRecorderEvent,
	#category : #GT-Spotter-EventRecorder-Events,
	#timestamp : 'AndreiChis 2/28/2015 19:07'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderSelectedCandidateChangedEvent>>accept: aVisitor [
	^ aVisitor visitSelectedCandidateChangedEvent: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderSelectedCandidateChangedEvent>>elementName [
	^ self infoAt: #elementName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderSelectedCandidateChangedEvent>>elementType [
	^ self infoAt: #elementType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderSelectedCandidateChangedEvent>>eventType [
	^ self infoAt: #eventType
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderSelectedCandidateChangedEvent>>fromAnnouncement: anAnnouncement [
	super fromAnnouncement: anAnnouncement.
	self infoAt: #eventType put: anAnnouncement eventType.
	self infoAt: #elementName putHashForText: anAnnouncement selected asString.
	self infoAt: #elementType putHashForText: anAnnouncement selected class name asString.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderSelectedCandidateChangedEvent>>isUserSelection [
	^ self eventType notNil and: [ (self eventType = #unknown) not ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderSelectedCandidateChangedEvent>>isUserSelectionClass [
	^ true
]
