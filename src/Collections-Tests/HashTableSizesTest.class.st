"

"
Class {
	#name : #HashTableSizesTest,
	#superclass : #TestCase,
	#category : #Collections-Tests-Unordered,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
HashTableSizesTest>>testAtLeast [
	-1000 to: 1000 do: [ :limit | 
		| size |
		"#atLeast: should answer the next known good prime not less than i, or
		the next odd integer if i is greater than the largest known good prime."
		size := HashTableSizes atLeast: limit.
		self
			assert: size >= limit;
			assert: size positive;
			assert: size isInteger;
			assert: (size isPrime or: [ size odd ]).
		"it should behave the same as the lower-level #basicAtLeast: it relies on"
		self assert: size = (HashTableSizes basicAtLeast: limit) ].

	-1000.1 to: 1000.1 do: [ :limit | 
		| size |
		size := HashTableSizes atLeast: limit.
		self
			assert: size > limit; "do not round fractional limits down"
			assert: size positive;
			assert: size isInteger;
			assert: (size isPrime or: [ size odd ]);
			assert: size = (HashTableSizes basicAtLeast: limit) ]
]
