"
SUnit tests for integer arrays
"
Class {
	#name : #IntegerArrayTest,
	#superclass : #TestCase,
	#category : #Collections-Tests-Arrayed,
	#timestamp : 'TorstenBergmann 2/20/2014 15:29'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
IntegerArrayTest>>testAt [
	| array |
	array := IntegerArray new: 5 withAll: 2.
	self assert: (array at: 3) = 2.
	
	array at: 3 put: 5.
	self assert: (array at: 3) = 5

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
IntegerArrayTest>>testPutAllNegative [
	| array |
	array := IntegerArray new: 2.
	array  atAllPut: -1000.
	self assert: (array at: 2) = -1000
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
IntegerArrayTest>>testPutNegative [
	| array |
	array := IntegerArray new: 2.
	array at: 2 put: -1000.
	self assert: (array at: 2) = -1000
]
