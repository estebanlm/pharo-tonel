"
I represent an error that appears when a data cannot be unpacked (materialized).

Collaborators: GTEventUnpacking

"
Class {
	#name : #GTEventUnpackingError,
	#superclass : #GTEventRecorderError,
	#instVars : [
		'data',
		'errors'
	],
	#category : #GT-EventRecorder-Exceptions,
	#timestamp : 'JurajKubelka 10/30/2015 12:19'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventUnpackingError class>>signal: aString data: aByteArray errors: aCollection  [
	^ self new
			data: aByteArray;
			errors: aCollection;
			signal: aString;
			yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventUnpackingError>>data [
	^ data
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventUnpackingError>>data: anObject [
	data := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventUnpackingError>>errors [
	^ errors
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventUnpackingError>>errors: anObject [
	errors := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventUnpackingError>>isResumable [
	"Determine whether an exception is resumable."
	^true
]
