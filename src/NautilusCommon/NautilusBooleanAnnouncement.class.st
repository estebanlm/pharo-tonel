"
Announcement raised when a boolean value changed
"
Class {
	#name : #NautilusBooleanAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'boolean'
	],
	#category : #NautilusCommon-Announcements,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusBooleanAnnouncement class>>boolean: aBoolean [

	^ self new boolean: aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusBooleanAnnouncement>>boolean [

		^ boolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusBooleanAnnouncement>>boolean: anObject [
	
		boolean := anObject
]
