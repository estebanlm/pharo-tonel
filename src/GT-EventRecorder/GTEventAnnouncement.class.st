"
I represent data that are sent to a server.

When GTEventPacking object asks for data to send, the data are packed and added to #data:, then there are other general information about the bundle, e.g. computer id. I keep all those information. I can also unpack the data using #unpackedData.

For the simple backward compatibility, all my data are stored in a dictionary.

For the Collaborators Part:  
- GTEventCollector creates instance of me and adds additional information about sent data, see GTEventCollector>>#updateAnnouncement:
- GTEventPacking serialize #data and me in order to send me to a server

Public API and Key Messages

- unpackedData   
 
Internal Representation and Key Implementation Points.

    Instance Variables
	dictionary:		<Dictionary>

"
Class {
	#name : #GTEventAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'dictionary'
	],
	#category : #GT-EventRecorder-Announcements,
	#timestamp : 'JurajKubelka 10/30/2015 16:22'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement class>>gtExampleAnnouncement [
	<gtExample>
	^ self new
			data: #[ 1 2 3 4 ];
			timestamp: DateAndTime now;
			imageHash: SmalltalkImage current imagePath hash;
			sessionCreationTime: SmalltalkImage current session creationTime;
			imageVersion: SystemVersion current version;
			latestUpdate: SystemVersion current highestUpdate;
			yourself
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement class>>gtExampleEmptyAnnouncement [
	<gtExample>
	^ self new
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>addInfoFor: aGTSpotterRecorderEvent  [
	(aGTSpotterRecorderEvent respondsTo: #infoAt:put:) ifTrue: [
		dictionary keysAndValuesDo: [ :key :value |
			key = #data ifFalse: [ 
				aGTSpotterRecorderEvent infoAt: key put: value ] ] ]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>associations [
	^ dictionary 
			ifNil: [ #() ]
			ifNotNil: [ dictionary associations ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>at: key [
	^ self dictionary at: key ifAbsent: [ nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>at: key put: value [
	^ self dictionary at: key put: value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>category [
	^ self at: #category
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>category: aSymbol [
	^ self at: #category put: aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>computerUUID [
	^ self at: #computerUUID
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>computerUUID: anObject [
	self at: #computerUUID put: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>data [
	^ self at: #data
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>data: aByteArray  [
	self at: #data put: aByteArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>dictionary [
	^ dictionary ifNil: [ dictionary := Dictionary new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>eventRecorderVersion [
	^ self at: #eventRecorderVersion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>eventRecorderVersion: anObject [
	self at: #eventRecorderVersion put: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>events [
	| events |
	events := self unpackedData.
	events do: [ :each | self addInfoFor: each ].
	^ events
]

{
	#category : #gt-inspector-extension,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>gtInspectorActionUnpackData [
	<gtInspectorAction>
	^ GLMGenericAction new
		action: [ :composite |
			composite selection: self unpackedData ];
		icon: GLMUIThemeExtraIcons glamorousAdd;
		condition: [ self data isNotNil ];
		title: 'Unpack data'
]

{
	#category : #gt-inspector-extension,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>gtInspectorItems [
	^ OrderedCollection withAll: self associations
]

{
	#category : #gt-inspector-extension,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>gtInspectorItemsIn: composite [
	<gtInspectorPresentationOrder: -1>  
	^ (composite table)
		title: 'Info';
		display: [ :anEvent | anEvent gtInspectorItems ];
		children: [ :each | 
			(each value isDictionary) 
				ifTrue: [ each value associations ] 
				ifFalse: [ (each value isArray and: [ each value allSatisfy: #isDictionary ])
						ifTrue: [ each value collectWithIndex: [:x :i | i -> x ] ]
						ifFalse: [ #() ] ] ];
		column: 'Key' 
			evaluated: [:each | GTObjectPrinter asTruncatedTextFrom: each key ];
		column: 'Value' 
			evaluated: [:each | GTObjectPrinter asTruncatedTextFrom: each value ];
		showOnly: 50
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>imageHash [
	^ self at: #imageHash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>imageHash: anObject [
	self at: #imageHash put: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>imageVersion [
	^ self at: #imageVersion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>imageVersion: anObject [
	self at: #imageVersion put: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>latestUpdate [
	^ self at: #latestUpdate
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>latestUpdate: anObject [
	self at: #latestUpdate put: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>migrationRules [
	^ self dictionary at: #migrationRules ifAbsent: [ nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>migrationRules: aCollectionOrNil [
	^ self dictionary at: #migrationRules put: aCollectionOrNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>safeUnpackedData [
	"On any error, returns empty collection"
	^ [ self unpackedData ] on: Error do: [ #() ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>serializedBy [
	^ self dictionary at: #serializedBy ifAbsent: [ GTFuelPacking name ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>serializedBy: anObject [
	self at: #serializedBy put: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>sessionCreationTime [
	^ self at: #sessionCreationTime
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>sessionCreationTime: anObject [
	self at: #sessionCreationTime put: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>sessionUUID [
	^ self at: #sessionUUID
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>sessionUUID: anObject [
	self at: #sessionUUID put: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>timestamp [
	^ self at: #timestamp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>timestamp: anObject [
	self at: #timestamp put: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventAnnouncement>>unpackedData [
	^ self data ifNotNil: [ :aData | 
		(self class environment at: self serializedBy) new
			migrations: self migrationRules;
			unpack: aData ]
]
