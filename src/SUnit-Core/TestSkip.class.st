"
I mark a test as being skipped.
"
Class {
	#name : #TestSkip,
	#superclass : #Exception,
	#category : #SUnit-Core-Extensions,
	#timestamp : '<historical>'
}

{
	#category : #'exception handling',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSkip>>defaultAction [
	"nothing to do.
	If I am not handled I might trigger an Assertion failure later on."
]

{
	#category : #'exception handling',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSkip>>sunitAnnounce: aTestCase toResult: aTestResult [
	aTestResult addSkip: aTestCase.
]
