"
SUnit tests for extensions to SUnit
"
Class {
	#name : #SUnitExtensionsTest,
	#superclass : #TestCase,
	#instVars : [
		'stream'
	],
	#category : #SUnit-Tests-Core,
	#timestamp : 'TorstenBergmann 2/12/2014 23:15'
}

{
	#category : #history,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest class>>lastStoredRun [
	^ ((Dictionary new) add: (#passed->((Set new) add: #testNoExceptionWithMatchingString; add: #testNoExceptionWithNoMatchingString; add: #testExceptionWithMatchingString; add: #testExceptionWithoutMatchingString; add: #testValidShouldNotTakeMoreThan; add: #testInvalidShouldNotTakeMoreThanMilliseconds; add: #testDifferentExceptionInShouldRaiseWithExceptionDo; add: #testShouldRaiseWithExceptionDo; add: #testShouldFix; add: #testAssertionFailedInRaiseWithExceptionDo; add: #testAutoDenyFalse; add: #testAutoDenyTrue; add: #testAutoAssertFalse; add: #testAutoAssertTrue; add: #testValidShouldNotTakeMoreThanMilliseconds; add: #testErrorInRaiseWithExceptionDo; add: #testNoExceptionInShouldRaiseWithExceptionDo; add: #testInvalidShouldNotTakeMoreThan; yourself)); add: (#timeStamp->'22 November 2008 10:11:35 pm'); add: (#failures->((Set new))); add: (#errors->((Set new))); yourself)
]

{
	#category : #'real tests',
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>assertionFailedInRaiseWithExceptionDoTest [

	self 
		should: [ Error signal ]
		raise: Error
		withExceptionDo: [ :anException | self assert: false ]
]

{
	#category : #'real tests',
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>differentExceptionInShouldRaiseWithExceptionDoTest [

	[ self 
		should: [ Error signal ]
		raise: Halt
		withExceptionDo: [ :anException | self assert: false description: 'should:raise:withExceptionDo: handled an exception that should not handle'] ]
	on: Error
	do: [ :anException | anException return: nil ]
]

{
	#category : #'real tests',
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>errorInRaiseWithExceptionDoTest [

	self 
		should: [ Error  signal ]
		raise: Error
		withExceptionDo: [ :anException | Error signal: 'A forced error' ]
]

{
	#category : #'test support',
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>failureLog [
	^self stream
]

{
	#category : #'real tests',
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>invalidShouldNotTakeMoreThan [

	self should: [(Delay forMilliseconds: 100) wait] notTakeMoreThan: 50 milliSeconds.
]

{
	#category : #'real tests',
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>invalidShouldNotTakeMoreThanMilliseconds [

	self should: [(Delay forMilliseconds: 100) wait] notTakeMoreThanMilliseconds: 50
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>isLogging [
	^true
]

{
	#category : #'real tests',
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>noExceptionInShouldRaiseWithExceptionDoTest [

	self 
		should: [  ]
		raise: Error
		withExceptionDo: [ :anException | Error signal: 'Should not get here' ]
]

{
	#category : #'real tests',
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>shouldFixTest [

	self shouldFix: [ Error signal: 'any kind of error' ]

]

{
	#category : #'real tests',
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>shouldRaiseWithExceptionDoTest [

	self 
		should: [ Error signal: '1' ]
		raise: Error
		withExceptionDo: [ :anException | self assert: anException messageText = '1' ]
]

{
	#category : #'real tests',
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>shouldRaiseWithSignalDoTest [

	self 
		should: [ Error signal: '1' ]
		raise: Error
		withExceptionDo: [ :anException | self assert: anException messageText = '1' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>stream [
	^stream ifNil: [stream := String new writeStream].
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>testAssertionFailedInRaiseWithExceptionDo [

	| testCase testResult  |
	
	testCase := self class selector: #assertionFailedInRaiseWithExceptionDoTest.
	testResult := testCase run.
	
	self assert: (testResult failures includes: testCase).
	self assert: testResult failures size=1.
	self assert: testResult passed isEmpty.
	self assert: testResult errors isEmpty.
	
	
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>testAutoAssertFalse [
	| booleanCondition |
	self assert: self isLogging.
	self should: [ self assert: 1 = 2 description: 'self assert: 1 = 2' ] raise: self defaultTestFailure.
	booleanCondition := (self stream contents substrings: {Character cr}) last = 'self assert: 1 = 2'.
	self assert: booleanCondition
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>testAutoAssertTrue [
	self assert: 1 = 1.
	self assert: true
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>testAutoDenyFalse [
	| booleanCondition |
	self assert: self isLogging.
	self should: [ self deny: 1 = 1 description: 'self deny: 1 = 1'.] raise: self defaultTestFailure.
	booleanCondition := (self stream contents substrings:  {Character cr}) last = 'self deny: 1 = 1'.
	self assert: booleanCondition
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>testAutoDenyTrue [
	self deny: 1 = 2.
	self deny: false
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>testDifferentExceptionInShouldRaiseWithExceptionDo [

	| testCase testResult  |
	
	testCase := self class selector: #differentExceptionInShouldRaiseWithExceptionDoTest.
	testResult := testCase run.
	
	self assert: (testResult passed includes: testCase).
	self assert: testResult errors isEmpty.
	self assert: testResult failures isEmpty.
	self assert: testResult passed size=1
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>testErrorInRaiseWithExceptionDo [

	| testCase testResult  |
	
	testCase := self class selector: #errorInRaiseWithExceptionDoTest.
	testResult := testCase run.
		
	self assert: (testResult errors includes: testCase).
	self assert: testResult errors size=1.
	self assert: testResult failures isEmpty.
	self assert: testResult passed isEmpty.
	
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>testExceptionWithMatchingString [
	self should: [ Object obsolete ] raise: Error whoseDescriptionIncludes: 'NOT obsolete' description: 'tested obsoleting Object'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>testExceptionWithoutMatchingString [
	self 
		should: [ Object obsolete ]
		raise: Error
		whoseDescriptionDoesNotInclude: 'Zero'
		description: 'tested obsoleting Object'
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>testInvalidShouldNotTakeMoreThan [

	| testCase testResult |

	testCase := self class selector: #invalidShouldNotTakeMoreThan.
	testResult := testCase run.

	self assert: testResult passed isEmpty.
	self assert: testResult failures size = 1.
	self assert: (testResult failures includes: testCase).
	self assert: testResult errors isEmpty


]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>testInvalidShouldNotTakeMoreThanMilliseconds [

	| testCase testResult |

	testCase := self class selector: #invalidShouldNotTakeMoreThanMilliseconds.
	testResult := testCase run.

	self assert: testResult passed isEmpty.
	self assert: testResult failures size = 1.
	self assert: (testResult failures includes: testCase).
	self assert: testResult errors isEmpty


]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>testNoExceptionInShouldRaiseWithExceptionDo [

	| testCase testResult  |
	
	testCase := self class selector: #noExceptionInShouldRaiseWithExceptionDoTest.
	testResult := testCase run.
	
	self assert: (testResult failures includes: testCase).
	self assert: testResult failures size=1.
	self assert: testResult passed isEmpty.
	self assert: testResult errors isEmpty.
	
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>testNoExceptionWithMatchingString [
	self 
		shouldnt: [ Object messageNotUnderstoodByObject ]
		raise: MessageNotUnderstood 
		whoseDescriptionIncludes: 'Zero'
		description: 'tested obsoleting Object'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>testNoExceptionWithNoMatchingString [
	self
		shouldnt: [ Object messageNotUnderstoodByObject ]
		raise: MessageNotUnderstood
		whoseDescriptionDoesNotInclude: 'messageNotUnderstoodByObject'
		description: 'tested obsoleting Object'
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>testShouldFix [

	| testCase testResult  |
	
	testCase := self class selector: #shouldFixTest.
	testResult := testCase run.
	
	self assert: (testResult passed includes: testCase).
	self assert: testResult passed size=1.
	self assert: testResult failures isEmpty.
	self assert: testResult errors isEmpty.
	
	
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>testShouldRaiseWithExceptionDo [

	| testCase testResult  |
	
	testCase := self class selector: #shouldRaiseWithExceptionDoTest.
	testResult := testCase run.
	
	self assert: (testResult passed includes: testCase).
	self assert: testResult passed size=1.
	self assert: testResult failures isEmpty.
	self assert: testResult errors isEmpty.
	
	
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>testValidShouldNotTakeMoreThan [
	| testCase testResult |

	testCase := self class selector: #validShouldNotTakeMoreThan.
	testResult := testCase run.

	self assert: (testResult passed includes: testCase).
	self assert: testResult passed size = 1.
	self assert: testResult failures isEmpty.
	self assert: testResult errors isEmpty


]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>testValidShouldNotTakeMoreThanMilliseconds [

	| testCase testResult |

	testCase := self class selector: #validShouldNotTakeMoreThanMilliseconds.
	testResult := testCase run.

	self assert: (testResult passed includes: testCase).
	self assert: testResult passed size = 1.
	self assert: testResult failures isEmpty.
	self assert: testResult errors isEmpty


]

{
	#category : #'real tests',
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>validShouldNotTakeMoreThan [

	self should: [(Delay forMilliseconds: 100) wait] notTakeMoreThan:  200 milliSeconds.
]

{
	#category : #'real tests',
	#timestamp : ' 8/31/2017 05:26:08'
}
SUnitExtensionsTest>>validShouldNotTakeMoreThanMilliseconds [

	self should: [(Delay forMilliseconds: 100) wait] notTakeMoreThanMilliseconds: 200
]
