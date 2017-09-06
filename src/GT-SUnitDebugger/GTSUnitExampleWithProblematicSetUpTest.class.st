"
I am not a test! I provide usage examples for the SUnit debugger.
"
Class {
	#name : #GTSUnitExampleWithProblematicSetUpTest,
	#superclass : #TestCase,
	#category : #GT-SUnitDebugger,
	#timestamp : 'TudorGirba 2/15/2016 13:40'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitExampleWithProblematicSetUpTest class>>isAbstract [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitExampleWithProblematicSetUpTest class>>isUnitTest [
	^ false
]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitExampleWithProblematicSetUpTest>>setUp [
	42 messageThatIsNotUnderstood
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
GTSUnitExampleWithProblematicSetUpTest>>testWithErrorInSetup [
	self assert: true
]
