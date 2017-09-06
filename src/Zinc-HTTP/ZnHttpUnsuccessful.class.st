"
ZnHttpUnsuccessful is signalled when an HTTP client receives a non success response.

See ZnResponse>>#isSuccess

I hold the response that was unsuccessful.

Part of Zinc HTTP Components. 
"
Class {
	#name : #ZnHttpUnsuccessful,
	#superclass : #Error,
	#instVars : [
		'response'
	],
	#category : #Zinc-HTTP-Exceptions,
	#timestamp : 'SvenVanCaekenberghe 12/20/2011 12:52'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHttpUnsuccessful class>>response: response [
	^ self new
		response: response;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHttpUnsuccessful>>messageText [
	"Overwritten to initialiaze the message text to a standard text if it has not yet been set"
	
	^ messageText ifNil: [ messageText := self standardMessageText ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHttpUnsuccessful>>response [
	^ response
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHttpUnsuccessful>>response: anObject [
	response := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnHttpUnsuccessful>>standardMessageText [
	"Generate a standard textual description"
	
	^ String streamContents: [ :stream |
		response ifNotNil: [
			response statusLine printCodeAndReasonOn: stream ] ]
]
