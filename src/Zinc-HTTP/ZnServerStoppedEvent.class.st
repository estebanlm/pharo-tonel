"
ZnServerStoppedEvent notes the shutdown of an HTTP server is complete.
"
Class {
	#name : #ZnServerStoppedEvent,
	#superclass : #ZnServerLogEvent,
	#instVars : [
		'description'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 15:15'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerStoppedEvent>>description [
	^ description
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerStoppedEvent>>description: anObject [
	description := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerStoppedEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream << ' Stopped '; << description
]
