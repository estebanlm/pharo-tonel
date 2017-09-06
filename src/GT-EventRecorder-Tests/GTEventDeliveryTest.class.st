"
A GTEventDeliveryTest is a test class for testing the behavior of GTEventDelivery
"
Class {
	#name : #GTEventDeliveryTest,
	#superclass : #TestCase,
	#instVars : [
		'delivery',
		'announcer',
		'semaphore'
	],
	#category : #GT-EventRecorder-Tests-Support,
	#timestamp : '<historical>'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventDeliveryTest>>assertSemaphore [
	self deny: (semaphore waitTimeoutMSecs: 200)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventDeliveryTest>>isGlobalRecorder [
	^ false
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventDeliveryTest>>setUp [
	super setUp.
	semaphore := Semaphore new.
	delivery := GTEventDelivery new
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventDeliveryTest>>tearDown [
	super tearDown.
	delivery deactivate.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventDeliveryTest>>testPrintOn [
	self assert: (String streamContents: [ :stream | delivery printOn: stream ]) notEmpty.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventDeliveryTest>>testPrintOn2 [
	| string |
	delivery recorder: self.
	delivery preSuspendingAction: [ semaphore signal ].
	delivery activate.	
	self assertSemaphore.
	200 milliSeconds wait.
	string := String streamContents: [ :stream | delivery printOn: stream ].
	self assert: string notEmpty.
	self assert: (string includesSubstring: 'next cycle in').
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventDeliveryTest>>testPrintProcessName [
	self assert: delivery printProcessName isNotEmpty
]
