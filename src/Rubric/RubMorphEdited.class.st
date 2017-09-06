"
I am raised when a morph is edited
"
Class {
	#name : #RubMorphEdited,
	#superclass : #RubMorphAnnouncement,
	#instVars : [
		'previousContents'
	],
	#category : #Rubric-Editing-Announcements,
	#timestamp : 'FranckWarlouzet 7/29/2015 11:14'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMorphEdited>>previousContents [
	^ previousContents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubMorphEdited>>previousContents: anObject [
	previousContents := anObject
]
