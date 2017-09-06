"
I am not a test! I provide usage examples for the SUnit debugger.
"
Class {
	#name : #GTSUnitExampleWithSetUpAndNoTearDownTest,
	#superclass : #TestCase,
	#instVars : [
		'a'
	],
	#category : #GT-SUnitDebugger,
	#timestamp : 'TudorGirba 2/19/2016 21:36'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitExampleWithSetUpAndNoTearDownTest class>>isAbstract [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitExampleWithSetUpAndNoTearDownTest class>>isUnitTest [
	^ false
]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitExampleWithSetUpAndNoTearDownTest>>setUp [
	a := 42.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitExampleWithSetUpAndNoTearDownTest>>testWithErrorInSetup [
	self assert: a equals: 41
]
