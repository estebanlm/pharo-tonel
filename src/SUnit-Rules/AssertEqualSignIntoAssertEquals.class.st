"
Using assert:equals: produces better context on rule failure
"
Class {
	#name : #AssertEqualSignIntoAssertEquals,
	#superclass : #ReNodeRewriteRule,
	#category : #SUnit-Rules,
	#timestamp : 'YuriyTymchuk 3/31/2016 17:03'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
AssertEqualSignIntoAssertEquals class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'AssertEqualSignIntoAssertEquals'
]

{
	#category : #hooks,
	#timestamp : ' 8/31/2017 05:26:37'
}
AssertEqualSignIntoAssertEquals>>afterCheck: aNode mappings: mappingDict [
	"would be nice to test if the class uses TAssertable,
	 but it is more complicated"
	
	^ [ aNode methodNode methodClass canUnderstand: #assert:equals: ]
		on: MessageNotUnderstood "methodNode or methodClass may be nil"
		do: [ false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
AssertEqualSignIntoAssertEquals>>group [

	^ 'SUnit'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
AssertEqualSignIntoAssertEquals>>initialize [
	super initialize.
	self
		replace: 'self assert: ``@object1 = ``@object2'
		with: 'self assert: ``@object1 equals: ``@object2'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
AssertEqualSignIntoAssertEquals>>name [

	^ 'Use assert:equals: instead of assert: and ='
]
