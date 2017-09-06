"
SUnit tests for reducing collections
"
Class {
	#name : #ReduceTest,
	#superclass : #TestCase,
	#category : #Collections-Tests-Sequenceable,
	#timestamp : 'TorstenBergmann 2/20/2014 15:30'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReduceTest>>collectionClasses [
	^ (Array with: Set with: Bag) , (self sequenceableClasses)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReduceTest>>sequenceableClasses [
	^ Array with: Array with: OrderedCollection with: SortedCollection
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReduceTest>>testReduceCollection2Arguments [
	| block |
	block := [ :a :b | a + b ].
	self collectionClasses do: [ :class |
		self should: [ class new reduce: block ] raise: Error.
		self assert: ((class with: 1) reduce: block) = 1.
		self assert: ((class with: 1 with: 2) reduce: block) = 3.
		self assert: ((class with: 1 with: 2 with: 3) reduce: block) = 6.
		self assert: ((class with: 1 with: 2 with: 3 with: 4) reduce: block) = 10 ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReduceTest>>testReduceCollection3Arguments [
	| block |
	block := [ :a :b :c | a + b + c ].
	self collectionClasses do: [ :class |
		self should: [ class new reduce: block ] raise: Error.
		self assert: ((class with: 1) reduce: block) = 1.
		self should: [ (class with: 1 with: 2) reduce: block ] raise: Error.
		self assert: ((class with: 1 with: 2 with: 3) reduce: block) = 6.
		self should: [ (class with: 1 with: 2 with: 3 with: 4) reduce: block ] raise: Error ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReduceTest>>testReduceLeft2Arguments [
	| block |
	block := [ :a :b | Array with: a with: b ].
	self sequenceableClasses do: [ :class |
		self should: [ class new reduceLeft: block ] raise: Error.
		self assert: ((class with: #a) reduceLeft: block) = #a.
		self assert: ((class with: #a with: #b) reduceLeft: block) = #(a b).
		self assert: ((class with: #a with: #b with: #c) reduceLeft: block) = #((a b) c).
		self assert: ((class with: #a with: #b with: #c with: #d) reduceLeft: block) = #(((a b) c) d).
		self assert: ((class with: #a with: #b with: #c with: #d with: #e) reduceLeft: block) = #((((a b) c) d) e) ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReduceTest>>testReduceLeft3Arguments [
	| block |
	block := [ :a :b :c | Array with: a with: b with: c ].
	self sequenceableClasses do: [ :class |
		self should: [ class new reduceLeft: block ] raise: Error.
		self assert: ((class with: #a) reduceLeft: block) = #a.
		self should: [ (class with: #a with: #b) reduceLeft: block ] raise: Error.
		self assert: ((class with: #a with: #b with: #c) reduceLeft: block) = #(a b c).
		self should: [ (class with: #a with: #b with: #c with: #d) reduceLeft: block ] raise: Error.
		self assert: ((class with: #a with: #b with: #c with: #d with: #e) reduceLeft: block) = #((a b c) d e) ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReduceTest>>testReduceLeftSpecial [
	self assert: ((1 to: 100) reduceLeft: [ :a :b | a - b ]) = -5048.
	self assert: ('abc' reduceLeft: [ :a :b | Array with: a with: b ]) = #(($a $b) $c)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReduceTest>>testReduceRight2Arguments [
	| block |
	block := [ :a :b | Array with: a with: b ].
	self sequenceableClasses do: [ :class |
		self should: [ class new reduceRight: block ] raise: Error.
		self assert: ((class with: #a) reduceRight: block) = #a.
		self assert: ((class with: #a with: #b) reduceRight: block) = #(a b).
		self assert: ((class with: #a with: #b with: #c) reduceRight: block) = #(a (b c)).
		self assert: ((class with: #a with: #b with: #c with: #d) reduceRight: block) = #(a (b (c d))).
		self assert: ((class with: #a with: #b with: #c with: #d with: #e) reduceRight: block) = #(a (b (c (d e)))) ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReduceTest>>testReduceRight3Arguments [
	| block |
	block := [ :a :b :c | Array with: a with: b with: c ].
	self sequenceableClasses do: [ :class |
		self should: [ class new reduceRight: block ] raise: Error.
		self assert: ((class with: #a) reduceRight: block) = #a.
		self should: [ (class with: #a with: #b) reduceRight: block ] raise: Error.
		self assert: ((class with: #a with: #b with: #c) reduceRight: block) = #(a b c).
		self should: [ (class with: #a with: #b with: #c with: #d) reduceRight: block ] raise: Error.
		self assert: ((class with: #a with: #b with: #c with: #d with: #e) reduceRight: block) = #(a b (c d e)) ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReduceTest>>testReduceRightSpecial [
	self assert: ((1 to: 100) reduceRight: [ :a :b | a - b ]) = -50.
	self assert: ('abc' reduceRight: [ :a :b | Array with: a with: b ]) = #($a ($b $c))
]
