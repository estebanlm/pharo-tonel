"
I am not a test! I provide usage examples for the SUnit debugger.
"
Class {
	#name : #GTSUnitExampleWithSetUpAndTearDownTest,
	#superclass : #TestCase,
	#instVars : [
		'a'
	],
	#category : #GT-SUnitDebugger,
	#timestamp : 'TudorGirba 2/19/2016 21:37'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitExampleWithSetUpAndTearDownTest class>>isAbstract [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitExampleWithSetUpAndTearDownTest class>>isUnitTest [
	^ false
]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitExampleWithSetUpAndTearDownTest>>setUp [
	a := 42.
]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitExampleWithSetUpAndTearDownTest>>tearDown [
	a := nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitExampleWithSetUpAndTearDownTest>>testWithErrorInSetup [
	self assert: a equals: 41
]
