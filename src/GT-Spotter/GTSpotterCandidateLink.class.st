"

"
Class {
	#name : #GTSpotterCandidateLink,
	#superclass : #DoubleLink,
	#instVars : [
		'processorLink',
		'weight',
		'renderingProcessorLink'
	],
	#category : #GT-Spotter-Utils,
	#timestamp : ''
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateLink>>< anotherCandidateLink [

	^ self weight < anotherCandidateLink weight
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateLink>>> anotherCandidateLink [

	^ self weight > anotherCandidateLink weight
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateLink>>asSpotterCandidateLink [

	^ self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateLink>>candidate [
	^ self value
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateLink>>copy [
	|link|
	link := self class value: self value.
	link privateProcessorLink: processorLink.
	link privateRenderingProcessorLink: renderingProcessorLink.
	link weight: weight.
	^ link
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateLink>>gtDisplayOn: stream [
	stream nextPutAll: 'Candidate link: '.
	self value gtDisplayOn: stream 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateLink>>isFirst [

	^ (self previousLink processorLink = self processorLink) not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateLink>>next [
	^ self nextLink
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateLink>>previous [
	^ self previousLink
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateLink>>privateProcessorLink: aLink [

	processorLink := aLink
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateLink>>privateRenderingProcessorLink: aLink [

	renderingProcessorLink := aLink
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateLink>>processor [

	^ self processorLink value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateLink>>processorLink [
	^ processorLink
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateLink>>processorLink: anObject [

	"we set rendering processor only if one is not set. it allows to have a collection of items,
	that have different rendering processors"
	
	processorLink ifNil: [ self renderingProcessor: anObject ].
	processorLink := anObject.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateLink>>renderingProcessor [

	renderingProcessorLink ifNil: [ self renderingProcessor: processorLink ].
	^ renderingProcessorLink value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateLink>>renderingProcessor: aProcessorLink [

	renderingProcessorLink ifNil: [ renderingProcessorLink := aProcessorLink processor asSpotterProcessorLink ].
	processorLink ifNil: [ processorLink := aProcessorLink ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateLink>>weight [

	^ weight
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidateLink>>weight: anObject  [

	weight := anObject
]
