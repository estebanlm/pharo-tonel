"

"
Class {
	#name : #MethodQueryTest,
	#superclass : #TestCase,
	#category : #System-SupportTests,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
MethodQueryTest>>testReferencedClasses [
	| refs |
	
	refs := (CompiledMethod>>#referencedClasses) referencedClasses.
	self assert: refs isEmpty.
	
	refs := thisContext method referencedClasses.
	self assert: refs equals: { CompiledMethod }.
	
	
]
