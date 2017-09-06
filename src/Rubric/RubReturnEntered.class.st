"
I am raised when enter is pressed
"
Class {
	#name : #RubReturnEntered,
	#superclass : #RubMorphAnnouncement,
	#instVars : [
		'accepted'
	],
	#category : #Rubric-Editing-Announcements,
	#timestamp : 'FranckWarlouzet 7/29/2015 11:15'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubReturnEntered>>accepted [
	^ accepted ifNil: [ accepted := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubReturnEntered>>accepted: aBoolean [
	accepted := aBoolean
]
