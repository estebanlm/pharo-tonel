"

"
Class {
	#name : #EpLogTest,
	#superclass : #TestCase,
	#instVars : [
		'log',
		'logBuilder'
	],
	#category : #EpiceaTests-Log,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpLogTest>>setUp [
	super setUp.
	
	logBuilder := EpTestLogBuilder new.
	log := logBuilder oneTriggerWithFourChildrenLog.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpLogTest>>tearDown [
	super tearDown.
	
	logBuilder cleanUp.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpLogTest>>testEntries [
	self assert: log entries size equals: 5
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpLogTest>>testEntriesCount [
	self assert: log entriesCount equals: 5
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpLogTest>>testEntryReferences [

	| entryReferences |
	entryReferences := log entryReferences.
	
	entryReferences do: [:each |
		log
			entryFor: each
			ifPresent: [:entry | "ok" ]
			ifAbsent: [ self fail ] ].

	self assert: entryReferences size equals: 5.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpLogTest>>testFirstEntryIfAbsent [
	self 
		assert: (log firstEntryIfAbsent: [ self fail ]) 
		equals: log entries first
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpLogTest>>testFromDetect [
	| reference isPrior entry |
	reference := log priorReferenceAt: log head.
	entry := log entryFor: reference.
	isPrior := false.
	" Assert for entry "
	self
		assert: (log from: reference detect: [ :dummy | true ])
		equals: entry.
	" Assert for the entry before 'entry' "
	self
		assert: (log
			from: reference
			detect: [ :dummy |
				isPrior
					ifFalse: [ isPrior := true. false ]
					ifTrue: [ true ] ])
		equals: (log entryFor: (log priorReferenceAt: entry)).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpLogTest>>testFromDetectIfNotFound [
	| reference |
	reference := log priorReferenceAt: log head.
	" Assert for getting 42 when entry is not found. "
	self
		assert: (log
			from: reference
			detect: [ :dummy | false ]
			ifNotFound: [ 42 ])
		equals: 42.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpLogTest>>testFromHeadDetect [

	" Assert for head "
	self
		assert: (log fromHeadDetect: [ :dummy | true ])
		equals: log head.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpLogTest>>testFromHeadDetectIfNotFound [

	" Assert for getting 42 when entry is not found. "
	self
		assert: (log
			fromHeadDetect: [ :dummy | false ]
			ifNotFound: [ 42 ])
		equals: 42.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpLogTest>>testFromNullReferenceDetectNotFound [

	self
		should: [ log from: log nullReference detect: [ :entry | true ] ]
		raise: KeyNotFound
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpLogTest>>testHeadReference [
	self deny: log headReference isNull
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpLogTest>>testPriorEntriesFromNullReferenceIsEmpty [
	| priorEntries |
	priorEntries := log priorEntriesFrom: log nullReference.
	self assert: priorEntries isEmpty
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpLogTest>>testShouldKeepHeadReferenceAfterReOpen [
	| anotherLog |

	anotherLog := EpLog newWithStore: log store copy refresh.

	self assert: anotherLog headReference equals: log headReference.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
EpLogTest>>testShouldKeepHeadReferenceAfterRefresh [
	| headReference |
	headReference := log headReference.

	log refresh.

	self assert: log headReference equals: headReference.
]
