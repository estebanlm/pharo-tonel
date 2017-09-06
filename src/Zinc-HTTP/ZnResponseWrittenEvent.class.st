"
ZnResponseWrittenEvent signals that response was written in duration milliseconds.
"
Class {
	#name : #ZnResponseWrittenEvent,
	#superclass : #ZnServerLogEvent,
	#instVars : [
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
ZnResponseWrittenEvent>>duration [
	^ duration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponseWrittenEvent>>duration: anObject [
	duration := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponseWrittenEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream << ' Response Written '; print: response; space; print: duration; << 'ms'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponseWrittenEvent>>response [
	^ response
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnResponseWrittenEvent>>response: anObject [
	response := anObject
]
