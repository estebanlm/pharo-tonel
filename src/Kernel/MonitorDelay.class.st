"
This is a specialization of the class Delay that is used for the implementation of the class Monitor.
"
Class {
	#name : #MonitorDelay,
	#superclass : #Delay,
	#instVars : [
		'monitor',
		'queue'
	],
	#category : #Kernel-Processes,
	#timestamp : 'NS 4/13/2004 16:51'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
MonitorDelay class>>signalLock: aSemaphore afterMSecs: anInteger inMonitor: aMonitor queue: anOrderedCollection [
	anInteger < 0 ifTrue: [self error: 'delay times cannot be negative'].
	^ (self new setDelay: anInteger forSemaphore: aSemaphore monitor: aMonitor queue: anOrderedCollection) schedule; yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
MonitorDelay>>schedulerSignalWaitingProcess [
	"The delay time has elapsed; signal the waiting process."

	beingWaitedOn := false.
	monitor signalLock: delaySemaphore inQueue: queue.

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
MonitorDelay>>setDelay: anInteger forSemaphore: aSemaphore monitor: aMonitor queue: anOrderedCollection [
	monitor := aMonitor.
	queue := anOrderedCollection.
	self setDelay: anInteger forSemaphore: aSemaphore.
]
