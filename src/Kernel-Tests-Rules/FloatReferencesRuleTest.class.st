"

"
Class {
	#name : #FloatReferencesRuleTest,
	#superclass : #TestCase,
	#instVars : [
		'testClass'
	],
	#category : #Kernel-Tests-Rules,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
FloatReferencesRuleTest>>setUp [

	testClass := Object newAnonymousSubclass.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
FloatReferencesRuleTest>>tearDown [

	testClass := nil
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
FloatReferencesRuleTest>>testBasicCheck [

	| testMethod |
	testMethod := testClass >> (testClass compile: 'testMethod BoxedFloat64').
	
	self assert: (FloatReferencesRule new basicCheck: testMethod ast)
	 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
FloatReferencesRuleTest>>testBasicCheck1 [

	| testMethod |
	testMethod := testClass >> (testClass compile: 'testMethod SmallFloat64').  
	
	self assert: (FloatReferencesRule new basicCheck: testMethod ast)
	 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
FloatReferencesRuleTest>>testBasicCheck2 [

	| testMethod |
	testMethod := testClass >> (testClass compile: 'testMethod').  
	
	self deny: (FloatReferencesRule new basicCheck: testMethod ast)
	 
]
