"
Announcer for group announcements
"
Class {
	#name : #GroupAnnouncer,
	#superclass : #Announcer,
	#classInstVars : [
		'announcer'
	],
	#category : #Nautilus-GroupManager-Announcements,
	#timestamp : 'TorstenBergmann 2/4/2014 21:10'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupAnnouncer class>>reset [
	announcer := nil.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupAnnouncer class>>uniqueInstance [
	"Answer a system annoncer."
	
	^ announcer ifNil: [ announcer := self new ]
]
