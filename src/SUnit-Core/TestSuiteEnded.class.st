"
This announcment is thrown when a test suite just finished (more precisly when hisoties are updated)
"
Class {
	#name : #TestSuiteEnded,
	#superclass : #TestCaseAnnouncement,
	#category : #SUnit-Core-Announcements,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:08'
}
TestSuiteEnded class>>result: aResult [

	^ self new
		testResult: aResult;
		yourself
]
