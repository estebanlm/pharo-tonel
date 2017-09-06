"

"
Class {
	#name : #MetacelloCleanNotification,
	#superclass : #Notification,
	#instVars : [
		'version'
	],
	#category : #Metacello-Core-Exceptions-Notifications,
	#timestamp : ''
}

{
	#category : #exceptioninstantiator,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloCleanNotification class>>signal: aMetacelloVersion [

	^ self new signal: aMetacelloVersion
]

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloCleanNotification>>signal: aMetacelloVersion [

	self version: aMetacelloVersion.
	^ self signal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloCleanNotification>>version [
	^ version
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloCleanNotification>>version: anObject [
	version := anObject
]
