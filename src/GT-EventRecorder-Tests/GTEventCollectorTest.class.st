"
A GTEventCollectorTest is a test class for testing the behavior of GTEventCollector
"
Class {
	#name : #GTEventCollectorTest,
	#superclass : #TestCase,
	#instVars : [
		'collector'
	],
	#category : #GT-EventRecorder-Tests-Core,
	#timestamp : '<historical>'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventCollectorTest>>setUp [
	super setUp.
	collector := GTEventCollector new
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventCollectorTest>>testBundle [
	self assert: collector bundle isEmpty
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventCollectorTest>>testBundle2 [
	collector add: GTDummyEvent new.
	collector add: GTDummyEvent new.
	self assert: collector bundle size equals: 2.
	self assert: collector bundle isEmpty.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventCollectorTest>>testCategory [
	self assert: collector category equals: collector defaultCategory
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventCollectorTest>>testIsLiberated [
	"By default it is liberated."
	self assert: collector isLiberated
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventCollectorTest>>testIsLiberated2 [
	"The collection of events has to be empty."
	collector add: 42.
	self deny: collector isLiberated.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventCollectorTest>>testIsLiberated3 [
	"The occupant has to be empty."
	collector occupant: self.
	self deny: collector isLiberated.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventCollectorTest>>testLiberate [
	collector liberate.
	self assert: collector isLiberated
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventCollectorTest>>testLiberate2 [
	collector occupant: self.
	self deny: collector isLiberated.
	collector liberate.
	self assert: collector isLiberated
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventCollectorTest>>testPrintOn [
	self assert: (String streamContents: [ :stream | collector printOn: stream ]) notEmpty.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventCollectorTest>>testUpdateAnnouncement [
	| announcement announcement2 |
	collector updateAnnouncementBlock: [ :anAnnouncement | 
		anAnnouncement at: #testUpdateAnnouncement put: 42 ].
	announcement := GTEventAnnouncement new.
	self assert: (announcement at: #testUpdateAnnouncement) isNil.
	announcement2 := collector updateAnnouncement: announcement.
	self assert: announcement == announcement2.
	self assert: (announcement at: #testUpdateAnnouncement) equals: 42.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventCollectorTest>>testUrl [
	self assert: collector url notNil.
	self assert: collector url equals: GTEventRecorderSettings url.
]
