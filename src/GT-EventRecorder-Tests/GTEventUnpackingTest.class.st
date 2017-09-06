"
A GTEventUnpackingTest is a test class for testing the behavior of GTEventUnpacking
"
Class {
	#name : #GTEventUnpackingTest,
	#superclass : #TestCase,
	#instVars : [
		'unpacking',
		'collector',
		'unpackedData',
		'initialData',
		'bundle'
	],
	#category : #GT-EventRecorder-Tests-Support,
	#timestamp : '<historical>'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventUnpackingTest>>setUp [
	super setUp.
	initialData := #('GT' 'Team' 2015).
	collector := GTEventCollector new.
	initialData do: [ :each | collector add: each ].
	unpacking := GTEventUnpacking default.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventUnpackingTest>>testUnpack [
	bundle := GTEventPacking default pack: collector.
	unpackedData := unpacking unpack: bundle data.
	self assert: unpackedData class equals: GTEventAnnouncement.
	self assert: unpackedData unpackedData asArray equals: initialData.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventUnpackingTest>>testUnpack2 [
	self should: [ unpacking unpack: initialData ] raise: GTEventUnpackingError
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventUnpackingTest>>testUnpack3 [
	bundle := GTEventPacking default pack: collector.
	unpacking := GTEventUnpacking new.
	self should: [ unpacking unpack: bundle data ] raise: GTEventInitializationError
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventUnpackingTest>>testUnpack4 [
	bundle := GTEventPacking ston pack: collector.
	unpacking := GTEventUnpacking new.
	unpacking addPacking: GTEventPacking fuel.
	self should: [ unpacking unpack: bundle data ] raise: GTEventUnpackingError 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventUnpackingTest>>testUnpack5 [
	bundle := GTEventPacking fuel pack: collector.
	unpacking := GTEventUnpacking new.
	unpacking addPacking: GTEventPacking ston.
	self should: [ unpacking unpack: bundle data ] raise: GTEventUnpackingError 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventUnpackingTest>>testUnpackFuel [
	bundle := GTEventPacking fuel pack: collector.
	unpackedData := unpacking unpack: bundle data.
	self assert: unpackedData class equals: GTEventAnnouncement.
	self assert: unpackedData unpackedData asArray equals: initialData.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventUnpackingTest>>testUnpackSton [
	bundle := GTEventPacking ston pack: collector.
	unpackedData := unpacking unpack: bundle data.
	self assert: unpackedData class equals: GTEventAnnouncement.
	self assert: unpackedData unpackedData asArray equals: initialData.
]
