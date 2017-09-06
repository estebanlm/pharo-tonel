"

"
Class {
	#name : #GTFilterBlock,
	#superclass : #GTUnorderedFilter,
	#instVars : [
		'matcher'
	],
	#category : #GT-Spotter-Filters,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilterBlock>>isMatchedItem: anItem [
	^ self matcher 
		ifNotNil: [ self matcher value: anItem value: self context ]
		ifNil: [ (self itemFilterNameFor: anItem) includesSubstring: query caseSensitive: caseSensitive ]
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilterBlock>>matcher [
	^ matcher
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilterBlock>>matcher: anObject [
	matcher := anObject
]
