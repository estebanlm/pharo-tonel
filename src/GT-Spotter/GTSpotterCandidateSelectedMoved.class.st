"

"
Class {
	#name : #GTSpotterCandidateSelectedMoved,
	#superclass : #Announcement,
	#instVars : [
		'candidateBrick'
	],
	#category : #GT-Spotter-Announcements,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateSelectedMoved>>itemBrick [
	^ candidateBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateSelectedMoved>>itemBrick: anObject [
	candidateBrick := anObject
]
