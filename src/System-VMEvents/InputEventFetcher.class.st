"
EventFetcher is responsible for fetching the raw VM events and forward them to the registered event handlers. Event fetching is done in a high priority process, so even with other processes (e.g. the Morphic UI process) being busy events will still be fetched.

Instance Variables
	inputSemaphore:		<Semaphore>
	eventHandlers		<OrderedCollection>
	fetcherProcess		<Process>

inputSemaphore
	- a semaphore registered with the VM to signal availability of an event. Currently not supported on all platforms.

eventHandlers
	- registered event handlers. Event buffers are cloned before sent to each handler.

fetcherProcess
	- a process that fetches the events from the VM. Either polling (InputEventPollingFetcher) or waiting on the inputSemaphore.



Event format:
The current event format is very simple. Each event is recorded into an 8 element array. All events must provide some SmallInteger ID (the first field in the event buffer) and a time stamp (the second field in the event buffer), so that the difference between the time stamp of an event and the current time can be reported.

Currently, the following events are defined:

Null event
=============
The Null event is returned when the ST side asks for more events but no more events are available.
Structure:
[1]		- event type 0
[2-8]	- unused

Mouse event structure
==========================
Mouse events are generated when mouse input is detected.
Structure:
[1]	- event type 1
[2]	- time stamp
[3]	- mouse x position
[4]	- mouse y position
[5]	- button state; bitfield with the following entries:
		1	-	yellow (e.g., right) button
		2	-	blue (e.g., middle) button
		4	-	red (e.g., left) button
		[all other bits are currently undefined]
[6]	- modifier keys; bitfield with the following entries:
		1	-	shift key
		2	-	ctrl key
		4	-	(Mac specific) option key
		8	-	Cmd/Alt key
		[all other bits are currently undefined]
[7]	- reserved.
[8]	- reserved.

Keyboard events
====================
Keyboard events are generated when keyboard input is detected.
[1]	- event type 2
[2]	- time stamp
[3]	- character code
		For now the character code is in Mac Roman encoding.
[4]	- press state; integer with the following meaning
		0	-	character
		1	-	key press (down)
		2	- 	key release (up)
[5]	- modifier keys (same as in mouse events)
[6]	- reserved.
[7]	- reserved.
[8]	- reserved.

"
Class {
	#name : #InputEventFetcher,
	#superclass : #Object,
	#instVars : [
		'eventHandlers',
		'fetcherProcess',
		'inputSemaphore'
	],
	#classVars : [
		'Default'
	],
	#pools : [
		'EventSensorConstants'
	],
	#category : #System-VMEvents,
	#timestamp : 'michael.rueger 4/22/2009 11:59'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventFetcher class>>default [
	"InputEventFetcher default"

	^Default ifNil: [Default := InputEventFetcher new]
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventFetcher class>>deinstall [
	"InputEventFetcher deinstall"

	Default
		ifNotNil: [
			Default shutDown.
			SessionManager default unregisterClassNamed: Default class name.
			Default := nil].

	SessionManager default unregisterClassNamed: self name
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventFetcher class>>install [
	"InputEventFetcher install"
	Default := self new.
	Default startUp.

	SessionManager default
		registerSystemClassNamed: self name 
		atPriority: 40.

]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventFetcher class>>shutDown [
	"InputEventFetcher shutDown"
	
	self default shutDown
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventFetcher class>>startUp [
	"InputEventFetcher startUp"
	
	self default startUp
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventFetcher>>eventHandlers [
	^eventHandlers ifNil: [eventHandlers := OrderedCollection new]
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventFetcher>>eventLoop [
	"Fetch pending raw events from the VM.
	 This method is run at high priority."
	| eventBuffer |

	eventBuffer := Array new: 8.
	
	[true] whileTrue: [
		| type window |
		self waitForInput.

		[self primGetNextEvent: eventBuffer.
		type := eventBuffer at: 1.
		type = EventTypeNone]
			whileFalse: [
				"Patch up the window index in case we don't get one"
				window := eventBuffer at: 8.
				(window isNil
					or: [window isZero])
					ifTrue: [eventBuffer at: 8 put: 1].	
						
				self signalEvent: eventBuffer]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventFetcher>>fetcherProcess  [
	^ fetcherProcess 
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventFetcher>>installEventLoop [
	"Initialize the event loop process. Terminate the old process if any."
	"InputEventFetcher default installEventLoop"

	self terminateEventLoop.
	fetcherProcess := [self eventLoop] forkAt: Processor lowIOPriority.
	fetcherProcess name: 'Input Event Fetcher Process'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventFetcher>>primGetNextEvent: array [
	"Store the next OS event available into the provided array.
	Essential."
	<primitive: 94>
	 array at: 1 put: EventTypeNone.
     ^nil
	
]

{
	#category : #'private events',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventFetcher>>primInterruptSemaphore: aSemaphore  [
	"Primitive. Install the argument as the semaphore to be signalled whenever the user presses the interrupt key. The semaphore will be signaled once each time the interrupt key is pressed."

	<primitive: 134>
	^self primitiveFailed
"Note: This primitive was marked obsolete but is still used and actually quite useful. It could bre replace with a check in the event loop though, without a need for the now obsolete event tickler as event fetching isn't bound to the Morphic loop."
]

{
	#category : #'private events',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventFetcher>>primSetInputSemaphore: semaIndex [
	"Set the input semaphore the VM should use for asynchronously signaling the availability of events. Primitive. Optional."
	<primitive: 93>
	^nil
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventFetcher>>registerHandler: handler [
	self eventHandlers add: handler
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventFetcher>>shutDown [
	self terminateEventLoop.
	inputSemaphore ifNotNil: [Smalltalk unregisterExternalObject: inputSemaphore]
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventFetcher>>signalEvent: eventBuffer [
	"Signal the event buffer to all registered event handlers.
	Handlers need make sure to copy the buffer or extract the data otherwise, as the buffer will be reused."

	self eventHandlers do: [:handler |
		handler handleEvent: eventBuffer]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventFetcher>>startUp [
	inputSemaphore := Semaphore new.
	self primSetInputSemaphore: (Smalltalk registerExternalObject: inputSemaphore).
	inputSemaphore consumeAllSignals.
	self installEventLoop
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventFetcher>>terminateEventLoop [
	"Terminate the event loop process. Terminate the old process if any."
	"InputEventFetcher default terminateEventLoop"

	fetcherProcess ifNotNil: 
		[ fetcherProcess terminate.
		fetcherProcess := nil	]
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventFetcher>>unregisterHandler: handler [
	self eventHandlers remove: handler ifAbsent: []
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventFetcher>>waitForInput [
	inputSemaphore wait.
]
