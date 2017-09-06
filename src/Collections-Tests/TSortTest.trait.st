"
A trait for test purposes
"
Trait {
	#name : #TSortTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:35'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TSortTest>>sortedInAscendingOrderCollection [
	"Return a collection sorted in ascending order"
	^ self explicitRequirement
	
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSortTest>>test0SortingArrayedTest [
	| tmp sorted |
	" an unsorted collection of number "
	self unsortedCollection.
	self unsortedCollection do: [ :each | each isNumber ].
	sorted := true.
	self unsortedCollection
		pairsDo: [ :each1 :each2 | 
			each2 < each1
				ifTrue: [ sorted := false ] ].
	self assert: sorted = false.	" a collection of number sorted in an ascending order"
	self sortedInAscendingOrderCollection.
	self sortedInAscendingOrderCollection do: [ :each | each isNumber ].
	tmp := self sortedInAscendingOrderCollection at: 1.
	self sortedInAscendingOrderCollection
		do: [ :each | 
			self assert: each >= tmp.
			tmp := each ]
]

{
	#category : #'tests - sorting',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSortTest>>testIsSorted [
	self assert: self sortedInAscendingOrderCollection isSorted.
	self deny: self unsortedCollection isSorted
]

{
	#category : #'tests - sorting',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSortTest>>testIsSortedBy [
	self assert: (self sortedInAscendingOrderCollection isSortedBy: [:a :b | a<b]).
	self deny: (self sortedInAscendingOrderCollection isSortedBy: [:a :b | a>b]).

]

{
	#category : #'tests - sorting',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSortTest>>testSort [
	| result tmp |
	result := self unsortedCollection sort.
	tmp := result at: 1.
	result do:
		[:each | self assert: each>=tmp. tmp:= each. ].
]

{
	#category : #'tests - sorting',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSortTest>>testSortUsingSortBlock [
	| result tmp |
	result := self unsortedCollection sort: [:a :b | a>b].
	tmp := result at: 1.
	result do:
		[:each | self assert: each<=tmp. tmp:= each. ].
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
TSortTest>>testSorted [
	| result tmp unsorted |
	unsorted := self unsortedCollection.
	result := unsorted sorted.
	self deny: unsorted == result.
	tmp := result at: 1.
	result
		do: [ :each | 
			self assert: each >= tmp.
			tmp := each ]
]

{
	#category : #'tests - sorting',
	#timestamp : ' 8/31/2017 05:26:28'
}
TSortTest>>testSortedUsingBlock [
	| result tmp |
	result := self unsortedCollection sorted:  [:a :b | a>b]..
	tmp := result at: 1.
	result do:
		[:each | self assert: each<=tmp. tmp:= each. ].
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TSortTest>>unsortedCollection [
"Return a collection that is not yet sorted"
	^self explicitRequirement
]
