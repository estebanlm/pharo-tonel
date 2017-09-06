"

"
Class {
	#name : #GTSpotterSelectedCandidateChanged,
	#superclass : #Announcement,
	#instVars : [
		'eventType',
		'selected'
	],
	#category : #GT-Spotter-Announcements,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterSelectedCandidateChanged>>eventType [
	^ eventType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterSelectedCandidateChanged>>eventType: anObject [
	eventType := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterSelectedCandidateChanged>>select: anObject [
	selected := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterSelectedCandidateChanged>>selected [
	^ selected
]
