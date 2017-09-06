"
I am event indicating to the renderer to compile the code of the given presentation.
"
Class {
	#name : #GLMCompileText,
	#superclass : #Announcement,
	#instVars : [
		'context',
		'session',
		'presentation',
		'action'
	],
	#category : #Glamour-Presentations-Announcements,
	#timestamp : 'AndreiChis 5/6/2014 17:53'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompileText>>action [

	^ action
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompileText>>action: aBlock [

	action := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompileText>>context [
	
	^ context
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompileText>>context: anObject [
	
	context := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompileText>>presentation [

	^ presentation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompileText>>presentation: anObject [

	presentation := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompileText>>session [
	
	^ session
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCompileText>>session: anObject [
	
	session := anObject
]
