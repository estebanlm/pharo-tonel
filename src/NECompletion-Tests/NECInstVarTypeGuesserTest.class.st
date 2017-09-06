"

"
Class {
	#name : #NECInstVarTypeGuesserTest,
	#superclass : #TestCase,
	#category : #NECompletion-Tests,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECInstVarTypeGuesserTest>>guessVariable: aString in: aClass expected: theClassExpected  [
	| typeGuesser result |
	typeGuesser := NECInstVarTypeGuesser 
		variableName: aString
		class: aClass.
	result := typeGuesser perform.
	self assert: result == theClassExpected
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECInstVarTypeGuesserTest>>testComplexInit [
	self
		guessVariable: 'complexInit'
		in: NECTestClass
		expected: nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECInstVarTypeGuesserTest>>testComplexInit2 [
	self 
		guessVariable: 'complexInit2'
		in: NECTestClass
		expected: Dictionary
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECInstVarTypeGuesserTest>>testConstantArray [
	self 
		guessVariable: 'constantArray'
		in: NECTestClass
		expected: Array
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECInstVarTypeGuesserTest>>testConstantBoolean [
	self 
		guessVariable: 'constantBoolean'
		in: NECTestClass
		expected: True
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECInstVarTypeGuesserTest>>testConstantInteger [
	self 
		guessVariable: 'constantInteger'
		in: NECTestClass
		expected: SmallInteger
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECInstVarTypeGuesserTest>>testConstantIntegerNil [
	self
		guessVariable: 'constantNil'
		in: NECTestClass
		expected: nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECInstVarTypeGuesserTest>>testConstantString [
	self
		guessVariable: 'constantString'
		in: NECTestClass
		expected: ByteString
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECInstVarTypeGuesserTest>>testConstantSymbol [
	self
		guessVariable: 'constantSymbol'
		in: NECTestClass
		expected: ByteSymbol
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECInstVarTypeGuesserTest>>testGlobalVarKeyword [
	self
		guessVariable: 'globalVarKeyword'
		in: NECTestClass
		expected: SortedCollection
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECInstVarTypeGuesserTest>>testGlobalVarKeyword2 [
	self
		guessVariable: 'globalVarKeyword2'
		in: NECTestClass
		expected: SortedCollection
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECInstVarTypeGuesserTest>>testMessageSend [
	self 
		guessVariable: 'messageSend'
		in: NECTestClass
		expected: Dictionary
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECInstVarTypeGuesserTest>>testMessageSend2 [
	self 
		guessVariable: 'messageSend2'
		in: NECTestClass
		expected: nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECInstVarTypeGuesserTest>>testSuperWithAnotherInit [
	self 
		guessVariable: 'superInstVar'
		in: NECTestClass
		expected: Dictionary
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NECInstVarTypeGuesserTest>>testTypeSuggestingParameter [
	self 
		guessVariable: 'typeSuggestingParameter2'
		in: NECTestClass
		expected: Rectangle
]
