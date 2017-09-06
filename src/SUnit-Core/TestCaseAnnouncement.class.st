"
This is a common superclass for announcements related to SUnit test cases.

Instance Variables
        testCase:                       <TestCase>
        testResult:                     <TestResult>
        testSelector:           	   <Symbol>

testCase
        - The test case

testResult
        - The result of the test case

testSelector
        - The selector of the test method
"
Class {
	#name : #TestCaseAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'testCase',
		'testSelector',
		'testResult'
	],
	#category : #SUnit-Core-Announcements,
	#timestamp : 'tbn 4/26/2011 09:54'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCaseAnnouncement>>hasErrors [
        "Return true if the test result has errors."
        
        ^testResult hasErrors
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCaseAnnouncement>>hasFailures [
        "Return true if the test result has failures."
        
        ^testResult hasFailures
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCaseAnnouncement>>hasPassed [
        "Return true if the test has passed."
        
        ^testResult hasPassed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCaseAnnouncement>>testCase [
        "Returns the test case."
        
        ^testCase
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCaseAnnouncement>>testCase: aTestCase [
        "Sets the test case to the given test case."
        
        testCase := aTestCase
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCaseAnnouncement>>testResult [
        "Returns the test result."
        
        ^testResult
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCaseAnnouncement>>testResult: aTestResult [
        "Sets the test result to the given test result."
        
        testResult := aTestResult
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCaseAnnouncement>>testSelector [
        "Returns the test selector."
        
        ^testSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
TestCaseAnnouncement>>testSelector: aSymbol [
        "Sets the test selector to the given symbol."
        
        testSelector := aSymbol
]
