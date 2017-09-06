"

"
Class {
	#name : #NECClassVarTypeGuesserTest,
	#superclass : #TestCase,
	#category : #NECompletion-Tests,
	#timestamp : ''
}

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECClassVarTypeGuesserTest>>guessVariable: aString in: aClass expected: theClassExpected  [
	| typeGuesser result |
	typeGuesser := NECClassVarTypeGuesser 
		variableName: aString
		class: aClass.
	result := typeGuesser perform.
	self assert: result == theClassExpected
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECClassVarTypeGuesserTest>>testClassVar [
	self
		guessVariable: 'ClassVar'
		in: NECTestClass
		expected: ByteString
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECClassVarTypeGuesserTest>>testDependentsFieldsClassVar [
	self
		guessVariable: 'DependentsFields'
		in: NECTestClass
		expected: WeakIdentityKeyDictionary
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECClassVarTypeGuesserTest>>testSuperClassVar [
	self
		guessVariable: 'SuperClassVar'
		in: NECTestClass
		expected: Dictionary 
]
