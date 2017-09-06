"
I am the root class of the hierarchy of filter objects  that can be used by Spotter. 

The main entry point is the #value method that performs and returns the list of filtered items.
Subclasses should return the list of filtered elements in sorted order based on the filtering criteria.
"
Class {
	#name : #GTFilter,
	#superclass : #Object,
	#instVars : [
		'context',
		'filteredItems',
		'streamed'
	],
	#category : #GT-Spotter-Filters,
	#timestamp : 'AndreiChis 7/17/2015 13:48'
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter class>>gtFilter [
	^ self new
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter class>>gtListFilter [
	^ self new
]

{
	#category : #private-model,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>addItem: anItem [
	self context streamed add: anItem.
	self context addItem: anItem
]

{
	#category : #private-model,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>addItems: aCollection [
	self context streamed addAll: aCollection.
	self context addItems: aCollection
]

{
	#category : #private-model,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>allItems [
	" WARNING: #allItems might be a list, block or iterator. we have to evaluate it in order to calculate the remaining/unstreamed items. #allItems are/were designed to be polymorphic to collections and streams. so this should be safe "
	| allItems |
	allItems := self processor allItemsIn: self context.
	^ self context isContinuing
		ifTrue: [ allItems value fasterDifferencePreservingOrder: self context streamed ]
		ifFalse: [ allItems ]
]

{
	#category : #private-model,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>allItemsDo: aBlock [
	self allItems do: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>applyFilter [
	^ self filteredItems
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>applyFilterInContext: aSpotterContext [
	self prepareFilterInContext: aSpotterContext.
	^ self applyFilter
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>applyFilterInContext: aSpotterContext error: anException [
	('[Spotter] Exception in filter <', self class name, '>: ', anException asString) logCr.
	^ self defaultFilteredItems
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>context [
	^ context
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>context: anObject [
	context := anObject
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>defaultFilteredItems [
	^ OrderedCollection new: 100 " not a limitation, just a reasonable start size "
]

{
	#category : #accessing-defaults,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>defaultStreamed [
	^ true
]

{
	#category : #private-model,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>exceptionHandler [
	self flag: 'Bloc -> overrides doesNotUnderstand discarding the current exception context'.
	^ GTCurrentSpotterExceptionHandler value ifNil: [ self context exceptionHandler ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>filteredItems [
	^ filteredItems
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>filteredItems: aCollection [
	filteredItems := aCollection
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>gtFilter [
	^ self
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>gtListFilter [
	^ self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>hasFilteredItems [
	^ self filteredItems isEmptyOrNil not
]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>initialize [
	super initialize.
	
	self filteredItems: self defaultFilteredItems
]

{
	#category : #private-model,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>itemFilterNameFor: anItem [
	"I return the string/text representation of an item used by the filter."
	
	^ self processor itemFilterNameFor: anItem
]

{
	#category : #private-model,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>itemsLimit [
	^ self context itemsLimit
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>prepareFilterInContext: aSpotterContext [
	"I provide a hook for preprocessing the query once before performing a search."
	
	self context: aSpotterContext.
]

{
	#category : #private-model,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>processor [
	^ self context processor
]

{
	#category : #private-model,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>step [
	^ self context step
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>streamed [
	^ streamed ifNil: [ streamed := self defaultStreamed ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>streamed: anObject [
	streamed := anObject
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilter>>value: aSpotterContext [
	"I provide an entry point for performing a search that is 
	polymorphic with BlockClosure>>value:. I return the list of
	filtered items."
	
	^ [ [ self applyFilterInContext: aSpotterContext ]
		on: Error
		do: [ :exception | 
			self exceptionHandler 
				handleException: exception 
				do: [ self applyFilterInContext: aSpotterContext error: exception ] ] ] 
		ensure: [ context := nil " release the context after search is completed " ] 
]
