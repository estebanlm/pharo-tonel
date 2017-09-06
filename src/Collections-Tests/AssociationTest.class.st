"
SUnit tests for Associations
"
Class {
	#name : #AssociationTest,
	#superclass : #ClassTestCase,
	#instVars : [
		'a',
		'b'
	],
	#category : #Collections-Tests-Support,
	#timestamp : 'TorstenBergmann 2/20/2014 15:19'
}

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:28'
}
AssociationTest>>setUp [

	a := 1 -> 'one'.
	b := 1 -> 'een'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
AssociationTest>>testComparison [
	self assert: ((#a -> 'foo') < (#b -> 'zork'))
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
AssociationTest>>testEquality [
	
	self 
		assert: (a key = b key);
		deny: (a value = b value);
		deny: (a = b)


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
AssociationTest>>testHash [

	self 
		assert: (a hash = a copy hash);
		assert: (a hash = b hash)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
AssociationTest>>testIsSelfEvaluating [
	| anotherAssociation |
	self assert: (a isSelfEvaluating).
	
	self assert: (a printString = '1->''one''').
	
	anotherAssociation := Object new -> Object new.
	anotherAssociation isSelfEvaluating ifTrue: [self
		assert: (self class compiler evaluate: anotherAssociation printString) = anotherAssociation
		description: 'a self evaluating should evaluate as self'].

]
