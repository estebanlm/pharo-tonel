"
I am using semaphore to signal/wait for new items available in queue

I am introducing extra protocol - #next,
which blocks the sender until it can successfully fetch next item from queue.

"
Class {
	#name : #AtomicSharedQueue,
	#superclass : #WaitfreeQueue,
	#instVars : [
		'availSema'
	],
	#category : #Collections-Atomic,
	#timestamp : 'IgorStasenko 2/28/2011 15:33'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicSharedQueue>>initialize [
	super initialize.
	availSema := Semaphore new.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicSharedQueue>>next [
	"Fetch the next item from queue. If queue is locked or empty, block the sender until operation can complete"
	 
	| result |
	
	[ | keepWaiting | 
		keepWaiting := false. 
		result := self nextIfNone: [ keepWaiting := true ]. 
		keepWaiting ] whileTrue: [ self waitForNewItems ].

	^ result
]

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicSharedQueue>>signalAddedNewItem [
	availSema signal
]

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicSharedQueue>>signalNoMoreItems [
	"queue is empty, reset sema signals"
	availSema consumeAllSignals 
]

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 07:16:43'
}
AtomicSharedQueue>>waitForNewItems [
	availSema wait
]
