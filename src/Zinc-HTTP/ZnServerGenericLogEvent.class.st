"
I am ZnServerGenericLogEvent, a ZnServerLogEvent and ZnLogEvent that holds a generic subject, possibly not limited to a String.

Here are two examples:

(ZnServerGenericLogEvent subject: 'You can''t do that, Dave') emit.

(ZnServerGenericLogEvent subject: { #id->123. #reason->#timeout } asDictionary) emit.
"
Class {
	#name : #ZnServerGenericLogEvent,
	#superclass : #ZnServerLogEvent,
	#instVars : [
		'subject'
	],
	#category : #Zinc-HTTP-Logging,
	#timestamp : 'SvenVanCaekenberghe 6/16/2014 15:03'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerGenericLogEvent class>>subject: object [
	"self subject: #(i 10 j -1)."
	"self subject: 'How are you?'."
	
	^ self new
		subject: object;
		yourself
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerGenericLogEvent>>printContentsOn: stream [
	super printContentsOn: stream.
	stream space; nextPutAll: subject asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerGenericLogEvent>>subject [
	^ subject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerGenericLogEvent>>subject: anObject [
	subject := anObject
]
