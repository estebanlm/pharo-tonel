"
A NautilusKeyPressed is raised each time a key is pressed on a Nautilus ui
"
Class {
	#name : #NautilusKeyPressed,
	#superclass : #Announcement,
	#instVars : [
		'key'
	],
	#category : #NautilusCommon-Announcements,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusKeyPressed class>>key: aKey [

	^ self new key: aKey
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusKeyPressed>>key [

		^ key
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusKeyPressed>>key: anObject [
	
		key := anObject
]
