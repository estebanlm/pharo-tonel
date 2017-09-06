"
ZnClientTransactionEvent is a ZnClientLogEvent that notes the completion of a client side HTTP transaction (request/response).

Instance Variables
	request: a ZnRequest
	requestDuration:	 milliseconds
	response:	a ZnResponse
	responseDuration: milliseconds
	
Note that this can be quite large since it includes the entities transferred. See ZnSimplifiedClientTransactionEvent for a more compact representation.
"
Class {
	#name : #ZnClientTransactionEvent,
	#superclass : #ZnClientLogEvent,
	#instVars : [
		'request',
		'response',
		'requestDuration',
		'responseDuration'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 14:09'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientTransactionEvent>>duration [
	^ requestDuration + responseDuration
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientTransactionEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream space.
	request requestLine printMethodAndUriOn: stream.
	stream space; print: response code.
	response hasEntity
		ifTrue: [ 
			stream space; print: response entity contentLength; nextPut: $B ].
	stream space; print: self duration; nextPutAll: 'ms'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientTransactionEvent>>request [
	^ request
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientTransactionEvent>>request: anObject [
	request := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientTransactionEvent>>requestDuration [
	^ requestDuration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientTransactionEvent>>requestDuration: anObject [
	requestDuration := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientTransactionEvent>>response [
	^ response
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientTransactionEvent>>response: anObject [
	response := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientTransactionEvent>>responseDuration [
	^ responseDuration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientTransactionEvent>>responseDuration: anObject [
	responseDuration := anObject
]
