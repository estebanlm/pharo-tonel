"
SUnit tests for example set
"
Class {
	#name : #ExampleSetTest,
	#superclass : #TestCase,
	#instVars : [
		'full',
		'empty'
	],
	#category : #SUnit-Tests-Core,
	#timestamp : 'TorstenBergmann 2/12/2014 23:16'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
ExampleSetTest>>setUp [
	empty := Set new.
	full := Set with: 5 with: #abc
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ExampleSetTest>>testAdd [
	empty add: 5.
	self assert: (empty includes: 5)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ExampleSetTest>>testGrow [
	empty addAll: (1 to: 100).
	self assert: empty size = 100
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ExampleSetTest>>testIllegal [
	self 
		should: [empty at: 5] 
		raise: self defaultTestError.
	self 
		should: [empty at: 5 put: #abc] 
		raise: self defaultTestError
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ExampleSetTest>>testIncludes [
	self assert: (full includes: 5).
	self assert: (full includes: #abc)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ExampleSetTest>>testOccurrences [
	self assert: (empty occurrencesOf: 0) = 0.
	self assert: (full occurrencesOf: 5) = 1.
	full add: 5.
	self assert: (full occurrencesOf: 5) = 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ExampleSetTest>>testRemove [
	full remove: 5.
	self assert: (full includes: #abc).
	self deny: (full includes: 5)
]
