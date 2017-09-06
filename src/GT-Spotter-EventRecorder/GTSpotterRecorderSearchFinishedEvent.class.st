"
A GTSpotterRecorderSearchFinishedEvent is triggered when spotter finished a search and displayed all the results. This event stores the size of the query.

"
Class {
	#name : #GTSpotterRecorderSearchFinishedEvent,
	#superclass : #GTSpotterRecorderEvent,
	#instVars : [
		'query',
		'processors'
	],
	#category : #GT-Spotter-EventRecorder-Events,
	#timestamp : 'AndreiChis 3/2/2015 15:30'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderSearchFinishedEvent>>accept: aVisitor [
	^ aVisitor visitSearchFinishedEvent: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderSearchFinishedEvent>>categories [
	^ self processors 
			ifNotNil: [ :aCollection | aCollection select: #isString ]
			ifNil: [ #() ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderSearchFinishedEvent>>fromAnnouncement: anAnnouncement [
	query := self textInfoFrom: anAnnouncement query.
	processors := (anAnnouncement processors flatCollect: [ :eachProcessor |
		Array 
			with: eachProcessor title
			with: eachProcessor allFilteredCandidates size ]) asArray
]

{
	#category : #gt-inspector-extension,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderSearchFinishedEvent>>gtInspectorItems [
	^ OrderedCollection new
			add: (#query -> self query);
			add: (#processors -> self processors);
			addAll: super gtInspectorItems;
			yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderSearchFinishedEvent>>isSearchFinished [
	^ self query notNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderSearchFinishedEvent>>items [
	^ self processors 
			ifNotNil: [ :aCollection | aCollection select: #isNumber ]
			ifNil: [ #() ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderSearchFinishedEvent>>processors [
	^ processors
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderSearchFinishedEvent>>query [
	^ query
]
