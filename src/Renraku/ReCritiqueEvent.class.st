"
A Renraku critic event about an entity
"
Class {
	#name : #ReCritiqueEvent,
	#superclass : #Announcement,
	#instVars : [
		'entity'
	],
	#category : #Renraku-Announcements,
	#timestamp : 'YuriyTymchuk 8/29/2015 21:31'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReCritiqueEvent>>entity [
	^ entity
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReCritiqueEvent>>entity: anObject [

	entity := anObject 
]
