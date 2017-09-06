"
Announcement sent when a Repository is removed from  a Repository group.
"
Class {
	#name : #MCRepositoryRemoved,
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
MCRepositoryRemoved>>repository [
	^ repository
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRepositoryRemoved>>repository: anObject [
	repository := anObject
]
