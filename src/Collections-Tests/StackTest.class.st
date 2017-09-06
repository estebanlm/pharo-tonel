"
SUnit tests for stacks
"
Class {
	#name : #StackTest,
	#superclass : #TestCase,
	#traits : 'TEmptyTest - {#testIfNotEmptyifEmpty. #testIfEmpty. #testNotEmpty} + (TCloneTest - {#testCopyNonEmpty})',
	#classTraits : 'TEmptyTest classTrait + TCloneTest classTrait',
	#instVars : [
		'empty',
		'nonEmpty'
	],
	#classInstVars : [
		'testSize'
	],
	#category : #Collections-Tests-Stack,
	#timestamp : 'TorstenBergmann 2/20/2014 15:31'
}

{
	#category : #'tests - empty',
	#timestamp : ' 8/31/2017 05:26:28'
}
StackTest>>empty [
	
 	^ empty
]

{
	#category : #'tests - empty',
	#timestamp : ' 8/31/2017 05:26:28'
}
StackTest>>nonEmpty [
	
 	^ nonEmpty
]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:28'
}
StackTest>>setUp [

	empty := Stack new.
	nonEmpty := Stack new.
	nonEmpty push: 1.
	nonEmpty push: -2.
	nonEmpty push: 3.
	nonEmpty push: 1.
	
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:28'
}
StackTest>>testEmptyError [
	| aStack |
	aStack := Stack new.
	self should: [ aStack top ] raise: Error.
	self should: [ aStack pop ] raise: Error.
	aStack push: 'element'.
	aStack top.
	aStack pop.	"The stack is empty again due to previous pop"
	self should: [ aStack top ] raise: Error.
	self should: [ aStack pop ] raise: Error
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:28'
}
StackTest>>testPop [

	| aStack res elem |
	elem := 'anElement'.	
	aStack := Stack new.
	self assert: aStack isEmpty.
	
	aStack push: 'a'.
	aStack push: elem.
	res := aStack pop.	
	self assert: res = elem.
	self assert: res == elem.
	
	self assert: aStack size = 1.
	aStack pop.
	self assert: aStack isEmpty.


]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:28'
}
StackTest>>testPush [
	
	| aStack |
	aStack := Stack new.
	aStack push: 'a'.
	self assert: aStack size = 1.	
	aStack push: 'b'.
	self assert: aStack size = 2.
	
]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:28'
}
StackTest>>testSize [
	
	| aStack |
	aStack := Stack new.
	self assert: aStack size = 0.
	aStack push: 'a'.
	self assert: aStack size = 1.
	aStack push: 'b'.
	self assert: aStack size = 2.
	aStack pop.
	self assert: aStack size = 1.
	aStack pop.
	self assert: aStack size = 0.

 
	



]

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:28'
}
StackTest>>testTop [

	| aStack |
	aStack := Stack new.
	self assert: aStack isEmpty.
	aStack push: 'a'.
	aStack push: 'b'.
	self assert: aStack top = 'b'.
	self assert: aStack top = 'b'.
	self assert: aStack size = 2.
]
