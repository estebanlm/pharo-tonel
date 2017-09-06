"
SUnit test for TestCase class
"
Class {
	#name : #TestCaseTest,
	#superclass : #TestCase,
	#category : #SUnit-Tests-Core,
	#timestamp : 'TorstenBergmann 2/12/2014 23:14'
}

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCaseTest>>testAnnouncement [
	| collection oldCollection suite unitTest |
	unitTest := ClassFactoryForTestCaseTest.
	collection := OrderedCollection new.
	unitTest resetAnnouncer.
	
	self deny: (unitTest shouldAnnounce).
	self deny: (unitTest new shouldAnnounce).
		
	unitTest announcer when: TestCaseAnnouncement do: [:ann | collection add: ann ].

	self assert: (unitTest shouldAnnounce).
	self assert: (unitTest new shouldAnnounce).

	"We run SUnitTest"
	suite := unitTest buildSuite.
	suite run.

	self assert: (collection size = (suite tests size * 2)).
	self assert: (collection select: [:c | c isKindOf: TestCaseStarted]) size = (collection size / 2).
	self assert: (collection select: [:c | c isKindOf: TestCaseEnded]) size =( collection size / 2).
	self assert: (collection allSatisfy: #hasPassed).
	self deny: (collection anySatisfy: #hasFailures).
	
	oldCollection := collection copy.
	unitTest resetAnnouncer.
	unitTest debug: #testClassCreationInDifferentCategories.
	self assert: (collection = oldCollection)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCaseTest>>testAssertEqualsActualAndExpectedOrder [
	self 
		should: [
			self assert: 'actual' equals: 'expected with fairly long print string'
		]
		raise: TestFailure 
		whoseDescriptionIncludes: 'Got ''actual'' instead of ''expected with fairly long print string''.' 
		description: 'In #assert:equals: the first argument is the actual value and the second one is the expected.'.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCaseTest>>testIsUnitTest [

	self assert: TestCase isUnitTest
]
