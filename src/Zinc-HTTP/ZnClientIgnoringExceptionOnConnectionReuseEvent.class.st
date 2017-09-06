"
ZnClientIgnoringExceptionOnConnectionReuseEvent signals that a client connection was reused and that an exception occurred. Normally, there is one retry after that, trying to reconnect.

"
Class {
	#name : #ZnClientIgnoringExceptionOnConnectionReuseEvent,
	#superclass : #ZnClientLogEvent,
	#instVars : [
		'exception'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 14:00'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientIgnoringExceptionOnConnectionReuseEvent>>exception [
	^ exception
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientIgnoringExceptionOnConnectionReuseEvent>>exception: anObject [
	exception := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnClientIgnoringExceptionOnConnectionReuseEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream << ' Ignoring Exception On Connection Reuse '; print: exception
]
