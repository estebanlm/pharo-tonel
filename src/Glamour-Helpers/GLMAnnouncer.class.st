"
This is a specialization of the Announcer. The main added functionality is the ability to suspend the announcements from this announcer.
"
Class {
	#name : #GLMAnnouncer,
	#superclass : #Announcer,
	#instVars : [
		'suspendAll',
		'suspendedAnnouncemets'
	],
	#category : #Glamour-Helpers,
	#timestamp : 'TudorGirba 1/23/2011 00:58'
}

{
	#category : #announce,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAnnouncer>>announce: anAnnouncement [
	(self isAnnouncementSuspended: anAnnouncement) ifTrue: [ ^ anAnnouncement asAnnouncement ].
	^ super announce: anAnnouncement
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAnnouncer>>announcer  [
	^ self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAnnouncer>>glmSubscriptions [
	^ registry glmSubscriptions
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAnnouncer>>isAnnouncementSuspended: anAnnouncement [
	^ self suspendAll or: [ |announcementType|
		announcementType := anAnnouncement isClass 
			ifTrue: [ anAnnouncement ] ifFalse: [ anAnnouncement class ].
		self suspendedAnnouncemets anySatisfy: [ :anAnnouncementType |
			"Suspend the announcement if it has the same class or if it inherits from a suspended announcement class."
			announcementType = anAnnouncementType or: [ announcementType  inheritsFrom: anAnnouncementType ]  ] ]
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAnnouncer>>postCopy [
	super postCopy.
	registry := registry copy.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAnnouncer>>resetAnnouncer [
	registry reset
]

{
	#category : #suspending,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAnnouncer>>suspendAll [
	^ suspendAll ifNil: [ suspendAll := false ].
]

{
	#category : #suspending,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAnnouncer>>suspendAll: aCollection while: aBlock [
	| previousSuspendedAnnouncemets |
	previousSuspendedAnnouncemets := suspendedAnnouncemets.
	suspendedAnnouncemets := aCollection copy.
	aBlock ensure: [suspendedAnnouncemets := previousSuspendedAnnouncemets] 
]

{
	#category : #suspending,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAnnouncer>>suspendAllWhile: aBlock [
	| previousSuspensionState |
	previousSuspensionState := suspendAll.
	suspendAll := true.
	aBlock ensure: [suspendAll := previousSuspensionState]
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMAnnouncer>>suspendedAnnouncemets [
	^ suspendedAnnouncemets ifNil: [ suspendedAnnouncemets := OrderedCollection new ].
]
