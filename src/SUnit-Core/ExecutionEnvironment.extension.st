Extension {
	#name : #ExecutionEnvironment
}

{
	#category : #'*SUnit-Core',
	#timestamp : ' 8/31/2017 05:26:08'
}
ExecutionEnvironment>>runTestCase: aTestCase [

	self subclassResponsibility 
]

{
	#category : #'*SUnit-Core',
	#timestamp : ' 8/31/2017 05:26:08'
}
ExecutionEnvironment>>runTestsBy: aBlock [

	self subclassResponsibility 
]
