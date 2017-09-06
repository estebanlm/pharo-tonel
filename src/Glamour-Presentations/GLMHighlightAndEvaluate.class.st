"
I am event indicating to the renderer to execute the  highlighted text and perform an action with the result.
"
Class {
	#name : #GLMHighlightAndEvaluate,
	#superclass : #Announcement,
	#instVars : [
		'action'
	],
	#category : #Glamour-Presentations-Announcements,
	#timestamp : 'AndreiChis 1/14/2015 13:15'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMHighlightAndEvaluate>>action [
	^ action
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMHighlightAndEvaluate>>action: anObject [
	action := anObject
]
