"
I understand methods beginning #assert:... and #deny:... (and my class-side understands #assert:description:).  I am the superclass of TestCase and TestResource and can also be the superclass of any test helper classes you create to factor out test behaviour.  I exist so that test code can be refactored between my subclasses without difficulty.

Send #assert:description: when you want to check for an expected value. For example, you might say
	self assert: socket isOpen description: 'We requested a socket but now it is not open'.
to test whether or not a socket is open at a point in a test.  Use description strings both to give more information about where a test failed in debugger notifiers and logs, and to document the intent of a test.  Other methods include #assert:, #assert:description:resumable:, #deny:, #deny:description:, #deny:description:resumable:, #should:raise:, #should:raise:description:, #shouldnt:raise:, #shouldnt:raise:description:.  All these methods are defined on the superclass, TestAsserter.  (Any convenience assertion methods you create for general use should also be defined in my 'convenience' protocol.)

Override my class-side #isLogging in subclasses to have failed assertion descriptions shown on the Transcript.  To have them appear elsewhere, also override my class-side #failureLog.

"
Class {
	#name : #TestAsserter,
	#superclass : #Object,
	#category : #SUnit-Core-Kernel,
	#timestamp : '<historical>'
}

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter class>>assert: aBoolean description: aString [
	"Minimal clone of the instance-side assert protocol so that class-side methods can use it."

	aBoolean ifFalse:
		[self logFailure: aString.
		self classForTestResult failure signal: aString].
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter class>>classForTestResult [
	"Returns the class of the test result"
	^ TestResult
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter class>>classForTestSuite [
	^ TestSuite
]

{
	#category : #logging,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter class>>failureLog [
	^Transcript
]

{
	#category : #logging,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter class>>isLogging [
	"By default, we're not logging failures. Override in subclasses as desired."

	^false
]

{
	#category : #logging,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter class>>logFailure: aString [
	self isLogging ifTrue:
		[self failureLog cr; nextPutAll: aString; flush].
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter class>>methodPassed: aSelector [

	^ false
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter class>>suiteClass [
	^TestSuite
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>assert: aBoolean [
	aBoolean ifFalse:
		[self logFailure: 'Assertion failed'.
		self defaultTestFailure signal: 'Assertion failed'].
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>assert: actualNumber closeTo: expectedNumber [
	^ self
		assert: (actualNumber closeTo: expectedNumber)
		description: [self comparingStringBetween: actualNumber and: expectedNumber]
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>assert: aBooleanOrBlock description: aStringOrBlock [
	aBooleanOrBlock value ifFalse: [
		| aString |
		aString := aStringOrBlock value.
		self logFailure: aString.
		self classForTestResult failure signal: aString]
			
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>assert: aBooleanOrBlock description: aStringOrBlock resumable: resumableBoolean  [
	| exception |
	aBooleanOrBlock value
		ifFalse: 
			[|aString|
			aString := aStringOrBlock value.
			self logFailure: aString.
			exception := resumableBoolean
						ifTrue: [self classForTestResult resumableFailure]
						ifFalse: [self classForTestResult failure].
			exception signal: aString]
			
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>assert: actual equals: expected [
	^ self
		assert: expected = actual
		description: [self comparingStringBetween: actual and: expected]
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>assertCollection: actual equals: expected [
	"Specialized test method that generates a proper error message for collection"
	^ self
		assert: expected = actual
		description: [ self comparingCollectionBetween: actual and: expected ]
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>assertCollection: actual hasSameElements: expected [
	"Assert that a collection contains the same elements as the given collection. Order is not checked, only the presence/absence of elements."
	| missingElements additionalElements |
	
	additionalElements := actual difference: expected.
	missingElements := expected difference: (actual intersection: expected).
	self 
		assert: (additionalElements isEmpty and: [ missingElements isEmpty ])
		description: (String streamContents: 
			[:stream |
			stream
				nextPutAll: 'Given Collections do not match!'; lf;
				tab; nextPutAll: 'additions : '; print: additionalElements asArray; lf;
				tab; nextPutAll: 'missing: '; print: missingElements asArray; lf ])
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>classForTestResource [
	^ TestResource
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>classForTestResult [
	"Returns the class of the test result"
	
	"note that we did not name this method testResultClass because it is considered by tools as a test method."
	^ self class classForTestResult
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>classForTestSuite [
	"Returns the class of the test suite"
	
	"note that we did not name this method testSuiteClass because it is considered by tools as a test method. it could be suiteClass"
	^ self class classForTestSuite
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>comparingCollectionBetween: left and: right [
	| additionalLeft additionalRight sortBlock|
	
	"use a very slow sort block"
	sortBlock := [ :a :b | a asString <= b asString ].
	additionalLeft := (left difference: right) sorted: sortBlock.
	additionalRight := (right difference: left) sorted: sortBlock. 
	
	^ String streamContents: [:stream |
		stream
			nextPutAll: 'Given Collections do not match. Got '; lf;
			tab; nextPutAll: 'left := '; print: left; nextPut: $.; lf;
			nextPutAll: ' instead of ';
			tab; nextPutAll: ' right :='; print: right; nextPut: $.; lf.
		left size = right size
			ifFalse: [ 
				stream 
					nextPutAll: 'Collection size does not match: left='; 
					print: left size;
					nextPutAll: ' vs. right=';
					print: right size; lf ].
		additionalLeft isEmpty
			ifFalse: [ 
				stream 
					nextPutAll: 'Got ';
					print: additionalLeft size;
					nextPutAll: ' additional element(s) in the left collection: ';
					tab; print: additionalLeft  ].
		additionalRight isEmpty
			ifFalse: [ 
				stream 
					nextPutAll: 'Got ';
					print: additionalRight size;
					nextPutAll: ' additional element(s) in the right collection: ';
					tab; print: additionalRight  ]]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>comparingStringBetween: actual and: expected [

	^ String streamContents: [:stream |
			stream
				nextPutAll: 'Got ';
				nextPutAll: actual fullPrintString;
				nextPutAll: ' instead of ';
				nextPutAll: expected fullPrintString;
				nextPutAll: '.']
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>defaultTestError [

	^ self classForTestResult error
]

{
	#category : #factory,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>defaultTestFailure [

	^ self classForTestResult failure
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>deny: aBooleanOrBlock [

	self assert: aBooleanOrBlock value not
			
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>deny: aBooleanOrBlock description: aString [
	self assert: aBooleanOrBlock value not description: aString
			
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>deny: aBooleanOrBlock description: aString resumable: resumableBoolean  [
	self
		assert: aBooleanOrBlock value not
		description: aString
		resumable: resumableBoolean
			
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>executeShould: aBlock inScopeOf: anExceptionalEvent  [
	^[aBlock value.
 	false] on: anExceptionalEvent
		do: [:ex | ex return: true]
			
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>executeShould: aBlock inScopeOf: anExceptionalEvent withDescriptionNotContaining: aString [
	^[aBlock value.
 	false] on: anExceptionalEvent
		do: [:ex | ex return: (ex description includesSubstring: aString) not ]
			
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>executeShould: aBlock inScopeOf: anException withExceptionDo: anotherBlock [

	^[aBlock value.
 	false] 
		on: anException
		do: [:exception | 
			anotherBlock value: exception.
			exception return: true]
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>fail [

	^self assert: false
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>fail: aDescriptionString [

	^self assert: false description: aDescriptionString
]

{
	#category : #logging,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>logFailure: aString [
	self class logFailure: aString.
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>should: aBlock [
	self assert: aBlock value
			
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>should: aBlock description: aString [
	self assert: aBlock value description: aString
			
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>should: aBlock notTakeMoreThan: aDuration [
    "Evaluate aBlock and if it takes more than given duration
    to run we report a test failure. "

	^ aBlock valueWithin: aDuration onTimeout: [
		self 
			assert: false 
			description: ['Block evaluation took more than the expected <1p>' expandMacrosWith: aDuration]
	]
	

]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>should: aBlock notTakeMoreThanMilliseconds: anInteger [
    "For compatibility with other Smalltalks"

   self should: aBlock notTakeMoreThan: (Duration milliSeconds: anInteger).
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>should: aBlock raise: anExceptionalEvent  [
	^self assert: (self executeShould: aBlock inScopeOf: anExceptionalEvent)
			
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>should: aBlock raise: anExceptionalEvent description: aString  [
	^self assert: (self executeShould: aBlock inScopeOf: anExceptionalEvent)
		description: aString
			
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>should: aBlock raise: anExceptionalEvent whoseDescriptionDoesNotInclude: substring description: aString  [
	^self assert: (self executeShould: aBlock inScopeOf: anExceptionalEvent withDescriptionNotContaining: substring)
		description: aString

]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>should: aBlock raise: anExceptionalEvent whoseDescriptionIncludes: substring description: aString  [
	^self assert: (self executeShould: aBlock inScopeOf: anExceptionalEvent withDescriptionContaining: substring)
		description: aString

]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>should: aBlock raise: anException withExceptionDo: anotherBlock  [

	^self assert: (self executeShould: aBlock inScopeOf: anException withExceptionDo: anotherBlock)
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>shouldFix: aBlock  [
	"Run the block expecting an Exception. Throw an assertion failure if the block does NOT throw an exception."
	^self should: aBlock raise: Exception
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>shouldnt: aBlock [
	self deny: aBlock value
			
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>shouldnt: aBlock description: aString [
	self deny: aBlock value description: aString
			
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>shouldnt: aBlock raise: anExceptionalEvent   [
	 
	^self assert: (self executeShould: aBlock inScopeOf: anExceptionalEvent) not
			
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>shouldnt: aBlock raise: anExceptionalEvent description: aString   [
 
	^self
		assert: (self executeShould: aBlock inScopeOf: anExceptionalEvent) not
		description: aString
			
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>shouldnt: aBlock raise: anExceptionalEvent whoseDescriptionDoesNotInclude: substring description: aString  [
	 
	^self
		assert: (self executeShould: aBlock inScopeOf: anExceptionalEvent withDescriptionNotContaining: substring) not
		description: aString

]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>shouldnt: aBlock raise: anExceptionalEvent whoseDescriptionIncludes: substring description: aString   [
	 
	^self 
		assert: (self executeShould: aBlock inScopeOf: anExceptionalEvent withDescriptionContaining: substring) not
		description: aString

]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>signalFailure: aString [
	self classForTestResult failure signal: aString
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>skip [
	"Don't run this test, and don't mark it as failure"
	TestSkip signal
]

{
	#category : #extensions,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestAsserter>>skip: aComment [
	"Don't run this test, and don't mark it as failure"
	TestSkip signal: aComment
]
