"
This announcement will be emitted when:
	=> a non-empty protocol is renamed in a class or a trait (using ClassOrganizer >> renameCategory:toBe:). If the protocol does not contain any method, the announcement will not be emitted. Therefore, if we rename a non-empty protocol, both SystemMethodRecategorizedAnnouncement and SystemClassReorganizedAnnouncement will be emitted
	=> a method is removed from a category of a class or a trait (using ClassOrganizer >> removeElement:)
	=> a method is RE-categorized in a protocol of a trait or a class, using Organizer>>classify:under:.  If the method is classify under its current protocol, the announcement will not be emitted
"
Class {
	#name : #MethodRecategorized,
	#superclass : #MethodAnnouncement,
	#instVars : [
		'oldProtocol'
	],
	#category : #System-Announcements-System-Methods,
	#timestamp : 'cyrilledelaunay 1/18/2011 15:03'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodRecategorized class>>method: aCompiledMethod oldProtocol: anOldProtocol [

	^self new
		method: aCompiledMethod;
		oldProtocol: anOldProtocol;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodRecategorized>>methodRecategorized [
	
	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodRecategorized>>newProtocol [
	
	^ self protocol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodRecategorized>>oldProtocol [
	
	^ oldProtocol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodRecategorized>>oldProtocol: anObject [
	
	oldProtocol := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
MethodRecategorized>>protocolsAffected [
	^{self newProtocol. self oldProtocol}
]
