"
I am raised when a vertical scroll is done
"
Class {
	#name : #RubVerticalScrolled,
	#superclass : #RubMorphAnnouncement,
	#instVars : [
		'scrollValue'
	],
	#category : #Rubric-Editing-Announcements,
	#timestamp : 'FranckWarlouzet 7/29/2015 11:19'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubVerticalScrolled class>>scrollValue: aScrollValue [
	^ self new scrollValue: aScrollValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubVerticalScrolled>>scrollValue [
	^ scrollValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubVerticalScrolled>>scrollValue: anObject [
	scrollValue := anObject
]
