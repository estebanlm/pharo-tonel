"
ZnClientConnectionClosedEvent signals that a client side connection to address:port is closed.
"
Class {
	#name : #ZnClientConnectionClosedEvent,
	#superclass : #ZnClientLogEvent,
	#instVars : [
		'address',
		'port'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 13:58'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientConnectionClosedEvent>>address [
	^ address
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientConnectionClosedEvent>>address: anObject [
	address := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientConnectionClosedEvent>>port [
	^ port
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientConnectionClosedEvent>>port: anObject [
	port := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientConnectionClosedEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream << ' Connection Closed '.
	address do: [ :each | stream print: each ] separatedBy: [ stream nextPut: $. ].
	stream nextPut: $:; print: port
]
