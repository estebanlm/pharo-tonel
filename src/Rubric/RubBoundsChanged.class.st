"
I am an abstract announcement relates to text area bounds changing
"
Class {
	#name : #RubBoundsChanged,
	#superclass : #RubMorphAnnouncement,
	#instVars : [
		'previousBounds'
	],
	#category : #Rubric-Editing-Announcements,
	#timestamp : 'FranckWarlouzet 7/29/2015 10:48'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubBoundsChanged>>previousBounds [
	^ previousBounds
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubBoundsChanged>>previousBounds: anObject [
	previousBounds := anObject
]
