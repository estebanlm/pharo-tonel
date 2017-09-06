"
This announcement will be emitted when a method is removed from a trait or a class, 
using ClassDescription >>removeSelector: or TraitDescription >> removeSelector.

"
Class {
	#name : #MethodRemoved,
	#superclass : #MethodAnnouncement,
	#instVars : [
		'protocol',
		'methodOrigin'
	],
	#category : #System-Announcements-System-Methods,
	#timestamp : 'cyrilledelaunay 1/18/2011 14:43'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodRemoved class>>methodRemoved: aCompiledMethod protocol: aProtocol origin: aBehavior [
	^self new
		method: aCompiledMethod;
		protocol: aProtocol;
		methodOrigin: aBehavior;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodRemoved>>methodOrigin [
	^ methodOrigin
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodRemoved>>methodOrigin: anObject [
	methodOrigin := anObject 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodRemoved>>methodRemoved [
	
	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodRemoved>>protocol [
	^ protocol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodRemoved>>protocol: anObject [
	
	protocol := anObject
]
