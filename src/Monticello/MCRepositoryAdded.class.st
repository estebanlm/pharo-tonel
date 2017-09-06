"
Announcement sent when a Repository is added to a Repository group.
"
Class {
	#name : #MCRepositoryAdded,
	#superclass : #Announcement,
	#instVars : [
		'repository'
	],
	#category : #Monticello-Announcements,
	#timestamp : 'NicolaiHess 11/4/2015 23:56'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryAdded>>repository [
	^ repository
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryAdded>>repository: anObject [
	repository := anObject
]
