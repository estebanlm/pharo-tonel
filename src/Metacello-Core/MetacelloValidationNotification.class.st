"

"
Class {
	#name : #MetacelloValidationNotification,
	#superclass : #Notification,
	#instVars : [
		'issue'
	],
	#category : #Metacello-Core-Exceptions-Notifications,
	#timestamp : ''
}

{
	#category : #exceptioninstantiator,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationNotification class>>signal: aMetacelloValidationIssue [

	^ self new signal: aMetacelloValidationIssue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationNotification>>issue [
	^ issue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationNotification>>issue: anObject [
	issue := anObject
]

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValidationNotification>>signal: aMetacelloValidationIssue [

	self issue: aMetacelloValidationIssue.
	^ self signal
]
