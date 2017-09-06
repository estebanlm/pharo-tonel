Extension {
	#name : #BlockClosure
}

{
	#category : #'*System-Caching',
	#timestamp : ' 8/31/2017 05:26:16'
}
BlockClosure>>memoized [
	"Returns a memoized version of a one argument block (so values that were
	  already calculated will not be computed a second time but returned from a cache)."
	
	^ self memoizedUsing:  Dictionary new.
]

{
	#category : #'*System-Caching',
	#timestamp : ' 8/31/2017 05:26:16'
}
BlockClosure>>memoizedUsing: cache [
	"Provide a memoization block using the given cache. So one can tune by
     passing a LRUCache for instance"
  
    ^[ :x | cache at: x ifAbsentPut: [ self value: x ] ]

]
