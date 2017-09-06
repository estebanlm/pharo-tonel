"
I am ZnRespond, a Notification to signal the end of #handleRequest: processing with a specific ZnResponse, earlier than normal stack unwinding.

  ZnRespond signalWith: ZnResponse unauthorized

Normal #handleRequest: processing in a ZnServer delegate takes a ZnRequest object as input argument and needs to produce a ZnResponse as output, returning it as a regular result. Sometimes you do not want to keep managing this single result with many levels of condition on a complex or deep stack, but instead directly want to return a response: that is when you can use the ZnRespond notification.
"
Class {
	#name : #ZnRespond,
	#superclass : #Notification,
	#instVars : [
		'response'
	],
	#category : #Zinc-HTTP-Exceptions,
	#timestamp : 'SvenVanCaekenberghe 7/2/2015 23:18'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRespond class>>signalWith: response [
	^ self new
		response: response;
		signal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRespond>>response [
	^ response
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnRespond>>response: anObject [
	response := anObject
]
