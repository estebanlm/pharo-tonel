"
A GLMLoggedObject is a custom announcer that logs all events that it announces.

Instance Variables
	logger:		<Object>

logger
	- xxxxx

"
Class {
	#name : #GLMLoggedObject,
	#superclass : #GLMAnnouncer,
	#instVars : [
		'logger'
	],
	#classInstVars : [
		'logger'
	],
	#category : #Glamour-Core,
	#timestamp : 'AndreiChis 3/12/2015 00:01'
}

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMLoggedObject class>>initialize  [
	logger := GLMLogger instance
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMLoggedObject class>>logger [
	^ logger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMLoggedObject class>>logger: aLogger [
	logger := aLogger
]

{
	#category : #announce,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMLoggedObject>>announce: anAnnouncement [
	self logger logAnnouncement: anAnnouncement from: self. 
	super announce: anAnnouncement
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMLoggedObject>>initialize  [
	super initialize.
	logger := GLMLogger instance 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMLoggedObject>>logger [
	^ logger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMLoggedObject>>logger: anObject [
	logger := anObject
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMLoggedObject>>postCopy  [
	super postCopy.
	self resetAnnouncer
]
