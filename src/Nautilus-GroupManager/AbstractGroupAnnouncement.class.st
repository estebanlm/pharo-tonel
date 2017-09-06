"
Common superclass for group announcements
"
Class {
	#name : #AbstractGroupAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'group',
		'holder'
	],
	#category : #Nautilus-GroupManager-Announcements,
	#timestamp : 'TorstenBergmann 2/4/2014 21:09'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractGroupAnnouncement class>>group: aGroup [

	^ self new 
		group: aGroup;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractGroupAnnouncement class>>group: aGroup from: anHolder [

	^ self new 
		group: aGroup;
		holder: anHolder;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractGroupAnnouncement>>group [

		^ group
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractGroupAnnouncement>>group: anObject [
	
		group := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractGroupAnnouncement>>holder [

		^ holder
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AbstractGroupAnnouncement>>holder: anObject [
	
		holder := anObject
]
