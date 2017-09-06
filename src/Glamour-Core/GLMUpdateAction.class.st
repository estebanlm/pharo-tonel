"
GLMUpdateAction is used for controlling the updating of a presentation when an announcement. is sent by the announcerObjects.

Instance Variables:
	condition	<Boolean>
	presentation	<GLMPresentation>
	announcement	<Announcement>
	announcerObjects	<(Collection of: Objects)>
	transformation	<BlockClosure>
"
Class {
	#name : #GLMUpdateAction,
	#superclass : #Object,
	#instVars : [
		'condition',
		'presentation',
		'announcement',
		'announcerObjects',
		'transformation'
	],
	#category : #Glamour-Core,
	#timestamp : 'TudorGirba 1/7/2011 07:30'
}

{
	#category : #'announcement handling',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMUpdateAction>>actOn: anAnnouncement [
	| allowedToTrigger |
	allowedToTrigger := self condition glamourValue: (	
							anAnnouncement asGlamorousMultiValue, 
							self presentation entity asGlamorousMultiValue).
	allowedToTrigger ifTrue: [ self presentation update ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMUpdateAction>>announcement [
	^ announcement
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMUpdateAction>>announcement: anObject [
	announcement := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMUpdateAction>>announcerObjects  [
	^ announcerObjects := self computeAnnouncerObjects ifNil: [OrderedCollection new]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMUpdateAction>>computeAnnouncerObjects  [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMUpdateAction>>condition [
	^ condition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMUpdateAction>>condition: anObject [
	condition := anObject
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMUpdateAction>>initialize [
	super initialize.
	condition := true
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMUpdateAction>>postCopy [
	super postCopy.
	announcerObjects := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMUpdateAction>>presentation [
	^ presentation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMUpdateAction>>presentation: anObject [
	presentation := anObject
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMUpdateAction>>registerInPresentation [
	self announcerObjects do: [: announcerObject |
		announcerObject notNil ifTrue: [
			(announcerObject when: self announcement send: #actOn: to: self) makeWeak.
			
			"we remember the announcer object to be able to 
			unregister from it when the presentation goes away"
			self presentation registeredAnnouncers add: announcerObject ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMUpdateAction>>transformation [
	^ transformation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMUpdateAction>>transformation: anObject [
	transformation := anObject
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMUpdateAction>>unregisterFromAllAnnouncements [
	self announcerObjects do: [:each | 
		[each unsubscribe: self] on: Error do: [:e | e resume]] 
]
