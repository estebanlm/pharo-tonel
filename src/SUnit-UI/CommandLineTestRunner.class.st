"
I am command line test runner. I run a TestSuite and outpout the progress in a terminal friendly way.
"
Class {
	#name : #CommandLineTestRunner,
	#superclass : #HDTestReport,
	#instVars : [
		'stderr',
		'stdout',
		'currentTest',
		'maxTest',
		'shouldSerializeError'
	],
	#category : #SUnit-UI,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>createStderr [
	^ Stdio stderr
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>createStdout [
	^ Stdio stdout
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>done [
	
]

{
	#category : #helper,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>handleFailure: anError of: aTestCase  [
	(anError isNil or: [aTestCase isExpectedFailure])  ifTrue: [ ^ self ].

	(anError isKindOf: TestFailure)
		ifTrue: [ 
			suiteFailures := suiteFailures + 1.
			self printFailure: anError of: aTestCase ]
		ifFalse: [ 
			suiteErrors := suiteErrors + 1.
			self printError: anError of: aTestCase ].
	
	self shouldSerializeError 
		ifTrue: [ self serializeError: anError of: aTestCase ]
]

{
	#category : #helper,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>handleSkip: aTestSkip of: aTestCase  [
	self printSkipOf: aTestCase

]

{
	#category : #helper,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>increaseTestCount [
	currentTest := currentTest + 1.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>initialize [
	super initialize.
	shouldSerializeError := false.
]

{
	#category : #helper,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>print: longErrorMessage short: shortErrorMessage of: aTestCase  [
	| cr |

	cr := OSPlatform current lineEnding.
	self stdout 
		<< (shortErrorMessage trimBoth padRightTo: 10)
		<< aTestCase printString
		<< cr.
	longErrorMessage isEmptyOrNil 
		ifFalse: [ self stdout << longErrorMessage << cr ]
]

{
	#category : #helper,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>printError: anError of: aTestCase  [
	self
		print: (self shortStackDescriptionFor: anError)
		short: ' [ERROR]' 
		of: aTestCase 
]

{
	#category : #helper,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>printFailure: anError of: aTestCase  [
	self
		print: (self shortStackDescriptionFor: anError)
		short: ' [FAIL]' 
		of: aTestCase 
]

{
	#category : #helper,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>printPassOf: aTestCase [
	self
		print: nil
		short: ' [OK]' 
		of: aTestCase 
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>printReport [
	| cr |
	cr := OSPlatform current lineEnding.
	
	self stderr
		<< cr
		<< 'Finished running ' << maxTest asString  
		<< ' Test' << (maxTest = 1 ifTrue: [''] ifFalse: ['s'])
		<< cr
]

{
	#category : #helper,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>printSkipOf: aTestCase [
	self 
		print: nil
		short: ' [SKIPPED]' 
		of: aTestCase
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>printTestCase: aTestCase [

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>runCase: aTestCase [
	self increaseTestCount.
	self printTestCase: aTestCase.
	
	[[ aTestCase runCaseManaged. 
		self printPassOf: aTestCase ] 
		on: Halt , Error, TestFailure
		do: [ :err | self handleFailure: err of: aTestCase ]]
		on: TestSkip do: [ :skip| self handleSkip: skip of: aTestCase ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>setUp [
	
	currentTest := 0.
	maxTest := suite tests size.
]

{
	#category : #helper,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>shortStackDescriptionFor: anError [
	^ (String streamContents: [ :s| 
			s << anError printString; cr.
			anError signalerContext shortDebugStackOn: s ])
		copyReplaceAll: String cr
		with: OSPlatform current lineEnding
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>shouldSerializeError [
	^ shouldSerializeError
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>shouldSerializeError: aBoolean [
	shouldSerializeError := aBoolean.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>stderr [
	(stderr isNil or: [ stderr closed ])
		ifTrue: [ stderr := self createStderr ].
	^ stderr 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>stdout [
	(stdout isNil or: [ stdout closed ])
		ifTrue: [ stdout := self createStdout ].
		
	^ stdout
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:20'
}
CommandLineTestRunner>>tearDown [
	self printReport
]
