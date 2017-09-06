"
ZnRequestReadEvent is signalled when an HTTP server reads a request in duration milliseconds.

Note that the duration can be misleading: when servicing multiple requests over a kept alive connection (the default for HTTP 1.1), the read time includes any wait time (as long as it is below the timeout). The first request read should not contain wait time.
"
Class {
	#name : #ZnRequestReadEvent,
	#superclass : #ZnServerLogEvent,
	#instVars : [
		'request',
		'duration'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 15:07'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestReadEvent>>duration [
	^ duration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestReadEvent>>duration: anObject [
	duration := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestReadEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream << ' Request Read '; print: request; space; print: duration; << 'ms'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestReadEvent>>request [
	^ request
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestReadEvent>>request: anObject [
	request := anObject
]
