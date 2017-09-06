"
Hudson report for test results
"
Class {
	#name : #HDTestReport,
	#superclass : #HDReport,
	#instVars : [
		'suite',
		'stream',
		'suitePosition',
		'suiteTime',
		'suiteFailures',
		'suiteErrors',
		'progressFile'
	],
	#category : #JenkinsTools-Core,
	#timestamp : 'TorstenBergmann 2/12/2014 22:31'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport class>>runClasses: aCollectionOfClasses named: aString [
	| suite classes |
	suite := TestSuite named: aString.
	classes := (aCollectionOfClasses
		select: [ :each | (each includesBehavior: TestCase) and: [ each isAbstract not ] ])
			asSortedCollection: [ :a :b | a name <= b name ].
	classes isEmpty
		ifTrue: [ ^ nil ].
	classes
		do: [ :each | each addToSuiteFromSelectors: suite ].
	^ self runSuite: suite
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport class>>runPackage: aString [
	^ self runClasses: (RPackage organizer packageNamed: aString) definedClasses named: aString
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport class>>runSuite: aTestSuite [
	^ self new
		initializeOn: aTestSuite; 
		run;
		done
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>beginTestCase: aTestCase runBlock: aBlock [
	| time |
	progressFile 
		nextPutAll: 'starting testcase: ' ; 
		nextPutAll: aTestCase class name; 
		nextPutAll:'>>';
		nextPutAll: aTestCase selector; 
		nextPutAll: ' ... '; 
		flush.
		
	time := aBlock timeToRun.
	stream tab; 
		nextPutAll: '<testcase classname="'; 
		nextPutAll: (self encode: (aTestCase class category copyReplaceAll: '-' with: '.')); 
		nextPut: $.; nextPutAll: (self encode: aTestCase class name); 
		nextPutAll: '" name="'; nextPutAll: (self encode: aTestCase selector); 
		nextPutAll: '" time="'; print: (time asMilliSeconds / 1000.0); 
		nextPutAll: '">'; lf
	

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>done [
	"just close the file"
	[ progressFile close ] on: Error do: []
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>endTestCase [
	stream tab; nextPutAll: '</testcase>'; lf.
	progressFile nextPutAll: 'finished' ; crlf; flush.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>hasErrors  [
	^ suiteErrors ~= 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>hasFailures  [
	^ suiteFailures ~= 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>hasFailuresOrErrors  [
	^ self hasFailures or: [ self hasErrors ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>initialize [

	| aFile |

	super initialize.
	suiteTime := 0 asDuration.
	suitePosition := suiteFailures := suiteErrors := 0.
	
	aFile := File named: 'progress.log'.
	aFile delete.
	progressFile := ZnCharacterWriteStream
			on: (aFile writeStream setToEnd; yourself)
			encoding: 'utf8'.	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>initializeOn: aTestSuite [
	suite := aTestSuite
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>run [
	Author uniqueInstance
		ifUnknownAuthorUse: 'hudson'
		during: [ [ 
			self setUp.
			suiteTime := [ self runAll ]
				timeToRun ]
					ensure: [ self tearDown ] ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>runAll [
	CurrentExecutionEnvironment runTestsBy: [ 
		suite tests do: [ :each | each run: self ]
	]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>runCase: aTestCase [
	| error stack  |
	self
		beginTestCase: aTestCase
		runBlock: [ [ [ aTestCase runCaseManaged ]
			on: Halt, Error, TestFailure
			do: [ :err |
				error := err.
				aTestCase shouldPass ifTrue: [
					self
						serializeError: error
						of: aTestCase ].
				stack := self
					stackTraceString: err
					of: aTestCase ]]
						on: TestSkip
						do: [ :err | "nothing to do..." ] ].
	
	self
		writeError: error
		andStack: stack
		for: aTestCase.
	self endTestCase
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>serializeError: error of: aTestCase [
	"We got an error from a test, let's serialize it so we can properly debug it later on..."
	
	self class environment at: #FuelOutStackDebugAction ifPresent: [ :fuelOutStackDebugAction |
		| context testCaseMethodContext |
		context := error signalerContext.
		testCaseMethodContext := context findContextSuchThat: [ :ctx| 
			ctx receiver == aTestCase and: [ ctx methodSelector == #performTest ]].
		context := context copyTo: testCaseMethodContext.
		
		[ fuelOutStackDebugAction
			serializeTestFailureContext: context sender 		
			toFileNamed: aTestCase class name asString,'-', aTestCase selector, '.fuel'	] 
		on: Error 
		do: [:err| "simply continue..." ]
	].


]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>setUp [

	| aFile |
	
	progressFile nextPutAll: 'running suite: ';
		nextPutAll: suite name ; crlf; flush.
		
	aFile := File named: suite name , '-Test.xml'.
	aFile delete.
	stream := ZnCharacterWriteStream
			on: (aFile writeStream setToEnd; yourself)
			encoding: 'utf8'.	
		
	stream nextPutAll: '<?xml version="1.0" encoding="UTF-8"?>'; lf.
	stream nextPutAll: '<testsuite name="'; nextPutAll: (self encode: suite name); 
		nextPutAll: '" tests="'; print: suite tests size; nextPutAll: '">'.
	
	"Now this is ugly. We want to update the time and the number of failures and errors, but still at the same time stream a valid XML. So remember this position and add some whitespace, that we can fill later."
	suitePosition := stream wrappedStream position - 1.
	stream nextPutAll: (String new: 100 withAll: $ ); lf.
	
	"Initialize the test resources."
	suite resources do: [ :each |
		each isAvailable
			ifFalse: [ each signalInitializationError ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>stackTraceString: err of: aTestCase [
	^ String streamContents: [ :str | 
		| context |
		context := err signalerContext.
		[ context isNil or: [ context receiver == aTestCase and: [ context methodSelector == #runCase ] ] ] whileFalse: [
			[str print: context; lf.] ifError: [ str nextPutAll: 'PRINTING ERROR'; lf].
			context := context sender ] ] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>suiteErrors [
	^ suiteErrors
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>suiteFailures [
	^ suiteFailures
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>suitePassing  [
	^ self suiteTotal - self suiteFailures - self suiteErrors
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>suiteTotal [
	^ suite 
		ifNotNil: [ suite tests size ]
		ifNil: [ 0 ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>tearDown [
	suite resources 
		do: [ :each | each reset ].
		
	stream tab; nextPutAll: '<system-out><![CDATA[]]></system-out>'; lf.
	stream tab; nextPutAll: '<system-err><![CDATA[]]></system-err>'; lf.
	stream nextPutAll: '</testsuite>'.
	
	stream wrappedStream position: suitePosition.
	stream 
		nextPutAll: ' failures="'; print: suiteFailures; 
		nextPutAll: '" errors="'; print: suiteErrors; 
		nextPutAll: '" time="'; print: suiteTime asMilliSeconds / 1000.0; 
		nextPutAll: '">'.
	stream close.
	
	progressFile 
		nextPutAll: 'finished running suite: ';
		nextPutAll: suite name;
		close
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>writeError: anError andStack: aString for: aTestCase [
	"XML tag is now open"
	anError
		ifNotNil: [
			aTestCase shouldPass ifTrue: [
				(anError isKindOf: TestFailure)
					ifTrue: [ self writeFailure: anError stack: aString ]
					ifFalse: [ self writeError: anError stack: aString ] ] ]
		ifNil: [
			aTestCase shouldPass ifFalse: [
				self writeFailure: TestFailure new stack: 'Unexpected failure' ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>writeError: error stack: stack [
	suiteErrors := suiteErrors + 1.
	stream tab; tab; nextPutAll: '<error type="'.
	self writeException: error stack: stack.
	stream nextPutAll: '</error>'; lf
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>writeException: error stack: stack. [

	stream 
		nextPutAll: (self encode: error class name); 
		nextPutAll: '" message="'; nextPutAll: (self encode: (error messageText ifNil: [ error description ])); 
		nextPutAll: '">'; 
		nextPutAll: (self encode: stack).
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDTestReport>>writeFailure: error stack: stack [
	suiteFailures := suiteFailures + 1.
	stream tab; tab; nextPutAll: '<failure type="'.
	self writeException: error stack: stack.  
	stream	nextPutAll: '</failure>'; lf
]
