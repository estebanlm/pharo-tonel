"
SUnit tests for shared queues
"
Class {
	#name : #SharedQueueTest,
	#superclass : #TestCase,
	#category : #Collections-Tests-Sequenceable,
	#timestamp : 'TorstenBergmann 2/20/2014 15:30'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SharedQueueTest>>testBasics [
	| q |
	q := SharedQueue new.
	self should: [ q nextOrNil isNil ].
	self assert: q atEnd.
	q nextPut: 5.
	self assertCollection: q contents hasSameElements: #(5).
	self should: [ q nextOrNil = 5 ].
	self should: [ q nextOrNil isNil ].
	self assert: q atEnd.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SharedQueueTest>>testContention1 [
	"here is a test case that breaks the standard SharedQueue from Squeak 3.8"

	| q r1 r2 |
	q := SharedQueue new.
	q nextPut: 5.
	q nextPut: 10.
	self should: [ q nextOrNil = 5 ].
	[ r1 := q next ] fork.
	[ r2 := q next ] fork.
	Processor yield.	"let the above two threads block"
	q nextPut: 10.
	Processor yield.
	self should: [ r1 = 10 ].
	self should: [ r2 = 10 ].
	self should: [ q nextOrNil isNil ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SharedQueueTest>>testNextOrNilSuchThat [
	| q item |
	q := SharedQueue new.
	q nextPut: 5.
	q nextPut: 6.
	item := q findFirst: [ :x | x even ].
	self should: [ item = 6 ].
	self should: [ q nextOrNil = 5 ].
	self should: [ q nextOrNil isNil ]
]
