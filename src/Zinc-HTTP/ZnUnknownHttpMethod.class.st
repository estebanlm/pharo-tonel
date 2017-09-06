"
ZnUnknownHttpMethod is signalled when an unknown/unsupported HTTP method is found while parsing a request.

I am resumable to allow non-standard methods.

Part of Zinc HTTP Components. 
"
Class {
	#name : #ZnUnknownHttpMethod,
	#superclass : #ZnParseError,
	#instVars : [
		'method'
	],
	#category : #Zinc-HTTP-Exceptions,
	#timestamp : 'SvenVanCaekenberghe 12/11/2011 18:09'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUnknownHttpMethod class>>method: method [
	^ self new
		method: method;
		yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUnknownHttpMethod>>isResumable [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUnknownHttpMethod>>method [
	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnUnknownHttpMethod>>method: anObject [
	method := anObject
]
