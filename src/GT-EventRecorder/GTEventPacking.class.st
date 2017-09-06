"
I represent an abstract packing system that is able to receive objects and pack them into a binary data (ByteArray).

Others can ask me for serializing an object by sending me #pack: or for materializing a ByteArray by sending me #unpack:. On the class side, you can find out #fuel and #ston methods, two available packing strategies. The method #version keeps current packing version and changelog. 

The main users are GTEventRecorder (for packing) and GTEventAnnouncement (for unpacking).

Public API and Key Messages

- pack:
- unpack:
- version

"
Class {
	#name : #GTEventPacking,
	#superclass : #Object,
	#category : #GT-EventRecorder-Support,
	#timestamp : 'JurajKubelka 10/13/2015 23:00'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventPacking class>>all [
	^ {self ston. self fuel}
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventPacking class>>default [
	^ self ston
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventPacking class>>fuel [
	^ GTFuelPacking new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventPacking class>>ston [
	^ GTStonPacking new
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventPacking>>materialize: aByteArray [
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventPacking>>migrations: anObject  [
	"Ignore by default. Subclasses can overwrite it."
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventPacking>>newAnnouncement [
	^ GTEventAnnouncement new
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventPacking>>newAnnouncementFor: aGTEventCollector [
	| announcement |
	announcement := self 
		updateAnnouncement: self newAnnouncement 
		for: aGTEventCollector.
	aGTEventCollector updateAnnouncement: announcement.
	^ announcement
]

{
	#category : #packing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventPacking>>pack: aGTEventCollector [
	^ GTEventBundle new
			url: aGTEventCollector url;
			category: aGTEventCollector category;
			data: (self packCollector: aGTEventCollector);
			yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventPacking>>packCollector: aGTEventCollector [
	^ self serialize: (self newAnnouncementFor: aGTEventCollector)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventPacking>>serialize: anObject [
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventPacking>>technologyName [
	"It returns a string that identify packing technology."
	^ self subclassResponsibility
]

{
	#category : #packing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventPacking>>unpack: aByteArray [
	^ self materialize: aByteArray
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventPacking>>updateAnnouncement: aGTEventAnnouncement for: aGTEventCollector [
	^ aGTEventAnnouncement
			data: (self serialize: aGTEventCollector bundle);
			category: aGTEventCollector category;
			serializedBy: self class name;
			eventRecorderVersion: self version;
			timestamp: DateAndTime now;
			imageHash: SmalltalkImage current imagePath hash;
			imageVersion: SystemVersion current version;
			latestUpdate: SystemVersion current highestUpdate;
			computerUUID: GlobalIdentifier uniqueInstance computerUUID asString;
			sessionUUID: SmalltalkImage current session id asString;
			sessionCreationTime: SmalltalkImage current session creationTime;
			yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventPacking>>version [
	^ 4
	
"
Changes to version 4:
	- It introduces GTEventMultiBundle object that is used for sending several GTEVentBundle objects to the same server in one HTTP request
	- GTStonPacking returns ByteArray instead of ByteString
Changes to version 3:
	- GTSpotterEventRecorder rewritten to GTEventRecorder.
	- It uses STON instead of FUEL serializing engine.
		- FUEL engine is still available using GTFuelPacking object
Changes to version 2 (FUEL):
	- GTSpotterEventRecorder>>timestamp keeps DateAndTime object. 
	  Before, it was an integer as unix time.
"
]
