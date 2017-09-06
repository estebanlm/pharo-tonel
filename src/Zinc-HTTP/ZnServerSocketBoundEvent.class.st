"
ZnServerSocketBoundEvent signals a new server socket on address:port is bound (opened).
"
Class {
	#name : #ZnServerSocketBoundEvent,
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
ZnServerSocketBoundEvent>>address [
	^ address
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSocketBoundEvent>>address: anObject [
	address := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSocketBoundEvent>>port [
	^ port
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSocketBoundEvent>>port: anObject [
	port := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSocketBoundEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream << ' Server Socket Bound '.
	address do: [ :each | stream print: each ] separatedBy: [ stream nextPut: $. ].
	stream nextPut: $:; print: port
	
]
