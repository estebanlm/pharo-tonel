"

"
Class {
	#name : #OverridesDeprecatedMethodRuleTest,
	#superclass : #TestCase,
	#instVars : [
		'testClass',
		'testSubclass'
	],
	#category : #Kernel-Tests-Rules,
	#timestamp : ''
}

{
	#category : #properties,
	#timestamp : ' 8/31/2017 05:26:43'
}
OverridesDeprecatedMethodRuleTest>>methodName [

	^ 'testMethod'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
OverridesDeprecatedMethodRuleTest>>setUp [

	testClass := Object newAnonymousSubclass.
	testSubclass := testClass newAnonymousSubclass.
	
	testClass compile: self methodName, ' self deprecated: ''method is deprecated'''.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
OverridesDeprecatedMethodRuleTest>>tearDown [

	testClass := nil.
	testSubclass := nil
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
OverridesDeprecatedMethodRuleTest>>testBasicCheck [

	| testMethod |
	testMethod := testSubclass >> (
		testSubclass compile: self methodName).
		
	self assert: (OverridesDeprecatedMethodRule new basicCheck: testMethod)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
OverridesDeprecatedMethodRuleTest>>testBasicCheck1 [

	| testMethod |
	testMethod := testSubclass >> (
		testSubclass compile: self methodName, '1').
		
	self deny: (OverridesDeprecatedMethodRule new basicCheck: testMethod)
]
