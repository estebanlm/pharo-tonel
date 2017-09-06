"
ZnServerConnectionClosedEvent signals that the server closed a client connection to address. 
"
Class {
	#name : #ZnServerConnectionClosedEvent,
	#superclass : #ZnServerLogEvent,
	#instVars : [
		'address'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 15:10'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerConnectionClosedEvent>>address [
	^ address
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerConnectionClosedEvent>>address: anObject [
	address := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerConnectionClosedEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream << ' Server Connection Closed '.
	address do: [ :each | stream print: each ] separatedBy: [ stream nextPut: $. ]
]
