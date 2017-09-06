"
This is event about protocol rename. It should substitute ClassReorganized announcement 
"
Class {
	#name : #ProtocolRenamed,
	#superclass : #ProtocolAnnouncement,
	#instVars : [
		'newProtocolName'
	],
	#category : #System-Announcements-System-Protocols,
	#timestamp : 'DenisKudryashov 11/15/2016 11:51'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ProtocolRenamed>>newProtocolName [
	^ newProtocolName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ProtocolRenamed>>newProtocolName: anObject [
	newProtocolName := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ProtocolRenamed>>oldProtocolName [
	^ protocol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ProtocolRenamed>>oldProtocolName: aString [
	self protocol: aString
]
