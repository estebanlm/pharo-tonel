"
This class models the context in which a set of transmissions take place. In essence, it records all ports that were reached after an outside event. 
 
That is necessary for ensuring that transmissions do not get propagated forever. When the first transmission is triggered, a context is created and this context will then store all ports that any subsequent transmission touches. This info is used to break possible cycles

Instance Variables
	ports:		Collection of Ports
"
Class {
	#name : #GLMTransmissionContext,
	#superclass : #Object,
	#instVars : [
		'ports',
		'forbiddenAnnouncements'
	],
	#category : #Glamour-Core,
	#timestamp : 'DamienCassou 7/9/2011 23:44'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionContext>>addPort: aPort [
	self ports add: aPort
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionContext>>can: aPane announce: anAnnouncement [
	^ ((self forbiddenAnnouncements at: aPane ifAbsent: [Set new])
		includes: anAnnouncement ) not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionContext>>canAnnounceMatchingPresentationsChanged: aPane [
	^ self can: aPane announce: GLMMatchingPresentationsChanged
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionContext>>canAnnouncePresentationsChanged: aPane [
	self can: aPane announce: GLMPresentationsChanged
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionContext>>forbid: aPane toAnnounce: anAnnouncement [
	(self forbiddenAnnouncements at: aPane ifAbsentPut: [Set new])
		add: anAnnouncement
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionContext>>forbidToAnnounceMatchingPresentationsChanged: aPane [
	self forbid: aPane toAnnounce: GLMMatchingPresentationsChanged
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionContext>>forbidToAnnouncePresentationsChanged: aPane [
	self forbid: aPane toAnnounce: GLMPresentationsChanged
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionContext>>forbiddenAnnouncements [
	"forbiddenAnnouncements holds a dictionary in which the key is a pane and the value is a collection of announcements"
	^ forbiddenAnnouncements ifNil: [forbiddenAnnouncements := IdentityDictionary new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionContext>>forbiddenAnnouncements: anObject [
	forbiddenAnnouncements := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionContext>>includesPort: aPort [
	^ self ports includes: aPort
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionContext>>ports [
	^ ports ifNil: [ports := OrderedCollection new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionContext>>ports: anObject [
	ports := anObject
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionContext>>postCopy [
	ports := ports copy
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTransmissionContext>>printOn: aStream  [
	super printOn: aStream.
	aStream nextPut: $(.
	ports printOn: aStream.
	aStream nextPut: $)

]
