"
An AllProtocol is a special protocol to hanlde the ""all"" case
"
Class {
	#name : #AllProtocol,
	#superclass : #Protocol,
	#instVars : [
		'protocolOrganizer'
	],
	#category : #Kernel-Protocols,
	#timestamp : '<historical>'
}

{
	#category : #data,
	#timestamp : ' 8/31/2017 07:16:33'
}
AllProtocol class>>defaultName [

	^ #'-- all --'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
AllProtocol class>>protocolOrganizer: protocolOrganizer [

	^ self new
		protocolOrganizer: protocolOrganizer;
		yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AllProtocol>>canBeRemoved [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AllProtocol>>canBeRenamed [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AllProtocol>>isVirtualProtocol [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AllProtocol>>methods [

	^ self protocolOrganizer allMethods
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AllProtocol>>name [

	^ (self methods isEmpty and: [ protocolOrganizer protocols isEmpty])
		ifTrue: [ self class nullCategory ]
		ifFalse: [ name ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AllProtocol>>name: aString [
	self error: 'You cannot change my name'.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AllProtocol>>protocolOrganizer [
	
	^ protocolOrganizer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AllProtocol>>protocolOrganizer: anObject [
	
	protocolOrganizer := anObject.
]
