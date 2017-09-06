"
The test framework distinguishes between failures and errors.  A failure is an event whose possibiity is explicitly anticipated and checked for in an assertion, whereas an error is an unanticipated problem like a division by 0 or an index out of bounds.  TestFailure is raised when the boolean parameter of an assert: ... or deny: ... call is the opposite of what the assertion claims.
"
Class {
	#name : #TestFailure,
	#superclass : #Exception,
	#category : #SUnit-Core-Kernel,
	#timestamp : '<historical>'
}

{
	#category : #'camp smalltalk',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestFailure>>defaultAction [

	Processor activeProcess
		debug: self signalerContext
		title: self description
]

{
	#category : #'camp smalltalk',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestFailure>>isResumable [
	
	^ false
]

{
	#category : #'camp smalltalk',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestFailure>>sunitAnnounce: aTestCase toResult: aTestResult [
	aTestResult addFailure: aTestCase.
]
