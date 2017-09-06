"
I'm an abstract announcement for protocols
"
Class {
	#name : #ProtocolAnnouncement,
	#superclass : #SystemAnnouncement,
	#instVars : [
		'protocol',
		'classReorganized'
	],
	#category : #System-Announcements-System-Protocols,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ProtocolAnnouncement>>classAffected [
	^self classReorganized
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ProtocolAnnouncement>>classReorganized [
	^ classReorganized
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ProtocolAnnouncement>>classReorganized: anObject [
	classReorganized := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ProtocolAnnouncement>>protocol [
	^ protocol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ProtocolAnnouncement>>protocol: aString [
	protocol := aString
]
