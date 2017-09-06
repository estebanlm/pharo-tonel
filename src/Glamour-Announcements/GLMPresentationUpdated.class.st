"
A GLMPresentationUpdated is announced by the presentation when an update is wanted.
"
Class {
	#name : #GLMPresentationUpdated,
	#superclass : #Announcement,
	#instVars : [
		'presentation'
	],
	#category : #Glamour-Announcements,
	#timestamp : 'tg 2/20/2010 14:54'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPresentationUpdated>>presentation [
	^ presentation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPresentationUpdated>>presentation: anObject [
	presentation := anObject
]
