"
An InputEventHandler is the abstract superclass for all input event handlers.
Subclasses need to implement handleEvent:.

Instance Variables
	eventFetcher:		<InputEventFetcher>

eventFetcher
	- the event fetcher I'm registered with and receiving my events from.

"
Class {
	#name : #InputEventHandler,
	#superclass : #Object,
	#instVars : [
		'eventFetcher'
	],
	#pools : [
		'EventSensorConstants'
	],
	#category : #System-VMEvents,
	#timestamp : 'michael.rueger 4/22/2009 11:56'
}

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventHandler>>flushEvents [

]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventHandler>>handleEvent: eventBuffer [
	self subclassResponsibility
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventHandler>>isKbdEvent: bufEvt [
	^ bufEvt first = EventTypeKeyboard and: [ bufEvt fourth = EventKeyChar ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventHandler>>registerIn: anEventFetcher [
	eventFetcher := anEventFetcher.
	eventFetcher registerHandler: self
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventHandler>>unregister [
	eventFetcher ifNotNil: [
			eventFetcher unregisterHandler: self.
			eventFetcher := nil. ]
]
