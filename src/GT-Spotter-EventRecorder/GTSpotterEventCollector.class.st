"
I represent a GTEventCollector for GTSpotter application.
I am a bit spetial because I send only closed sessions. It means, bundle always end with closing event. The rest of the events are postponed for the next delivery cycle.
"
Class {
	#name : #GTSpotterEventCollector,
	#superclass : #GTEventCollector,
	#instVars : [
		'postponedEvents'
	],
	#category : #GT-Spotter-EventRecorder-Base,
	#timestamp : 'JurajKubelka 11/15/2015 18:42'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterEventCollector>>bundle [
	^ self postpone: (self bundle: (postponedEvents ifNil: [ OrderedCollection new ]))
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterEventCollector>>defaultCategory [
	^ #spotter
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterEventCollector>>linkToSpotter: aSpotterModel [
	aSpotterModel announcer when: Announcement send: #recordAnnouncement: to: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterEventCollector>>postpone: aCollectionOfEvents [
	| lastExitIndex |
	lastExitIndex := aCollectionOfEvents findLast: [ :each | each isCloseSpotter ].
	lastExitIndex = aCollectionOfEvents size ifTrue: [ 
		postponedEvents := nil.
		^ aCollectionOfEvents ].
	postponedEvents := aCollectionOfEvents copyFrom: lastExitIndex + 1 to: aCollectionOfEvents size.
	^ aCollectionOfEvents first: lastExitIndex.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterEventCollector>>postponedEvents [
	"For testing/debugging purpose."
	^ postponedEvents
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterEventCollector>>recordAnnouncement: anAnnouncement [
	Privacy sendDiagnosticsAndUsageData ifFalse: [ ^ self ].	
	(anAnnouncement respondsTo: #asRecorderEvent) ifTrue: [	
		self add: anAnnouncement asRecorderEvent ]

]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterEventCollector>>recordSpotterOpenEvent [
	Privacy sendDiagnosticsAndUsageData ifFalse: [ ^ self ].	
	self add: GTSpotterRecorderOpenEvent new
]
