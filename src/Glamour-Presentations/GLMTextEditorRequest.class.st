"
I indicate to the renderer to execute a message on the text editor morph that contains the actual text.
"
Class {
	#name : #GLMTextEditorRequest,
	#superclass : #Announcement,
	#instVars : [
		'action'
	],
	#category : #Glamour-Presentations-Announcements,
	#timestamp : 'AndreiChis 10/4/2014 22:49'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextEditorRequest class>>for: aSelector [

	^ self new action: [ :editor | editor perform: aSelector ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextEditorRequest>>action [
	^ action
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextEditorRequest>>action: anObject [
	action := anObject
]
