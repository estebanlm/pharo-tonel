"
Common superclass for exceptions while using file streams
"
Class {
	#name : #FileException,
	#superclass : #Error,
	#instVars : [
		'fileName'
	],
	#category : #Files-Core,
	#timestamp : 'TorstenBergmann 2/3/2014 23:36'
}

{
	#category : #exceptioninstantiator,
	#timestamp : ' 8/31/2017 07:16:12'
}
FileException class>>fileName: aFileName [
	^self new fileName: aFileName
]

{
	#category : #exceptiondescription,
	#timestamp : ' 8/31/2017 07:16:12'
}
FileException>>fileName [
	^fileName
]

{
	#category : #exceptionbuilder,
	#timestamp : ' 8/31/2017 07:16:12'
}
FileException>>fileName: aFileName [
	fileName := aFileName
]

{
	#category : #exceptiondescription,
	#timestamp : ' 8/31/2017 07:16:12'
}
FileException>>isResumable [
	"Determine whether an exception is resumable."

	^true
]

{
	#category : #exceptiondescription,
	#timestamp : ' 8/31/2017 07:16:12'
}
FileException>>messageText [
	"Return an exception's message text."

	^ messageText isNil
		ifTrue: [ fileName printString ]
		ifFalse: [ messageText ]
]
