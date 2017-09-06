"
A GTSpotterRecorderDiveInCategoryEvent  models the action of  diving in a category (list of results).

"
Class {
	#name : #GTSpotterRecorderDiveInCategoryEvent,
	#superclass : #GTSpotterRecorderEvent,
	#category : #GT-Spotter-EventRecorder-Events,
	#timestamp : 'AndreiChis 2/27/2015 14:36'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderDiveInCategoryEvent>>accept: aVisitor [
	^ aVisitor visitDiveInCategoryEvent: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderDiveInCategoryEvent>>allFilteredCandidates [
	^ self infoAt: #allFilteredCandidates
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderDiveInCategoryEvent>>categoryTitle [
	^ self infoAt: #categoryTitle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderDiveInCategoryEvent>>eventType [
	^ self infoAt: #eventType
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderDiveInCategoryEvent>>fromAnnouncement: anAnnouncement [
	super fromAnnouncement: anAnnouncement.
	self infoAt: #eventType put: anAnnouncement eventType.
	self infoAt: #categoryTitle put: anAnnouncement category title.
	self infoAt: #allFilteredCandidates put: anAnnouncement category allFilteredCandidates size.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderDiveInCategoryEvent>>isDiveIn [
	^ true
]
