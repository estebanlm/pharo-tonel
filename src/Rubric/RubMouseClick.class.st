"
I am raised when a mouse down is done
"
Class {
	#name : #RubMouseClick,
	#superclass : #RubMorphAnnouncement,
	#instVars : [
		'event'
	],
	#category : #Rubric-Editing-Announcements,
	#timestamp : 'FranckWarlouzet 7/29/2015 11:14'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMouseClick class>>with: anEvent [
	^ self new event: anEvent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMouseClick>>event [
	^ event
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMouseClick>>event: anObject [
	event := anObject
]
