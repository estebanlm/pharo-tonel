"
Notify that a group has been registered
"
Class {
	#name : #AGroupHasBeenRegistered,
	#superclass : #AbstractGroupAnnouncement,
	#category : #Nautilus-GroupManager-Announcements,
	#timestamp : 'TorstenBergmann 2/4/2014 21:09'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
AGroupHasBeenRegistered class>>with: aGroup [

	^ self new group: aGroup
]
