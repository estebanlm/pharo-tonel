"

"
Class {
	#name : #GTSpotterAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'category'
	],
	#category : #GT-Spotter-Announcements,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterAnnouncement>>category [
	"Return the category (ie the kind of group of elements). This has nothing to do with class category."
	^ category
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterAnnouncement>>category: anObject [
	"Set the category (ie the kind of group of elements). This has nothing to do with class category."
	category := anObject
]
