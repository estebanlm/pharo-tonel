"
ZnRequestWrittenEvent signals that a request was written in duration milliseconds.
"
Class {
	#name : #ZnRequestWrittenEvent,
	#superclass : #ZnClientLogEvent,
	#instVars : [
		'request',
		'duration'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 14:05'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestWrittenEvent>>duration [
	^ duration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestWrittenEvent>>duration: anObject [
	duration := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestWrittenEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream << ' Request Written '; print: request; space; print: duration; << 'ms'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestWrittenEvent>>request [
	^ request
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRequestWrittenEvent>>request: anObject [
	request := anObject
]
