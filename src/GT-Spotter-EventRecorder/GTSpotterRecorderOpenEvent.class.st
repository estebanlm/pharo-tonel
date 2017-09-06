"
A GTSpotterRecorderOpenEvent  models the action of  opening Spotter.

Instance Variables
	timestamp:		<Object>

timestamp
	- xxxxx

"
Class {
	#name : #GTSpotterRecorderOpenEvent,
	#superclass : #GTSpotterRecorderEvent,
	#category : #GT-Spotter-EventRecorder-Events,
	#timestamp : 'AndreiChis 2/27/2015 14:38'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderOpenEvent>>accept: aVisitor [
	^ aVisitor visitOpenEvent: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderOpenEvent>>initialize [
	super initialize.
	self initializeObfuscated.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderOpenEvent>>isOpenSpotter [
	^ true
]
