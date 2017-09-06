"
ZnServerSocketReleasedEvent signals a new server socket on address:port is released (closed).
"
Class {
	#name : #ZnServerSocketReleasedEvent,
	#superclass : #ZnServerLogEvent,
	#instVars : [
		'address',
		'port'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 15:14'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSocketReleasedEvent>>address [
	^ address
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSocketReleasedEvent>>address: anObject [
	address := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSocketReleasedEvent>>port [
	^ port
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSocketReleasedEvent>>port: anObject [
	port := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSocketReleasedEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream << ' Server Socket Released '.
	address do: [ :each | stream print: each ] separatedBy: [ stream nextPut: $. ].
	stream nextPut: $:; print: port
]
