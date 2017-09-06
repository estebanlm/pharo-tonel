"
ZnResponseReadEvent signals that a response was read in duration milliseconds. This time includes all waiting, server processing and networking.
"
Class {
	#name : #ZnResponseReadEvent,
	#superclass : #ZnClientLogEvent,
	#instVars : [
		'response',
		'duration'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 14:06'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponseReadEvent>>duration [
	^ duration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponseReadEvent>>duration: anObject [
	duration := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponseReadEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream << ' Response Read '; print: response; space; print: duration; << 'ms'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponseReadEvent>>response [
	^ response
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponseReadEvent>>response: anObject [
	response := anObject
]
