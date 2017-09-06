Extension {
	#name : #DefaultExecutionEnvironment
}

{
	#category : #'*SUnit-Core',
	#timestamp : ' 8/31/2017 05:26:08'
}
DefaultExecutionEnvironment>>runTestCase: aTestCase [

	| testEnv |
	testEnv := TestExecutionEnvironment new.
	
	testEnv beActiveDuring: [
		testEnv runTestCase: aTestCase]
]

{
	#category : #'*SUnit-Core',
	#timestamp : ' 8/31/2017 05:26:08'
}
DefaultExecutionEnvironment>>runTestsBy: aBlock [

	TestExecutionEnvironment new beActiveDuring: aBlock
]
