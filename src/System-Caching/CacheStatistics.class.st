"
I am CacheStatistics.
I keep track of hits and misses of a cache.
"
Class {
	#name : #CacheStatistics,
	#superclass : #Object,
	#instVars : [
		'hits',
		'misses'
	],
	#category : #System-Caching,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
CacheStatistics>>addHit [
	hits := hits + 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
CacheStatistics>>addMiss [
	misses := misses + 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
CacheStatistics>>hitRatio [
	"Return the ratio of hits against total calls I received.
	This will be a number between 0 and 1.
	When I am empty, return 0."
	
	| total |
	total := hits + misses.
	total = 0 ifTrue: [ ^ 0 ].
	^ hits / total
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
CacheStatistics>>hits [
	^ hits
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:16'
}
CacheStatistics>>initialize [
	super initialize.
	hits := misses := 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
CacheStatistics>>misses [
	^ misses
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:16'
}
CacheStatistics>>reset [
	hits := misses := 0
]
