"
This is a candidates processor that can be parameterized via blocks.
"
Class {
	#name : #GTSpotterCandidatesListProcessor,
	#superclass : #GTSpotterCandidatesProcessor,
	#instVars : [
		'allCandidatesBlock',
		'candidatesLimit',
		'queryMatchingBlock',
		'title',
		'itemNameBlock',
		'itemIconBlock',
		'actBlock',
		'wantsToDisplayOnEmptyQuery',
		'filterBlock',
		'itemFilterNameBlock',
		'keyBinding',
		'sortBlock'
	],
	#category : #GT-Spotter-Processors,
	#timestamp : 'TudorGirba 11/30/2014 22:12'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>actLogic [
	^ actBlock
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>actLogic: aBlockWithTwoArguments [

	actBlock := aBlockWithTwoArguments
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>actOn: anObject for: aStep [
	
	actBlock
		ifNil: [ super actOn: anObject for: aStep ]
		ifNotNil: [ actBlock cull: anObject cull: aStep ]
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>allCandidates: aBlockWithOneArgument [
	self items: aBlockWithOneArgument
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>candidatesLimit: anInteger [
	self itemsLimit: anInteger
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>computeAllItemsIn: aContext [
	^ allCandidatesBlock cull: aContext
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>defaultCandidatesLimit [
	^ self defaultItemsLimit
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>defaultContinueItemsLimit [
	" Spotter becomes extraordenary slow when rendering too many results. So we set the maximum limit to 100. This is only a temporary solution until we have fixed the problem. Until then no spotter processor will ever generate more then 100 results. "
	^ 100
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>defaultItemsLimit [
	^ 5
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>doFilterInContext: aSpotterContext [
	^ aSpotterContext doFilter: filterBlock gtFilter forProcessor: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>filter [
	^ filterBlock
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>filter: aGTFilterOrBlockWithOneArgument [
	filterBlock := aGTFilterOrBlockWithOneArgument 
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>filter: aGTFilter item: aGTSpotterIterator  [
	self filter: aGTFilter.
	self items: aGTSpotterIterator gtIterator.
	
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>filterUsing: aFilter [
	self filter: aFilter
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>hasDynamicItems [
	^ allCandidatesBlock hasDynamicItems
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>itemFilterName [
	^ itemFilterNameBlock
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>itemFilterName: aBlockWithOneArgument [
	itemFilterNameBlock := aBlockWithOneArgument
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>itemFilterNameFor: anObject [
	^ itemFilterNameBlock isNil
		ifTrue: [ super itemFilterNameFor: anObject ]
		ifFalse: [ itemFilterNameBlock cull: anObject ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>itemIcon [
	^ itemIconBlock
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>itemIcon: aBlockWithOneArgument [
	itemIconBlock := aBlockWithOneArgument
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>itemIconFor: anObject [
	^ itemIconBlock isNil
		ifTrue: [ super itemIconFor: anObject ]
		ifFalse: [ itemIconBlock cull: anObject ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>itemName [
	^ itemNameBlock
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>itemName: aBlockWithOneArgument [
	itemNameBlock := aBlockWithOneArgument
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>itemNameFor: anObject [
	^ itemNameBlock isNil
		ifTrue: [ super itemNameFor: anObject ]
		ifFalse: [ itemNameBlock cull: anObject ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>items: aBlock [
	allCandidatesBlock := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>itemsLimit [
	^ candidatesLimit ifNil: [ self defaultItemsLimit ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>itemsLimit: anInteger [
	candidatesLimit := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>keyBinding [
	^ keyBinding
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>keyBinding: anObject [
	keyBinding := anObject
]

{
	#category : #scripting-convenience,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>match: aBlockWithTwoArguments [
	self filter: (GTFilterBlock new 
		matcher: aBlockWithTwoArguments;
		yourself)
]

{
	#category : #scripting-convenience,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>matchAlike [
	self filter: GTFilterAlike
]

{
	#category : #scripting-convenience,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>matchRegex [
	self filter: GTFilterRegex
]

{
	#category : #scripting-convenience,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>matchString [
	self filter: GTFilterStringMatch
]

{
	#category : #scripting-convenience,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>matchSubstring [
	self filter: GTFilterSubstring
]

{
	#category : #scripting-convenience,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>matchSubstrings [
	self filter: GTFilterSubstrings
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>sort [
	^ sortBlock
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>sort: aBlockWithTwoArguments [
	sortBlock := aBlockWithTwoArguments
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>title [
	^ title ifNil: [ super title ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>title: aString [
	title := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>wantsToDisplayOnEmptyQuery [
	^ wantsToDisplayOnEmptyQuery ifNil: [ super wantsToDisplayOnEmptyQuery ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>wantsToDisplayOnEmptyQuery: anObject [
	wantsToDisplayOnEmptyQuery := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterCandidatesListProcessor>>withItemsLimit: aLimit do: aBlock [
	| previousCandidatesLimit |
	previousCandidatesLimit := candidatesLimit.
	^ [ candidatesLimit := aLimit. aBlock value ] 
		ensure: [ candidatesLimit := previousCandidatesLimit ]
]
