Extension {
	#name : #Warning
}

{
	#category : #'*SUnit-Core',
	#timestamp : ' 8/31/2017 05:26:08'
}
Warning>>sunitAnnounce: aTestCase toResult: aTestResult [
	aTestResult addFailure: aTestCase.
]
