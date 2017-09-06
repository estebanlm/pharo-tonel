"
SUnit tests for generating argument names
"
Class {
	#name : #ArgumentNamesTest,
	#superclass : #TestCase,
	#category : #Tools-Test-Debugger,
	#timestamp : 'TorstenBergmann 2/4/2014 20:45'
}

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:47'
}
ArgumentNamesTest>>argumentNameFor: anObject shouldBe: aString  [

	self assert: anObject class canonicalArgumentName equals: aString.
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:47'
}
ArgumentNamesTest>>argumentNameForInstanceOf: aClass shouldBe: aString  [
	
	self assert: aClass canonicalArgumentName equals: aString.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ArgumentNamesTest>>testAPrefixForClassNameStartingWithConsonant [

	self testCollection.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ArgumentNamesTest>>testAnPrefixForClassNameStartingWithVowel [

	self testInteger.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ArgumentNamesTest>>testClass [

	self argumentNameForInstanceOf: Class shouldBe: 'aClass'.
	self argumentNameFor: Integer shouldBe: 'aClass'.
	self argumentNameFor: Collection shouldBe: 'aClass'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ArgumentNamesTest>>testCollection [

	self argumentNameForInstanceOf: Collection shouldBe: 'aCollection'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ArgumentNamesTest>>testDefault [

	self argumentNameForInstanceOf: Object shouldBe: 'anObject'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ArgumentNamesTest>>testInteger [

	self argumentNameForInstanceOf: Integer shouldBe: 'anInteger'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ArgumentNamesTest>>testNumber [

	self argumentNameForInstanceOf: Number shouldBe: 'aNumber'.
	self argumentNameForInstanceOf: Float shouldBe: 'aNumber'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ArgumentNamesTest>>testString [

	self argumentNameForInstanceOf: String shouldBe: 'aString'.
	self argumentNameForInstanceOf: ByteString shouldBe: 'aString'.
]
