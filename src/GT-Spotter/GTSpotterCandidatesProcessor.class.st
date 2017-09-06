"
This processor adds the ability of computing and caching all possible candidates. It is useful when we know all candidates upfront.
"
Class {
	#name : #GTSpotterCandidatesProcessor,
	#superclass : #GTSpotterProcessor,
	#instVars : [
		'origin',
		'allCandidates'
	],
	#category : #GT-Spotter-Processors,
	#timestamp : 'TudorGirba 11/30/2014 22:12'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesProcessor class>>on: anObject [

	^ self new origin: anObject
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesProcessor>>allCandidatesIn: aContext [
	^ self allItemsIn: aContext
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesProcessor>>allItemsIn: aContext [

	^ allCandidates ifNil: [ allCandidates := (self computeAllItemsIn: aContext) copy ].
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesProcessor>>candidatesLimit [
	^ self itemsLimit
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesProcessor>>computeAllItemsIn: aContext [

	^ OrderedCollection new
	
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesProcessor>>computeCandidatesIn: aContext [

	^ self computeAllItemsIn: aContext
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesProcessor>>continueItemsLimit [
	^ (self defaultContinueItemsLimit - self itemsLimit) max: 0
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesProcessor>>doFilterInContext: aSpotterContext [
	^ aSpotterContext doFilter: GTFilterBlock gtFilter forProcessor: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesProcessor>>itemFilterNameFor: anObject [
	^ self itemNameFor: anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesProcessor>>itemIconFor: anObject [
	^ nil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesProcessor>>itemNameFor: anObject [
	^ anObject gtDisplayString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesProcessor>>itemsLimit [
	"Return the maximal number of elements that can be found during search.
	Default implementation returns infinity, so the number of element is not limited."
	^ Float infinity
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesProcessor>>origin [

	^ origin
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesProcessor>>origin: anObject [

	origin := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesProcessor>>prepareProcessorInContext: aContext [
	super prepareProcessorInContext: aContext.
	
	self hasDynamicItems ifTrue: [ allCandidates := nil ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesProcessor>>render: anObject [
	^ GTSpotterItemBrick new
		icon: (self itemIconFor: anObject);
		text: (self itemNameFor: anObject)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesProcessor>>title [
	^ 'undefined'
]
