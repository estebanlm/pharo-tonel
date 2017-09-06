"
I indicate to the renderer to execute a message on the window that rendered this presentation. It will only execute if the presentation is directly rendered in a window (i.e., if this is the presentation to which #openWith: was sent)
"
Class {
	#name : #GLMWindowRequest,
	#superclass : #Announcement,
	#instVars : [
		'action'
	],
	#category : #Glamour-Core,
	#timestamp : 'AndreiChis 4/18/2016 17:37'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWindowRequest class>>for: aSelector [

	^ self new action: [ :editor | editor perform: aSelector ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWindowRequest>>action [
	^ action
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMWindowRequest>>action: anObject [
	action := anObject
]
