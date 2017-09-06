"
ZnUnknownHttpStatusCode is signalled when an unknown/unsupported HTTP status code is found.

Part of Zinc HTTP Components. 
"
Class {
	#name : #ZnUnknownHttpStatusCode,
	#superclass : #ZnParseError,
	#instVars : [
		'code'
	],
	#category : #Zinc-HTTP-Exceptions,
	#timestamp : 'DamienPollet 8/4/2011 14:07'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUnknownHttpStatusCode class>>code: code [
	^ self new
		code: code;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUnknownHttpStatusCode>>code [
	^ code
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUnknownHttpStatusCode>>code: anObject [
	code := anObject
]
