"
I'm a special working session for test purposes.
I provide a way to escape from the UIManager. 
"
Class {
	#name : #TestWorkingSession,
	#superclass : #WorkingSession,
	#instVars : [
		'errors',
		'errorHandler'
	],
	#category : #System-SessionManager-Tests,
	#timestamp : 'ChristopheDemarey 10/9/2015 15:19'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestWorkingSession>>errorHandler [
	^ errorHandler ifNil: [ self ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestWorkingSession>>errorHandler: anErrorHandler [
	errorHandler := anErrorHandler
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestWorkingSession>>errors [
	^ errors
]

{
	#category : #'deferred startup actions',
	#timestamp : ' 8/31/2017 05:26:46'
}
TestWorkingSession>>executeDeferredStartupActions: isImageStarting [
	"do nothing"
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 05:26:46'
}
TestWorkingSession>>handleError: anError [
	errors add: anError
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:46'
}
TestWorkingSession>>initialize [
	super initialize.
	errors := OrderedCollection new
]

{
	#category : #'startup - shutdown',
	#timestamp : ' 8/31/2017 05:26:46'
}
TestWorkingSession>>start: isImageStarting [
	"do not modify vm parameters, external objects"
	self runStartup: isImageStarting.
]
