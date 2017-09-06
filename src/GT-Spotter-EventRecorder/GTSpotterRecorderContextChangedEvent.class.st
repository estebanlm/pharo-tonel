"
A GTSpotterRecorderContextChangedEvent stores current query written in Spotter input field. This event stores the size of the query and wheather or not the current query is a refinment of a previous query.

Instance Variables
	text:		<String>

text
	- query writen in Spotter input field

"
Class {
	#name : #GTSpotterRecorderContextChangedEvent,
	#superclass : #GTSpotterRecorderEvent,
	#instVars : [
		'isRefinement',
		'currentTextInfo',
		'previousTextInfo'
	],
	#category : #GT-Spotter-EventRecorder-Events,
	#timestamp : 'AndreiChis 3/2/2015 15:29'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderContextChangedEvent>>accept: aVisitor [
	^ aVisitor visitContextChangedEvent: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderContextChangedEvent>>currentTextHashes [
	^ self stringHashesFor: self currentTextInfo
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderContextChangedEvent>>currentTextInfo [
	^ currentTextInfo
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderContextChangedEvent>>currentTextSizes [
	^ self stringSizesFor: self currentTextInfo
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderContextChangedEvent>>currentTextSpecials [
	^ self stringSpecialsFor: self currentTextInfo
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderContextChangedEvent>>fromAnnouncement: anAnnouncement [

	currentTextInfo := self textInfoFrom: anAnnouncement currentText.
	anAnnouncement previousText size == 0 ifTrue: [ ^ self ].
	previousTextInfo := self textInfoFrom: anAnnouncement previousText.
	isRefinement := (anAnnouncement currentText size > anAnnouncement previousText size 
		ifTrue: [ anAnnouncement currentText beginsWith: anAnnouncement previousText]
		ifFalse: [ anAnnouncement previousText beginsWith: anAnnouncement currentText ]).
]

{
	#category : #gt-inspector-extension,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderContextChangedEvent>>gtInspectorItems [
	^ OrderedCollection new
			add: (#isRefinement -> self isRefinement);
			add: (#currentTextInfo -> self currentTextInfo);
			add: (#previousTextInfo -> self previousTextInfo);
			addAll: super gtInspectorItems;
			yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderContextChangedEvent>>hasCurrentTextSpecials [
	^ self currentTextSpecials includes: true
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderContextChangedEvent>>initialize [
	super initialize.
	isRefinement := false.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderContextChangedEvent>>isContextChanged [
	^ self currentTextInfo notNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderContextChangedEvent>>isRefinement [
	^ isRefinement
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderContextChangedEvent>>previousTextInfo [
	^ previousTextInfo
]
