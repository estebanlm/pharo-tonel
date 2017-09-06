"
Request to perform an action on the current bindings from the editor.
"
Class {
	#name : #GLMVariableBindingsAccessRequest,
	#superclass : #Announcement,
	#instVars : [
		'actionBlock'
	],
	#category : #Glamour-Presentations-Announcements,
	#timestamp : 'AndreiChis 3/19/2015 17:59'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMVariableBindingsAccessRequest>>action [

	^ actionBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMVariableBindingsAccessRequest>>action: aBlock [

	actionBlock := aBlock
]
