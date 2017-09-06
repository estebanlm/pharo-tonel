"
A GTEventPackingTest is a test class for testing the behavior of GTEventPacking
"
Class {
	#name : #GTEventPackingTest,
	#superclass : #TestCase,
	#instVars : [
		'packing',
		'event1',
		'event2',
		'collector',
		'bundle',
		'announcement',
		'unpackedData',
		'storage',
		'file'
	],
	#category : #GT-EventRecorder-Tests-Support,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventPackingTest class>>isAbstract [
	^ self name = GTEventPackingTest name
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventPackingTest>>assertBundle [
	bundle := packing pack: collector.
	self assert: bundle url equals: collector url.
	self assert: bundle data isLiteral.
	self assert: bundle category equals: collector category.
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventPackingTest>>assertUnpackedData [
	unpackedData := announcement unpackedData.
	self assert: unpackedData size equals: 2.
	self assert: unpackedData first equals: event1.
	self assert: unpackedData second equals: event2
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventPackingTest>>packingClass [
	^ self subclassResponsibility
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventPackingTest>>setUp [
	super setUp.
	event1 := GTDummyEvent new data: 'string'.
	event2 := GTDummyEvent new data: 42.
	collector := GTEventCollector new.
	collector add: event1; add: event2.
	collector category: #category1.
	packing := self packingClass new.
	storage := FileSystem memory.
	file := storage workingDirectory / 'data'.

]

{
	#category : #tests-packing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventPackingTest>>testNewAnnouncementFor [
	announcement := packing newAnnouncementFor: collector.
	self assert: announcement serializedBy equals: packing class name.
	self assert: announcement eventRecorderVersion equals: packing version.
	self assert: announcement category equals: collector category.
]

{
	#category : #tests-packing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventPackingTest>>testNewAnnouncementFor2 [
	collector updateAnnouncementBlock: [ :anAnnouncement | 
		anAnnouncement at: #testNewAnnouncementFor2 put: 42 ].
	announcement := packing newAnnouncementFor: collector.
	self assert: announcement serializedBy equals: packing class name.
	self assert: announcement eventRecorderVersion equals: packing version.
	self assert: (announcement at: #testNewAnnouncementFor2) equals: 42.
]

{
	#category : #tests-packing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventPackingTest>>testPack [
	self assertBundle.
	announcement := packing unpack: bundle data.
	self assertUnpackedData
]

{
	#category : #tests-packing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventPackingTest>>testUnpackBinaryBinaryStream [
	self assertBundle.
	file writeStreamDo: [ :aStream | 
		aStream binary.
		aStream nextPutAll: bundle data ].
	file binaryReadStreamDo: [ :aStream | 
		announcement := packing unpack: aStream contents ].
	self assertUnpackedData.

]

{
	#category : #tests-packing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventPackingTest>>testUnpackBinaryUnspecifiedStream [
	self assertBundle.
	file writeStreamDo: [ :aStream | 
		aStream binary.
		aStream nextPutAll: bundle data ].
	announcement := packing unpack: file contents.
	self assertUnpackedData.
]

{
	#category : #tests-packing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventPackingTest>>testUnpackUnspecifiedBinaryStream [
	self assertBundle.
	file writeStreamDo: [ :aStream | 
		aStream nextPutAll: bundle data ].
	file binaryReadStreamDo: [ :aStream | 
		announcement := packing unpack: aStream contents ].
	self assertUnpackedData.

]

{
	#category : #tests-packing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventPackingTest>>testUnpackUnspecifiedUnspecifiedStream [
	self assertBundle.
	file writeStreamDo: [ :aStream | 
		aStream nextPutAll: bundle data ].
	announcement := packing unpack: file contents.
	self assertUnpackedData.
]
