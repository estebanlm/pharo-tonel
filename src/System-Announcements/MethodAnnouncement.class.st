"
An abstract class for method announcements.
"
Class {
	#name : #MethodAnnouncement,
	#superclass : #SystemAnnouncement,
	#instVars : [
		'method',
		'methodPackage'
	],
	#category : #System-Announcements-System-Methods,
	#timestamp : 'CamilleTeruel 9/4/2014 14:33'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodAnnouncement>>classAffected [
	^ self methodOrigin
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodAnnouncement>>isProvidedByATrait [

	^ self methodOrigin ~= self methodClass

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodAnnouncement>>isProvidedByExtension [
	^self methodOrigin package ~= self methodPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodAnnouncement>>method [
	
	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodAnnouncement>>method: aCompiledMethod [
	method := aCompiledMethod.
	methodPackage := aCompiledMethod package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodAnnouncement>>methodAffected [
	^self method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodAnnouncement>>methodClass [
	^ method methodClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodAnnouncement>>methodOrigin [
	^ method origin
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodAnnouncement>>methodPackage [
	^ methodPackage ifNil: [ methodPackage := method package ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodAnnouncement>>packagesAffected [
	^{self methodPackage}
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodAnnouncement>>protocol [
	
	^ method protocol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodAnnouncement>>protocolsAffected [
	^{self protocol}
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodAnnouncement>>selector [
	
	^ method selector
]
