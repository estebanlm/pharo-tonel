"
I am event indicating to the renderer to execute the currently selected text and perform an action with the result.
"
Class {
	#name : #GLMEvaluateSelection,
	#superclass : #Announcement,
	#instVars : [
		'action',
		'isSyncronous'
	],
	#category : #Glamour-Presentations-Announcements,
	#timestamp : 'AndreiChis 5/6/2014 17:55'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMEvaluateSelection>>action [
	^ action
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMEvaluateSelection>>action: anObject [
	action := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMEvaluateSelection>>initialize [
	super initialize.
	isSyncronous := false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMEvaluateSelection>>isSyncronous [
	^ isSyncronous
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMEvaluateSelection>>makeSyncronous [
	isSyncronous := true
]
