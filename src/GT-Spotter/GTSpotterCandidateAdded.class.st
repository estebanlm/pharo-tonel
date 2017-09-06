"

"
Class {
	#name : #GTSpotterCandidateAdded,
	#superclass : #GTSpotterAnnouncement,
	#instVars : [
		'candidateLink'
	],
	#category : #GT-Spotter-Announcements,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateAdded>>candidate [
	^ candidateLink value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateAdded>>candidateLink [

	^ candidateLink
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateAdded>>candidateLink: anObject [
	candidateLink := anObject
]
