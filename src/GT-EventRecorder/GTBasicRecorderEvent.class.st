"
I represent a basic event for the event recorder.
"
Class {
	#name : #GTBasicRecorderEvent,
	#superclass : #Object,
	#instVars : [
		'info',
		'timestamp'
	],
	#category : #GT-EventRecorder-Core,
	#timestamp : 'RogerStebler 6/30/2016 15:24'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>= otherEvent [

	^ self class == otherEvent class
	and: [ (self info = otherEvent info)
	and: [ self timestamp = otherEvent timestamp ] ].
]

{
	#category : #'accessing - announcement info',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>announcementTimestamp [
	^ self infoAt: #timestamp ifAbsent: [ self timestamp ]
]

{
	#category : #'accessing - announcement info',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>computerUUID [
	^ self infoAt: #computerUUID ifAbsent: [ GlobalIdentifier uniqueInstance computerUUID asString ]
]

{
	#category : #'accessing - announcement info',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>eventRecorderVersion [
	^ self infoAt: #eventRecorderVersion ifAbsent: [ GTEventPacking new version ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>hash [
	^ self info hash bitXor: self timestamp hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>hashForText: aString [
	^ self settings obfuscateIfNecessary: aString
]

{
	#category : #'accessing - announcement info',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>imageHash [
	^ self infoAt: #imageHash ifAbsent: [ SmalltalkImage current imagePath hash ]
]

{
	#category : #'accessing - announcement info',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>imageVersion [
	^ self infoAt: #imageVersion ifAbsent: [ SystemVersion current version ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>info [
	^ info ifNil: [ info := Dictionary new ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>infoAt: aSymbol [
	^ info at: aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>infoAt: key ifAbsent: absentBlock [
	info ifNil: [ ^ absentBlock value].
	^ info at: key ifAbsent: absentBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>infoAt: key ifAbsentPut: putBlock [
	info ifNil: [ info := Dictionary new ].
	^ info at: key ifAbsentPut: putBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>infoAt: key ifPresent: presentBlock ifAbsent: absentBlock [
	info ifNil: [ ^ absentBlock value].
	^ info at: key ifPresent: presentBlock ifAbsent: absentBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>infoAt: key put: value [
	info ifNil: [ info := Dictionary new ].
	^ info at: key put: value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>infoAt: key putHashForText: valueString  [
	^ self 
		infoAt: key 
		put: (self hashForText: valueString)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>initialize [
	super initialize.
	timestamp := DateAndTime now.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>initializeObfuscated [
	self obfuscated: Privacy sendEntityNames not.
]

{
	#category : #'accessing - announcement info',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>latestUpdate [
	^ self infoAt: #latestUpdate ifAbsent: [ SystemVersion current highestUpdate ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>obfuscated [
	^ self infoAt: #obfuscated ifAbsent: true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>obfuscated: aBoolean [
	^ self infoAt: #obfuscated put: aBoolean
]

{
	#category : #'accessing - announcement info',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>sessionCreationTime [
	^ self infoAt: #sessionCreationTime ifAbsent: [ SmalltalkImage current session creationTime ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>settings [
	^ GlobalIdentifier uniqueInstance
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBasicRecorderEvent>>timestamp [
	^ timestamp
]
