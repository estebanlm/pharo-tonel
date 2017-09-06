"

"
Class {
	#name : #GTFilterStringMatch,
	#superclass : #GTUnorderedFilter,
	#category : #GT-Spotter-Filters,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilterStringMatch>>isMatchedItem: anItem [
	^ query match: (self itemFilterNameFor: anItem)
]
