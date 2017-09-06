"
I am event indicating to the renderer to update its variable bindings.
"
Class {
	#name : #GLMVariableBindingsChanged,
	#superclass : #Announcement,
	#instVars : [
		'presentation'
	],
	#category : #Glamour-Presentations-Announcements,
	#timestamp : 'AndreiChis 5/6/2014 17:51'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMVariableBindingsChanged>>presentation [
	^ presentation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMVariableBindingsChanged>>presentation: anObject [
	presentation := anObject
]
