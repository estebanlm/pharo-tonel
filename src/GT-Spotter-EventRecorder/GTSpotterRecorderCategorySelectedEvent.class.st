"
A GTSpotterRecorderCategorySelectedEvent  models the action of  selecting a category in the search results. This event stores the name of the category and the number of results that were matched by the current query.

Instance Variables
	categoryLabel:		<Object>
	elementCount:		<Object>

categoryLabel
	- xxxxx

elementCount
	- xxxxx

"
Class {
	#name : #GTSpotterRecorderCategorySelectedEvent,
	#superclass : #GTSpotterRecorderEvent,
	#instVars : [
		'categoryLabel',
		'elementCount'
	],
	#category : #GT-Spotter-EventRecorder-Events,
	#timestamp : 'AndreiChis 2/27/2015 14:41'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderCategorySelectedEvent>>accept: aVisitor [
	^ aVisitor visitCategorySelectedEvent: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderCategorySelectedEvent>>categoryLabel [
	^ categoryLabel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderCategorySelectedEvent>>elementCount [
	^ elementCount
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderCategorySelectedEvent>>elementCountOrZero [
	^ self elementCount ifNil: [ 0 ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderCategorySelectedEvent>>fromAnnouncement: anAnnouncement [

	categoryLabel := anAnnouncement category title.
	elementCount := anAnnouncement category allFilteredCandidates size.
]

{
	#category : #gt-inspector-extension,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderCategorySelectedEvent>>gtInspectorItems [
	^ OrderedCollection new
			add: (#categoryLabel -> self categoryLabel);
			add: (#elementCount -> self elementCount);
			addAll: super gtInspectorItems;
			yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterRecorderCategorySelectedEvent>>isCategorySelection [
	^ true
]
