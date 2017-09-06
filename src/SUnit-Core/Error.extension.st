Extension {
	#name : #Error
}

{
	#category : #'*SUnit-Core',
	#timestamp : ' 8/31/2017 05:26:08'
}
Error>>sunitAnnounce: aTestCase toResult: aTestResult [
	aTestResult addError: aTestCase.
]
