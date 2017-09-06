"
I am a basic class of OSEvent hierarchy.
The specific events are coming from operating system and converted to corresponding OSEvent subinstance(s) in order to handle them.

Events can implement a default action, which will be performed after dispatch on event handling,
unless they are suppressed using #suppressDefaultAction message.
"
Class {
	#name : #OSEvent,
	#superclass : #Object,
	#instVars : [
		'window',
		'suppressDefaultAction'
	],
	#category : #OSWindow-Core-Events,
	#timestamp : 'IgorStasenko 7/30/2014 17:13'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSEvent class>>for: aWindow [
	^ self new window: aWindow; yourself
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSEvent>>accept: aVisitor [
	self subclassResponsibility 
]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSEvent>>defaultAction [
	"do nothing by default"
]

{
	#category : #dispatching,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSEvent>>deliver [
	"deliver an event to its handler(s)"
	
	^ window deliverEvent: self
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSEvent>>initialize [
	suppressDefaultAction := false
]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSEvent>>performDefaultAction [
	suppressDefaultAction ifFalse: [  self defaultAction ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSEvent>>printOn: aStream [
	super printOn: aStream. 
	window ifNotNil: [ aStream << ' (WindowId=' << window windowId printString << ')' ]

]

{
	#category : #'default actions',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSEvent>>suppressDefaultAction  [
	suppressDefaultAction  := true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSEvent>>window [
	^ window
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSEvent>>window: anOSWindow  [
	window := anOSWindow
]
