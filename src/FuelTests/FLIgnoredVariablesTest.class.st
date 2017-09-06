"
SUnit tests for serialization with ignored variables
"
Class {
	#name : #FLIgnoredVariablesTest,
	#superclass : #FLClassSerializationTest,
	#category : #FuelTests,
	#timestamp : 'TorstenBergmann 2/3/2014 23:26'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLIgnoredVariablesTest>>testAllVariablesIgnored [

	| anObject result aClass |
	aClass := self newClassWithInstanceVariableNames: 'a b'.
	aClass class duringTestCompileSilently: 'fuelIgnoredInstanceVariableNames ^#(a b)'.
	anObject := aClass new
		instVarAt: 1 put: $A;
		instVarAt: 2 put: $B;
		yourself.

	result := self resultOfSerializeAndMaterialize: anObject.

	self assert: (result instVarAt: 1) isNil.
	self assert: (result instVarAt: 2) isNil.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLIgnoredVariablesTest>>testIgnoredValueIsNotMaterialized [

	| anObject materializedInstances aClass |
	aClass := self newClassWithInstanceVariableNames: 'a'.
	aClass class duringTestCompileSilently: 'fuelIgnoredInstanceVariableNames ^#(a)'.
	anObject := aClass new
		instVarAt: 1 put: #A;
		yourself.

	self serialize: anObject.
	materializedInstances := self materializedObjects.

	self deny: (materializedInstances includes: #A)

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLIgnoredVariablesTest>>testOneIgnoredVariable [

	| anObject result aClass |
	aClass := self newClassWithInstanceVariableNames: 'a b c'.
	aClass class duringTestCompileSilently: 'fuelIgnoredInstanceVariableNames ^#(b)'.
	anObject := aClass new
		instVarAt: 1 put: $A;
		instVarAt: 2 put: $B;
		instVarAt: 3 put: $C;
		yourself.

	result := self resultOfSerializeAndMaterialize: anObject.

	self assert: $A = (result instVarAt: 1).
	self assert: nil = (result instVarAt: 2).
	self assert: $C = (result instVarAt: 3)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLIgnoredVariablesTest>>testTwoIgnoredVariables [

	| anObject result aClass |
	aClass := self newClassWithInstanceVariableNames: 'a b c'.
	aClass class duringTestCompileSilently: 'fuelIgnoredInstanceVariableNames ^#(a c)'.
	anObject := aClass new
		instVarAt: 1 put: $A;
		instVarAt: 2 put: $B;
		instVarAt: 3 put: $C;
		yourself.

	result := self resultOfSerializeAndMaterialize: anObject.

	self assert: nil = (result instVarAt: 1).
	self assert: $B = (result instVarAt: 2).
	self assert: nil = (result instVarAt: 3).
]
