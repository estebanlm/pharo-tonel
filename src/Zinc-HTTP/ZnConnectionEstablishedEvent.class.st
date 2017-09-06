"
ZnConnectionEstablishedEvent signals that a client HTTP connection to hostname:port (address:port) was established in duration milliseconds. This time includes DNS resolving.
"
Class {
	#name : #ZnConnectionEstablishedEvent,
	#superclass : #ZnClientLogEvent,
	#instVars : [
		'hostname',
		'port',
		'address',
		'duration',
		'proxy'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 14:35'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnConnectionEstablishedEvent>>address [
	^ address
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnConnectionEstablishedEvent>>address: anObject [
	address := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnConnectionEstablishedEvent>>duration [
	^ duration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnConnectionEstablishedEvent>>duration: anObject [
	duration := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnConnectionEstablishedEvent>>hostname [
	^ hostname
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnConnectionEstablishedEvent>>hostname: anObject [
	hostname := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnConnectionEstablishedEvent>>port [
	^ port
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnConnectionEstablishedEvent>>port: anObject [
	port := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnConnectionEstablishedEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream << ' Connection Established '; nextPutAll: hostname; nextPut: $:; print: port; space. 
	proxy ifNotNil: [ stream << 'via proxy '; print: proxy; space ].
	address do: [ :each | stream print: each ] separatedBy: [ stream nextPut: $. ].
	stream space; print: duration; << 'ms '.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnConnectionEstablishedEvent>>proxy [
	^ proxy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnConnectionEstablishedEvent>>proxy: anObject [
	proxy := anObject
]
