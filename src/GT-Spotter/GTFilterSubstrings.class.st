"

"
Class {
	#name : #GTFilterSubstrings,
	#superclass : #GTUnorderedFilter,
	#instVars : [
		'separators'
	],
	#category : #GT-Spotter-Filters,
	#timestamp : ''
}

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilterSubstrings>>defaultSeparators [
	^ ' '
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilterSubstrings>>isMatchedItem: anItem [
	| itemName |
	itemName := self itemFilterNameFor: anItem.
	^ query allSatisfy: [ :fragment | 
		itemName includesSubstring: fragment caseSensitive: self caseSensitive ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilterSubstrings>>prepareFilterInContext: aSpotterContext [
	super prepareFilterInContext: aSpotterContext.
	
	separators ifNil: [  separators := self defaultSeparators  ]. " performance optimization "
	self query: (self query substrings: self separators) asSet asArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilterSubstrings>>separators [
	^ separators
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilterSubstrings>>separators: anObject [
	separators := anObject
]
