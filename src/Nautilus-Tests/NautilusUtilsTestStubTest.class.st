"
This is just a stub test that tests a stub class so NautilusUtilsTest can test method-to-test method mapping.
"
Class {
	#name : #NautilusUtilsTestStubTest,
	#superclass : #TestCase,
	#category : #Nautilus-Tests,
	#timestamp : 'monty 8/22/2016 07:22'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusUtilsTestStubTest>>newStub [
	^ self stubClass new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusUtilsTestStubTest>>stubClass [
	^ NautilusUtilsTestStub
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusUtilsTestStubTest>>testOne [
	| stub |

	stub := self newStub.
	self
		assert: stub one isNil;
		assert: (stub one: #one) == stub;
		assert: stub one = #one.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusUtilsTestStubTest>>testOneTwo [
	| stub |
	stub := self stubClass one: #one two: #two.
	self
		assert: stub one = #one;
		assert: stub two = #two;
		assert: (stub one: #three two: #four) == stub;
		assert: stub one = #three;
		assert: stub two = #four;
		assert: (stub oneTwo: #five) == stub;
		assert: stub one = #three;
		assert: stub two = #five
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusUtilsTestStubTest>>testTwo [
	| stub |

	stub := self newStub.
	self
		assert: stub two isNil;
		assert: (stub two: #two) == stub;
		assert: stub two = #two.
]
