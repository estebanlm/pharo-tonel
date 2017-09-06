"
I'm an scanned error.
I can have multiple causes.
"
Class {
	#name : #RBErrorToken,
	#superclass : #RBValueToken,
	#instVars : [
		'cause',
		'location'
	],
	#category : #AST-Core-Tokens,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBErrorToken class>>value: value start: tokenStart cause: errorCause location: thePosition [
	^ self new
		value: value
			start: tokenStart
			cause: errorCause
			location: thePosition;
		yourself
]

{
	#category : #accesing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBErrorToken>>cause [
	^ cause
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBErrorToken>>isError [
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBErrorToken>>location [
	^ location
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBErrorToken>>value: theValue start: tokenStart cause: errorCause location: errorPosition [
	self value: theValue start: tokenStart .
	location := errorPosition.
	cause := errorCause .
]
