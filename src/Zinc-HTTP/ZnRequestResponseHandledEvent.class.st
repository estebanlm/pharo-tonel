"
ZnRequestResponseHandledEvent signals that the handler (delegate) processed a request and produced a response in duration in milliseconds. This duration is thus the time taken by the application itself.
"
Class {
	#name : #ZnRequestResponseHandledEvent,
	#superclass : #ZnServerLogEvent,
	#instVars : [
		'request',
		'response',
		'duration'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 15:09'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestResponseHandledEvent>>duration [
	^ duration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestResponseHandledEvent>>duration: anObject [
	duration := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestResponseHandledEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream << ' Request Handled '; print: request; space; print: duration; << 'ms'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestResponseHandledEvent>>request [
	^ request
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestResponseHandledEvent>>request: anObject [
	request := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestResponseHandledEvent>>response [
	^ response
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestResponseHandledEvent>>response: anObject [
	response := anObject
]
