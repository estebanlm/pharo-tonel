"
Notify that a group has been added
"
Class {
	#name : #AGroupHasBeenAdded,
	#superclass : #AbstractGroupAnnouncement,
	#category : #Nautilus-GroupManager-Announcements,
	#timestamp : 'TorstenBergmann 2/4/2014 21:09'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
AGroupHasBeenAdded class>>group: aGroup into: anHolder [

	^ self group: aGroup from: anHolder
]
