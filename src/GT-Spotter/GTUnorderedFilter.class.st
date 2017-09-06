"

"
Class {
	#name : #GTUnorderedFilter,
	#superclass : #GTStringFilter,
	#category : #GT-Spotter-Filters,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTUnorderedFilter>>applyFilterWithQuery [
	| unorderedMatchedItems |
	unorderedMatchedItems := OrderedCollection new.
	self allItemsDo: [ :each | 
		(self isMatchedItem: each)
				ifTrue: [
					unorderedMatchedItems isEmpty 
						ifTrue: [ 
							" this was done in the nil-fallback of GTSpotterCandidatesProcessor>>doFilter:on: - seems not to be harmful  "
							Processor activeProcess priority: Processor userSchedulingPriority ]. 
					unorderedMatchedItems add: each.
					unorderedMatchedItems size > self itemsLimit 
						ifTrue: [ 
							" this was done in the nil-fallback of GTSpotterCandidatesProcessor>>doFilter:on: - seems not to be harmful  "
							Processor activeProcess priority: Processor userBackgroundPriority ]
						ifFalse: [ self addItem: each ] ] ].
	self filteredItems: unorderedMatchedItems
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTUnorderedFilter>>isMatchedItem: anItem [
	^ false
]
