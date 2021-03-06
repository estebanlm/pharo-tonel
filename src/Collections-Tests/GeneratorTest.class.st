"
SUnit tests for class Generator
"
Class {
	#name : #GeneratorTest,
	#superclass : #TestCase,
	#category : #Collections-Tests-Streams
}

{ #category : #accessing }
GeneratorTest class >> packageNamesUnderTest [
	^ #('Generator')
]

{ #category : #generators }
GeneratorTest >> fibonacciSequence [
	"Yields an infinite sequence of fibonacci numbers."
	
	^ Generator on: [ :generator |
		| a b |
		a := 0. b := 1.
		[ a := b + (b := a).
		  generator yield: a ]
			repeat ]
]

{ #category : #generators }
GeneratorTest >> numbersBetween: aStartInteger and: aStopInteger [
	"Yields the nubmers between aStartInteger and aStopInteger."
	
	^ Generator on: [ :generator |
		aStartInteger to: aStopInteger 
			do: [ :value | generator yield: value ] ]
]

{ #category : #testing }
GeneratorTest >> testAtEnd [
	| generator |
	generator := self numbersBetween: 1 and: 3.
	self deny: generator atEnd.
	generator next.
	self deny: generator atEnd.
	generator next.
	self deny: generator atEnd.
	generator next.
	self assert: generator atEnd
]

{ #category : #testing }
GeneratorTest >> testClose [
	| generator doEnsure notEnsure |
	doEnsure := notEnsure := 0.
	[ generator := Generator on: [ :g |
		[ g yield: 1; yield: 2 ]
			ensure: [ doEnsure := doEnsure + 1 ] ].
	self assert: doEnsure = 0; assert: notEnsure = 0.
	self assert: generator peek = 1.
	self assert: doEnsure = 0; assert: notEnsure = 0.
	generator close.
	self assert: doEnsure = 1; assert: notEnsure = 0 ]
		ensure: [ notEnsure := notEnsure + 1 ].
	self assert: doEnsure = 1; assert: notEnsure = 1
]

{ #category : #testing }
GeneratorTest >> testContents [
	| generator |
	generator := self numbersBetween: 1 and: 3.
	self assert: generator contents = #(1 2 3)
]

{ #category : #testing }
GeneratorTest >> testEmpty [
	| generator |
	generator := Generator on: [ :g | ].
	self assert: generator atEnd.
	self assert: generator peek isNil.
	self assert: generator next isNil
]

{ #category : #testing }
GeneratorTest >> testEnsure [
	| generator |
	generator := Generator on: [ :g |
		[ g yield: 1; yield: 2 ]
			ensure: [ g yield: 3 ] ].
	self assert: generator upToEnd asArray = #( 1 2 3 )
]

{ #category : #testing }
GeneratorTest >> testErrorPropagation [
	"Ensure that errors in the generator block are properly propagated"

	| generator |
	generator := Generator
		on: [ :g | 
			g yield: 1.
			g error: 'yo' ].
	self should: [ generator next ] raise: Error
]

{ #category : #testing }
GeneratorTest >> testFibonacci [
	| generator |
	generator := self fibonacciSequence.
	self assert: (generator next: 10) asArray = #( 1 1 2 3 5 8 13 21 34 55 )
]

{ #category : #testing }
GeneratorTest >> testNext [
	| generator |
	generator := self numbersBetween: 1 and: 3.
	self assert: generator next = 1.
	self assert: generator next = 2.
	self assert: generator next = 3.
	self assert: generator next isNil
]

{ #category : #testing }
GeneratorTest >> testPeek [
	| generator |
	generator := self numbersBetween: 1 and: 3.
	self assert: generator peek = 1.
	self assert: generator peek = 1.
	generator next.
	self assert: generator peek = 2
]

{ #category : #testing }
GeneratorTest >> testReset [
	| generator |
	generator := self numbersBetween: 1 and: 3.
	self assert: generator next = 1.
	self assert: generator next = 2.
	generator reset.
	self assert: generator next = 1.
	self assert: generator next = 2.
	self assert: generator next = 3.
	self assert: generator next = nil.
	generator reset.
	self assert: generator next = 1
]

{ #category : #testing }
GeneratorTest >> testResetUnwind [
	"Just like close, just using reset"
	| generator doEnsure notEnsure |
	doEnsure := notEnsure := 0.
	[ generator := Generator on: [ :g |
		[ g yield: 1; yield: 2 ]
			ensure: [ doEnsure := doEnsure + 1 ] ].
	self assert: doEnsure = 0; assert: notEnsure = 0.
	self assert: generator peek = 1.
	self assert: doEnsure = 0; assert: notEnsure = 0.
	generator reset.
	self assert: doEnsure = 1; assert: notEnsure = 0 ]
		ensure: [ notEnsure := notEnsure + 1 ].
	self assert: doEnsure = 1; assert: notEnsure = 1
]

{ #category : #testing }
GeneratorTest >> testSimple [
	| generator |
	generator := Generator on: [ :g | g yield: 1; yield: 2 ].
	self assert: generator upToEnd asArray = #( 1 2 )
]
