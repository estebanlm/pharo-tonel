Extension {
	#name : #LRUCache
}

{
	#category : #'*System-CachingTests',
	#timestamp : ' 8/31/2017 05:26:46'
}
LRUCache>>testSupportGetCachedAssociations [
	| result |
	result := OrderedCollection new.
	self keysAndValuesDo: [ :key :value |
		result add: (key -> value)
		].
	^result asArray.
]
