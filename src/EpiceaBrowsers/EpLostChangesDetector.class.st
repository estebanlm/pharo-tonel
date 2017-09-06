"
I check on image startup that there is lost logs for current image and I open browser on it to show changes to user.
I super usefull for recovering lost changes after image crash
"
Class {
	#name : #EpLostChangesDetector,
	#superclass : #Object,
	#instVars : [
		'hasLostChanges',
		'lastSessionFileStore'
	],
	#classInstVars : [
		'enabled'
	],
	#category : #EpiceaBrowsers-Integration,
	#timestamp : 'DenisKudryashov 5/27/2016 17:17'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLostChangesDetector class>>enabled: aBoolean [

	enabled := aBoolean
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLostChangesDetector class>>initialize [
	"
	self initialize
	"
	SessionManager default registerToolClassNamed: self name

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLostChangesDetector class>>isEnabled [

	^ enabled ifNil: [ enabled := true ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLostChangesDetector class>>new [

	^ self newWithLog: EpMonitor current log
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLostChangesDetector class>>newWithLog: aLog [

	^ self basicNew
		initializeWithLog: aLog;
		yourself
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLostChangesDetector class>>startUp: isImageStarting [

	| detector |
	(isImageStarting and: [ 
		self isEnabled and: [ "Detector can be disabled via system settings"
		EpMonitor current isEnabled	and: [ "Nothing to recover if wasn't recording"
		Smalltalk isHeadless not ]]])  "Can't browse if UI disabled"
			ifFalse: [ ^ self ].

	detector := self new.
	
	SessionManager default addDeferredStartupAction: [
		(detector hasLostChanges and: [ self confirm: 'It seems your last Pharo session exited without saving some code. Do you want to recover it?' ])
			ifTrue: [ detector openBrowserIfLostChanges ] ]

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLostChangesDetector>>hasLostChanges [
	
	^ hasLostChanges
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLostChangesDetector>>initializeWithLog: aLog [

	self initialize.
	
	lastSessionFileStore := aLog store lowLevelFileStoreIfNone: [ nil ]. "Never nil?"
	hasLostChanges :=
		lastSessionFileStore
			ifNil: [ false ]
			ifNotNil: [ lastSessionFileStore isOutdated ].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLostChangesDetector>>lostChanges [

	| freshLog lastSessionHeadReference entries |
	self hasLostChanges ifFalse: [ ^ #() ]. "Start by fastest available check: file size"
	lastSessionHeadReference := lastSessionFileStore headReference.
	lastSessionFileStore refresh.
	freshLog := EpLog newWithStore: lastSessionFileStore.
	freshLog headReference = lastSessionHeadReference ifTrue: [ ^ #() ]. "Just no lost events"

	"Then, there are lost events"
	entries := freshLog priorEntriesFrom: freshLog headReference upTo: lastSessionHeadReference.

	^ entries ifNotEmpty: [ entries allButLast "reject lastSessionHeadReference's change"]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLostChangesDetector>>openBrowserIfLostChanges [

	| lostChanges lostChangesLog browser |
	lostChanges := self lostChanges collect: #content.
	lostChanges ifEmpty: [ ^ self ].
	lostChangesLog := EpLog newWithStore: (OmMemoryStore withAll: lostChanges).

	browser := EpLogBrowserModel newWithLog: lostChangesLog.
	browser
		refresh;
		title: 'Epicea - Lost Changes Detected';
		openWithSpec.

]
