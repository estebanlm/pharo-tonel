"
ZnConnectionAcceptedEvent is signalled when an HTTP server accepts an incoming connection from a client at address.
"
Class {
	#name : #ZnConnectionAcceptedEvent,
	#superclass : #ZnServerLogEvent,
	#instVars : [
		'address'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 15:04'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnConnectionAcceptedEvent>>address [
	^ address
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnConnectionAcceptedEvent>>address: anObject [
	address := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnConnectionAcceptedEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream << ' Connection Accepted '.
	address do: [ :each | stream print: each ] separatedBy: [ stream nextPut: $. ]
]
