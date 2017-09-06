Extension {
	#name : #CurrentExecutionEnvironment
}

{
	#category : #'*SUnit-Core',
	#timestamp : ' 8/31/2017 05:26:08'
}
CurrentExecutionEnvironment class>>runTestCase: aTestCase [

	self value runTestCase: aTestCase

]

{
	#category : #'*SUnit-Core',
	#timestamp : ' 8/31/2017 05:26:08'
}
CurrentExecutionEnvironment class>>runTestsBy: aBlock [

	self value runTestsBy: aBlock
]
