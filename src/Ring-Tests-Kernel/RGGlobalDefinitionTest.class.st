"
SUnit tests for global definitions (pools, global variables)
"
Class {
	#name : #RGGlobalDefinitionTest,
	#superclass : #TestCase,
	#category : #Ring-Tests-Kernel,
	#timestamp : 'TorstenBergmann 2/12/2014 23:09'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
RGGlobalDefinitionTest>>testEquality [
	| global1 global2 |
	
	global1 := RGGlobalVariableDefinition named: #Transcript.
	global2 := RGGlobalVariableDefinition named: #Transcript.
	self assert: global1 = global2.
	
	global2 := RGGlobalVariableDefinition named: #Transcript2.
	self deny: global1 = global2.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
RGGlobalDefinitionTest>>testGlobalVariableDefinition [
	| global  |
	
	global:= RGGlobalVariableDefinition named:  #Transcript.
	self assert: (global isGlobalVariable).
	self assert: (global parent = Smalltalk globals).
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
RGGlobalDefinitionTest>>testPoolDefinition [
	| pool newClass |
	pool := RGClassDefinition createSharedPoolNamed: #TextConstants.
	self assert: pool isPool.
	self assert: pool users isEmpty.
	self assert: pool parent equals: Smalltalk globals.
	newClass := RGClassDefinition named: #OrderedCollection.
	pool addUser: newClass.
	self assert: pool users size equals: 1.
	self assert: (pool includesUser: newClass).
	self assert: (newClass sharedPoolNamed: #TextConstants) isPoolVariable.
	pool := RGClassDefinition named: #TextConstants.
	pool superclassName: #SharedPool.
	self assert: pool isPool.
	self assert: pool users isEmpty
]
