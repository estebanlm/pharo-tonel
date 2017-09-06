"
I am raised when a horizontal scroll is done
"
Class {
	#name : #RubHorizontalScrolled,
	#superclass : #RubMorphAnnouncement,
	#instVars : [
		'scrollValue'
	],
	#category : #Rubric-Editing-Announcements,
	#timestamp : 'FranckWarlouzet 7/29/2015 11:01'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubHorizontalScrolled class>>scrollValue: aScrollValue [
	^ self new scrollValue: aScrollValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubHorizontalScrolled>>scrollValue [
	^ scrollValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubHorizontalScrolled>>scrollValue: anObject [
	scrollValue := anObject
]
