"
Notify that a group has been unregistered
"
Class {
	#name : #AGroupHasBeenUnregistered,
	#superclass : #AbstractGroupAnnouncement,
	#category : #Nautilus-GroupManager-Announcements,
	#timestamp : 'TorstenBergmann 2/4/2014 21:10'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
AGroupHasBeenUnregistered class>>with: aGroup [

	^ self new group: aGroup
]
