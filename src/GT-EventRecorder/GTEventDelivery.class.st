"
I know how to deliver usage and diagnostic data to a remote server.

I start and maintain a process for sending data on a regular inteval (#standardDuration).
I maintain a queue with the data that needs to be send. If a delivert fails I re-add the data to the queue.

Data that is added to my queue must be packaged in an object of type GTEventBundle.  I use the url specified by the bundle.
I send the recorder the message #pack to notify it that I enter the delivery cycle.

Public API and Key Messages

- #activate initializes the delivery process; clients must call this method; it's not called automatically on object creation. 
- #deliveryCycle implements  the main logic of the delivery process
"
Class {
	#name : #GTEventDelivery,
	#superclass : #Object,
	#instVars : [
		'mutex',
		'process',
		'delay',
		'permission',
		'recorder',
		'queue',
		'preSuspendingAction'
	],
	#category : #GT-EventRecorder-Support,
	#timestamp : 'AndreiChis 10/13/2015 00:35'
}

{
	#category : #activation,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>activate [
	"Initialize a delivery process."
	^ mutex critical: [ 
			self offerPermission.
			self isInactive ifTrue: [ self initializeProcess ].
			process ]
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>add: aGTEventBundle [
	queue nextPut: aGTEventBundle
]

{
	#category : #announce,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>announceSuspendingDelivery [
	preSuspendingAction ifNotNil: #value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>announcer [
	^ self recorder ifNotNil: #announcer
]

{
	#category : #delivery,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>bundles [
	"Be careful about using this method. You will loose data if you call it externaly."
	| eventBundles |
	eventBundles := OrderedCollection new.
	queue flush: [ :eachGTEventBundle | eventBundles addLast: eachGTEventBundle ].
	^ eventBundles
]

{
	#category : #deactivation,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>deactivate [
	^ mutex critical: [ | oldProcess |
		self withdrawPermission.
		delay ifNotNil: [ :aDelay | aDelay delaySemaphore signal ].
		oldProcess := process.
		process := nil.
		oldProcess ]
]

{
	#category : #delivery,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>deliver: aBoolean [
	| bundles |
	bundles := GTEventMultiBundleFactory fromBundles: self bundles.
	bundles do: [ :eachGTEventMultiBundle |
		self deliver: eachGTEventMultiBundle signalProgress: aBoolean ]
]

{
	#category : #delivery,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>deliver: aGTEventMultiBundle signalProgress: aBoolean [
	^ (ZnClient new
			beOneShot;
			timeout: 5;
			signalProgress: aBoolean;
			numberOfRetries: 0;
			url: aGTEventMultiBundle url;
			enforceHttpSuccess: true;
			ifFail: [ :exception | queue nextPut: aGTEventMultiBundle ];
			entity: aGTEventMultiBundle entity;
			put;
			response)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>deliveryCycle [
	delay := self standardDuration asDelay.
	self announceSuspendingDelivery.
	delay wait.
	delay := nil.
	self hasPermission ifTrue: [ self packAndDeliver: false ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>hasPermission [
	^ permission
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>initialize [
	super initialize.
	mutex := Mutex new.
	queue := WaitfreeQueue new.
	permission := true.
	preSuspendingAction := nil.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>initializeProcess [
	process := [ [ self hasPermission ] whileTrue: [ self deliveryCycle ] ]
		forkAt: Processor userBackgroundPriority
		named: self printProcessName
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>isActive [
	^ self isInactive not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>isGlobalRecorder [
	^ self recorder 
			ifNil: false
			ifNotNil: #isGlobalRecorder
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>isInactive [
	^ mutex critical: [ 
		process isNil or: [
			process isTerminated or: [
				process isTerminating ] ] ]
]

{
	#category : #delivery,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>now [
	"for testing purpose"
	delay ifNotNil: [ :aDelay | aDelay delaySemaphore signal. aDelay unschedule. ]
]

{
	#category : #activation,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>offerPermission [
	mutex critical: [ permission := true ]
]

{
	#category : #delivery,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>packAndDeliver: aBoolean. [
	recorder pack.
	self deliver: aBoolean.
	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>preSuspendingAction: aBlockClosure  [
	preSuspendingAction := aBlockClosure
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>printOn: aStream [
	super printOn: aStream.
	aStream
		space;
		nextPut: $[;
		print: queue size;
		space;
		nextPutAll: ('item' asPluralBasedOn: queue size).
	self isActive
		ifTrue: [ 
			delay 
				ifNil: [ aStream nextPutAll: 'process active, but delay is nil!' ]
				ifNotNil: [ :aDelay |
					aStream
						nextPutAll: ', next cycle in ';
						print: (aDelay millisecondsToGo milliSeconds roundTo: 1 second);
						nextPutAll: ' sec' ] ]
		ifFalse: [ 
			aStream nextPutAll: ', inactive' ].
	aStream		
		nextPut: $]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>printProcessName [
	^ String streamContents: [ :aStream |
		self printProcessNameOn: aStream ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>printProcessNameOn: aStream [
	aStream
		nextPutAll: self className.
	self isGlobalRecorder
		ifTrue: [ aStream nextPutAll: ' global ' ]
		ifFalse: [ aStream nextPutAll: ' a ' ].
	aStream nextPutAll: 'delivery process'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>recorder [
	^ recorder
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>recorder: anObject [
	recorder := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>size [
	^ queue size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>standardDuration [
	^ 20 minutes
]

{
	#category : #deactivation,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventDelivery>>withdrawPermission [
	mutex critical: [ permission := false ]
]
