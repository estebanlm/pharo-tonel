"
SUnit tests for PointerFinder
"
Class {
	#name : #PointerFinderTest,
	#superclass : #TestCase,
	#category : #Tools-Test-PointerFinder,
	#timestamp : 'TorstenBergmann 2/4/2014 20:46'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:47'
}
PointerFinderTest>>testBasic1 [

	| myObject myArray |
	myObject := Object new.
	myArray := {myObject . myObject}.
	self assert: (myObject pointersTo) asArray = {myArray}
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:47'
}
PointerFinderTest>>testCycle [

	| myObject myArray myArray2 pointingObjects |
	myObject := Object new.
	myArray := {myObject . myObject}.
	myArray2 := {myObject . myArray}.

	pointingObjects := (myObject pointersTo) asArray.
	self assert: pointingObjects size = 2.
	self assert: (pointingObjects includesAll: {myArray . myArray2}).
	
	"PointerFinder loops in presence of cycles"
"	myArray at: 1 put: myArray.
	pointingObjects := (PointerFinder pointersTo: myObject) asArray.
	self assert: pointingObjects = {myArray}.
"
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:47'
}
PointerFinderTest>>testNoPointingObject [

	| myObject |
	myObject := Object new.
	self assert: (myObject pointersTo) isEmpty
]
