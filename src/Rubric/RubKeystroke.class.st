"
I am raised when a keystroke is done
"
Class {
	#name : #RubKeystroke,
	#superclass : #RubMorphAnnouncement,
	#instVars : [
		'event'
	],
	#category : #Rubric-Editing-Announcements,
	#timestamp : 'FranckWarlouzet 7/29/2015 11:03'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubKeystroke class>>with: anEvent [
	^ self new event: anEvent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubKeystroke>>event [
	^ event
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubKeystroke>>event: anObject [
	event := anObject
]
