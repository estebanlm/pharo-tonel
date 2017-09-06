"
This class stores the announcements raised by the Glamour model in an ordered collection.

The collection can later be used for debugging.
"
Class {
	#name : #GLMMemoryLogger,
	#superclass : #GLMLogger,
	#instVars : [
		'announcements'
	],
	#category : #Glamour-Helpers,
	#timestamp : 'tg 5/24/2010 16:59'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMMemoryLogger>>announcements [
	^ announcements
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMMemoryLogger>>announcements: anObject [
	announcements := anObject
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMMemoryLogger>>initialize  [
	announcements := OrderedCollection new
]

{
	#category : #logging,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMMemoryLogger>>logAnnouncement: anAnnouncement from: aGLMObject  [
	announcements add: anAnnouncement
]
