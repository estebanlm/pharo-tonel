"
ZnServerStartedEvent notes the startup of an HTTP server is complete.

"
Class {
	#name : #ZnServerStartedEvent,
	#superclass : #ZnServerLogEvent,
	#instVars : [
		'description'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 15:14'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerStartedEvent>>description [
	^ description
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerStartedEvent>>description: anObject [
	description := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerStartedEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream << ' Started '; << description
]
