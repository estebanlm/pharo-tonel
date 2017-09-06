"
A NautilusGroupSelected is raised when a group is selected
"
Class {
	#name : #NautilusGroupSelected,
	#superclass : #Announcement,
	#instVars : [
		'group'
	],
	#category : #NautilusCommon-Announcements,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusGroupSelected class>>group: aGroup [

	^ self new group: aGroup
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusGroupSelected>>group [

		^ group
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusGroupSelected>>group: anObject [
	
		group := anObject
]
