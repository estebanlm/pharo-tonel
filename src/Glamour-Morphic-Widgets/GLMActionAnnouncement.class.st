"

"
Class {
	#name : #GLMActionAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'action'
	],
	#category : #Glamour-Morphic-Widgets,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionAnnouncement class>>action: anAction [
	^self new action: anAction; yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionAnnouncement>>action [
	^action
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMActionAnnouncement>>action: anAction [
	action := anAction
]
