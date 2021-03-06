Extension { #name : #BlockClosureTest }

{ #category : #'*System-CachingTests' }
BlockClosureTest >> testMemoizedDictionary [
	| cache factorial result |
	cache := Dictionary new.
	factorial := 0. "avoid not-initialised warning when saving method source"
	factorial := [ :n | n = 1 ifTrue: [1] ifFalse: [(factorial value: n - 1) * n] ] memoizedUsing: cache.
	result := (1 to: 5) collect: factorial.
	self assert: result equals: #(1 2 6 24 120).
	self assert: cache associations equals: { 1->1.   2->2.   3->6.   4->24.   5->120 }.
]

{ #category : #'*System-CachingTests' }
BlockClosureTest >> testMemoizedLRUCache [
	| cache factorial result |
	cache := LRUCache new maximumWeight: 3.
	factorial := 0. "avoid not-initialised warning when saving method source"
	factorial := [ :n | n = 1 ifTrue: [1] ifFalse: [(factorial value: n - 1) * n] ] memoizedUsing: cache.
	result := (1 to: 5) collect: factorial.
	self assert: result equals: #(1 2 6 24 120).
	self assert: cache testSupportGetCachedAssociations equals: { 3->6.   4->24.   5->120 }.

]
