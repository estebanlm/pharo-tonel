"
SUnit tests for failing test resources
"
Class {
	#name : #FailingTestResourceTestCase,
	#superclass : #SimpleTestResourceTestCase,
	#category : #SUnit-Tests-Core,
	#timestamp : 'TorstenBergmann 2/12/2014 23:14'
}

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:08'
}
FailingTestResourceTestCase>>clearOuterResourceStateDuring: aBlock [
	"Make the resource impossible to make available, then ensure that every test raises a failure but not an error (which its setUp would do if it reached it and the resource were nil)."

	^super clearOuterResourceStateDuring:
		[SimpleTestResource preventAvailabilityDuring:
			[self should: aBlock raise: self defaultTestFailure]]
]
