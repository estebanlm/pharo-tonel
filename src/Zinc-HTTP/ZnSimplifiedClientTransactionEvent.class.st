"
ZnSimplifiedClientTransactionEvent is a ZnClientLogEvent that notes the completion of a client side HTTP transaction (request/response). Only a limited number of simpler data is held. ZnClientTransactionEvent contains much more detailed data.

Instance Variables
	method: HTTP verb
	url: ZnUrl requested
	response:	numeric response code
	size: number of bytes in response
	duration: milliseconds

ZnSimplifiedClientTransactionEvent is ideal for classic HTTP logging with little overhead through its default string representation.
"
Class {
	#name : #ZnSimplifiedClientTransactionEvent,
	#superclass : #ZnClientLogEvent,
	#instVars : [
		'method',
		'url',
		'response',
		'size',
		'duration'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 15:18'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedClientTransactionEvent>>duration [
	^ duration
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedClientTransactionEvent>>initialize [
	super initialize.
	duration := 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedClientTransactionEvent>>method [
	^ method
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedClientTransactionEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream space; nextPutAll: method.
	stream space.
	url printPathQueryFragmentOn: stream.
	stream space; print: response.
	size ifNotNil: [ 
		stream space; print: size; nextPut: $B ].
	stream space; print: duration; nextPutAll: 'ms'
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedClientTransactionEvent>>request: aZnRequest [
	method := aZnRequest method.
	url := aZnRequest url
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedClientTransactionEvent>>requestDuration: requestDuration [
	duration := duration + requestDuration 
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedClientTransactionEvent>>response: aZnResponse [
	response := aZnResponse code.
	aZnResponse hasEntity
		ifTrue: [ size := aZnResponse entity contentLength ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedClientTransactionEvent>>responseCode [
	^ response
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedClientTransactionEvent>>responseDuration: responseDuration [
	duration := duration + responseDuration 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedClientTransactionEvent>>size [
	^ size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnSimplifiedClientTransactionEvent>>url [
	^ url
]
