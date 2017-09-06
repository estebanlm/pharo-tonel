"
A GLMPresentationUpdateRequest is announced by the presentation to notify the presentation that it should update it's content in a fast and non disrutive way. It is usually used in automatic refresh. A presentation can implement this the same way as #update, however it doesn't have to recompute it's content. Depending on its state the presentation can also ignore this request (for example it it is not visible on screen). 
"
Class {
	#name : #GLMPresentationRefreshRequest,
	#superclass : #Announcement,
	#instVars : [
		'presentation'
	],
	#category : #Glamour-Announcements,
	#timestamp : 'AndreiChis 2/27/2017 10:21'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPresentationRefreshRequest>>presentation [
	^ presentation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMPresentationRefreshRequest>>presentation: anObject [
	presentation := anObject
]
