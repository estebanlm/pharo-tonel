"
ZnLineTooLong is signalled when an HTTP CRLF terminated input line exceeds a predefined limit.

Part of Zinc HTTP Components. 
"
Class {
	#name : #ZnLineTooLong,
	#superclass : #ZnParseError,
	#instVars : [
		'limit'
	],
	#category : #Zinc-HTTP-Exceptions,
	#timestamp : 'SvenVanCaekenberghe 2/28/2011 14:15'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLineTooLong class>>limit: limit [
	^ self new 
		limit: limit; 
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLineTooLong>>limit [
	^ limit
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnLineTooLong>>limit: anObject [
	limit := anObject
]
