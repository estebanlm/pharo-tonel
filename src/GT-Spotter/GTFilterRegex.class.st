"

"
Class {
	#name : #GTFilterRegex,
	#superclass : #GTUnorderedFilter,
	#instVars : [
		'regex'
	],
	#category : #GT-Spotter-Filters,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilterRegex>>applyFilterInContext: aSpotterContext error: exception [
	super applyFilterInContext: aSpotterContext error: exception.
	^ (GTFilterSubstrings new
		caseSensitive: self caseSensitive;
		yourself) value: aSpotterContext
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilterRegex>>isMatchedItem: anItem [
	^ self regex matches: (self itemFilterNameFor: anItem)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilterRegex>>prepareFilterInContext: aSpotterContext [
	super prepareFilterInContext: aSpotterContext.
	
	self regex: (caseSensitive " performance optimization "
		ifTrue: [ self query asRegex ] 
		ifFalse: [ self query asRegexIgnoringCase ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilterRegex>>regex [
	^ regex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilterRegex>>regex: anObject [
	regex := anObject
]
