"
ZnServerTransactionEvent is a ZnServerLogEvent that notes the completion of a server side HTTP transaction (request/response).

Instance Variables
	request: a ZnRequest
	response:	a ZnResponse
	timing: a ZnServerTransactionTiming

Note that this can be quite large since it includes the entities transferred. See ZnSimplifiedServerTransactionEvent for a more compact representation.
"
Class {
	#name : #ZnServerTransactionEvent,
	#superclass : #ZnServerLogEvent,
	#instVars : [
		'request',
		'response',
		'timing'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 15:18'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerTransactionEvent>>duration [
	^ timing totalDuration
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerTransactionEvent>>printContentsOn: stream [
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
ZnServerTransactionEvent>>request [
	^ request
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerTransactionEvent>>request: anObject [
	request := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerTransactionEvent>>response [
	^ response
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerTransactionEvent>>response: anObject [
	response := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerTransactionEvent>>timing [
	^ timing
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerTransactionEvent>>timing: anObject [
	timing := anObject
]
