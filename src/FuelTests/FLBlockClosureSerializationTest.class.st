"
SUnit tests for fuel serialization of block closures
"
Class {
	#name : #FLBlockClosureSerializationTest,
	#superclass : #FLSerializationTest,
	#classVars : [
		'ClassVariableForTesting'
	],
	#classInstVars : [
		'interval'
	],
	#category : #FuelTests,
	#timestamp : 'TorstenBergmann 2/3/2014 23:26'
}

{
	#category : #'closures for testing',
	#timestamp : ' 8/31/2017 05:26:30'
}
FLBlockClosureSerializationTest class>>blockClosureWithSelfSend [
	^ [ self printString ]
]

{
	#category : #'closures for testing',
	#timestamp : ' 8/31/2017 05:26:30'
}
FLBlockClosureSerializationTest class>>blockClosureWithTempVariableRead [
	| string |
	string := 'test'.
	^ [ string asUppercase ].
]

{
	#category : #tests-change,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLBlockClosureSerializationTest>>testBlockClosureChangeDifferentBytecodes [
	"Raise an error when materializing a closure whose method has changed bytecodes."

	| aClass aClosure |
	aClass := self newClass
		duringTestCompileSilently: 'methodWithClosure  ^ [ 42 ]';
		yourself.
	aClosure := aClass new perform: #methodWithClosure.
	self serialize: aClosure.
	aClass duringTestCompileSilently: 'methodWithClosure  ^ 42'.
	self should: [ self materialized ] raise: FLMethodChanged
]

{
	#category : #tests-change,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLBlockClosureSerializationTest>>testBlockClosureChangeSameBytecodes [
	"Tolerate materializing a closure whose method has changed but not the bytecodes."

	| aClass aClosure materializedClosure |
	aClass := self newClass
		duringTestCompileSilently: 'methodWithClosure  ^ [ 41 ]';
		yourself.
	aClosure := aClass new perform: #methodWithClosure.
	self serialize: aClosure.
	aClass duringTestCompileSilently: 'methodWithClosure  ^ [ 42 ]'.
	self deny: aClosure method isInstalled.
	materializedClosure := self materialized.
	self assert: materializedClosure value = 42
]

{
	#category : #tests-change,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLBlockClosureSerializationTest>>testBlockClosureRemoved [
	"Raise an error when materializing a closure whose method was removed."

	| aClass aClosure |
	aClass := self newClass
		duringTestCompileSilently: 'methodWithClosure  ^ [ 42 ]';
		yourself.
	aClosure := aClass new perform: #methodWithClosure.
	self serialize: aClosure.
	aClass removeSelectorSilently: #methodWithClosure.
	self should: [ self materialized ] raise: FLMethodNotFound
]

{
	#category : #tests-clean,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLBlockClosureSerializationTest>>testBlockClosureWithClassVariableRead [
	| closure materializedClosure |
	ClassVariableForTesting := nil.
	closure := [ ClassVariableForTesting ].
	materializedClosure := self resultOfSerializeAndMaterialize: closure.
	closure assertWellMaterializedInto: materializedClosure in: self.

	ClassVariableForTesting := true.
	self assert: materializedClosure value.
	ClassVariableForTesting := false.
	self deny: materializedClosure value
]

{
	#category : #tests-unclean,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLBlockClosureSerializationTest>>testBlockClosureWithSelfSend [
	| closure materializedClosure |
	closure := self class blockClosureWithSelfSend.
	materializedClosure := self resultOfSerializeAndMaterialize: closure.
	closure assertWellMaterializedInto: materializedClosure in: self.
	self assert: materializedClosure value = closure value
]

{
	#category : #tests-clean,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLBlockClosureSerializationTest>>testBlockClosureWithTempVariableRead [
	| closure materializedClosure |
	closure := self class blockClosureWithTempVariableRead.
	materializedClosure := self resultOfSerializeAndMaterialize: closure.
	closure assertWellMaterializedInto: materializedClosure in: self.
	self assert: materializedClosure value = 'TEST'.

]

{
	#category : #tests-clean,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLBlockClosureSerializationTest>>testBlockClosureWithThreeArguments [
	| closure materializedClosure |
	closure := [ :a :b :c | a + b + c ].
	materializedClosure := self resultOfSerializeAndMaterialize: closure.
	closure assertWellMaterializedInto: materializedClosure in: self.
	self assert: (materializedClosure value: 1 value: 2 value: 3) = 6
]

{
	#category : #tests-clean,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLBlockClosureSerializationTest>>testNestedBlockClosure [
	| closure materializedClosure |
	closure := [ [ 42 ] ].
	materializedClosure := self resultOfSerializeAndMaterialize: closure.
	closure assertWellMaterializedInto: materializedClosure in: self.
	self assert: materializedClosure value value = 42
]
