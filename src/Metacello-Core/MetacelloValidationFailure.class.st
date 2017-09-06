"

"
Class {
	#name : #MetacelloValidationFailure,
	#superclass : #Error,
	#instVars : [
		'issues'
	],
	#category : #Metacello-Core-Exceptions-Errors,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationFailure class>>issues: anObject message: aString [
    ^ self new
        issues: anObject;
        signal: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationFailure>>issues [
	^ issues
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationFailure>>issues: anObject [
	issues := anObject
]
