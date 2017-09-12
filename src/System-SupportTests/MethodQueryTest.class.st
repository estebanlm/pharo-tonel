Class {
	#name : #MethodQueryTest,
	#superclass : #TestCase,
	#category : #System-SupportTests
}

{ #category : #tests }
MethodQueryTest >> testReferencedClasses [
	| refs |
	
	refs := (CompiledMethod>>#referencedClasses) referencedClasses.
	self assert: refs isEmpty.
	
	refs := thisContext method referencedClasses.
	self assert: refs equals: { CompiledMethod }.
	
	
]
