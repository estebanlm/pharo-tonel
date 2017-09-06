"
ZnClientRetryingEvent signals a client is retrying is main operation. The number of retries is configurable.

"
Class {
	#name : #ZnClientRetryingEvent,
	#superclass : #ZnClientLogEvent,
	#instVars : [
		'exception'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 14:01'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientRetryingEvent>>exception [
	^ exception
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientRetryingEvent>>exception: anObject [
	exception := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientRetryingEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream << ' Retrying '; print: exception
]
