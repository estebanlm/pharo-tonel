"

"
Class {
	#name : #TTLCacheTests,
	#superclass : #LRUCacheTests,
	#category : #System-CachingTests,
	#timestamp : ''
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:46'
}
TTLCacheTests class>>shouldInheritSelectors [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
TTLCacheTests>>newCache [
	^ TTLCache new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:46'
}
TTLCacheTests>>testExpiring [
	| cache didComputeValue |
	cache := self newCache.
	cache timeToLive: 1 second.
	didComputeValue := false.
	cache at: #foo ifAbsentPut: [ didComputeValue := true. 100 ].
	self assert: didComputeValue.
	self assert: (cache includesKey: #foo).
	self assert: (cache at: #foo ifAbsentPut: [ self fail ]) equals: 100.
	1 second asDelay wait.
	didComputeValue := false.
	cache at: #foo ifAbsentPut: [ didComputeValue := true. 101 ].
	self assert: didComputeValue.
	self assert: (cache includesKey: #foo).
	self assert: (cache at: #foo ifAbsentPut: [ self fail ]) equals: 101.
	cache validateInvariantWith: self 
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:46'
}
TTLCacheTests>>testRemoveStaleValues [
	| cache keys |
	cache := self newCache.
	cache timeToLive: 1 second.
	cache at: #foo ifAbsentPut: [ 100 ].
	cache at: #bar ifAbsentPut: [ 200 ].
	self deny: cache isEmpty.
	1 second asDelay wait.
	keys := cache removeStaleValues.
	self assert: cache isEmpty.
	self assert: keys asArray sorted equals: #(bar foo).
	cache validateInvariantWith: self 
	
]
