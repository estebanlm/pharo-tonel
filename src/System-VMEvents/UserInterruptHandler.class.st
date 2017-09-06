"
An UserInterruptHandler watches incoming input events and checks for the user interrupt key.
If encountered it interrupts the current process and opens a notifier..

Instance Variables
	interruptKey:		<Object>

interruptKey
	- definition of the user interrupt key

"
Class {
	#name : #UserInterruptHandler,
	#superclass : #InputEventHandler,
	#instVars : [
		'interruptKey'
	],
	#classVars : [
		'CmdDotEnabled'
	],
	#pools : [
		'EventSensorConstants'
	],
	#category : #System-VMEvents,
	#timestamp : 'michael.rueger 4/22/2009 12:01'
}

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:10'
}
UserInterruptHandler class>>cmdDotEnabled  [
	^ CmdDotEnabled ifNil: [CmdDotEnabled := true]
]

{
	#category : #setting,
	#timestamp : ' 8/31/2017 05:26:10'
}
UserInterruptHandler class>>cmdDotEnabled: aBoolean [
	CmdDotEnabled := aBoolean
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:10'
}
UserInterruptHandler class>>new [
	^ super new setInterruptKeyValue: $. asciiValue
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:10'
}
UserInterruptHandler>>handleEvent: evt [
	"Interrupt event... evt is shared, so make a copy of it."

	| buf |
	buf := evt shallowCopy.
	(self isKbdEvent: evt)
		ifTrue: [ 
			| keycode modifiers |
			"Check if the event is a user interrupt"
			keycode := buf sixth.
			modifiers := buf fifth.
			(keycode = interruptKey and: [ modifiers anyMask: 16r0E ])
				ifTrue: [ 
					Display deferUpdates: false.
					(Smalltalk hasClassNamed: #SoundService)
						ifTrue: [ (Smalltalk classNamed: #SoundService) default shutDown ].
					self handleUserInterrupt ].
			^ self ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
UserInterruptHandler>>handleUserInterrupt [
	"This will be called from the event-fetcher process. 
	Assume no system-vital processes have a lower priority than this, and are thus ok to interrupt"
	UserInterruptHandler cmdDotEnabled ifFalse: [ ^ self ]. 

	[
		self processToInterrupt
			ifNotNil: [ :proc | proc debugWithTitle: 'User Interrupt' ]
			ifNil: [ UIManager default inform: 'Process not interruptable' ]
	
	"fork exceptions, we don't want interrupt handler to die"
	] on: Error fork: [:ex | ex pass].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
UserInterruptHandler>>processToInterrupt  [
	"Look for best candidate to interrupt: 
		- any scheduled non-finalization process of lower priority 
		- the weak-finalization process, if scheduled 
		- the UI process 
	Never interrupt the idle process, since killing it is fatal" 

	| fallback | 
	fallback := UIManager default uiProcess. 
	Processor 
		scanSchedule: [:p | 
		 "suspendedContext sender == nil usually means that process is only scheduled but had no chance to run" 
			(p ~~ Processor backgroundProcess and: [p suspendedContext sender notNil]) ifTrue: [
				p ~~  WeakArray runningFinalizationProcess 
					ifTrue: [^p] 
					ifFalse: [fallback := p]]]
		startingAt: Processor activePriority. 
	^fallback
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:10'
}
UserInterruptHandler>>setInterruptKeyValue: anInt [
	interruptKey := anInt

]
