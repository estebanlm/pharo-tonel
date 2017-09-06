"
This is the unit test for the class UndefinedObject. Unit tests are a good way to exercise the functionality of your system in a repeatable and automatic manner. They are therefore recommended if you plan to release anything. For more information, see: 
	- http://www.c2.com/cgi/wiki?UnitTest
	- there is a chapter in the PharoByExample book (http://pharobyexample.org)
	- the sunit class category
"
Class {
	#name : #UndefinedObjectTest,
	#superclass : #ClassTestCase,
	#category : #Kernel-Tests-Objects,
	#timestamp : '<historical>'
}

{
	#category : #'tests - Class Methods',
	#timestamp : ' 8/31/2017 05:26:30'
}
UndefinedObjectTest>>testAllInstances [
	self assert: UndefinedObject allInstances size = 1 description: 'There should be a single instance of UndefinedObject'.
	self assert: (UndefinedObject allInstances includes: nil) description: 'nil should be an instance of UndefinedObject'.
]

{
	#category : #'tests - copying',
	#timestamp : ' 8/31/2017 05:26:30'
}
UndefinedObjectTest>>testDeepCopy [
	self assert: nil deepCopy isNil
]

{
	#category : #'tests - testing',
	#timestamp : ' 8/31/2017 05:26:30'
}
UndefinedObjectTest>>testHaltIfNil [

	self should: [ nil haltIfNil] raise: Halt.
]

{
	#category : #'tests - testing',
	#timestamp : ' 8/31/2017 05:26:30'
}
UndefinedObjectTest>>testIfNil [

	self should: [ nil ifNil: [self halt]] raise: Halt.



]

{
	#category : #'tests - testing',
	#timestamp : ' 8/31/2017 05:26:30'
}
UndefinedObjectTest>>testIfNilIfNotNil [

	self should: [ nil ifNil: [self halt] ifNotNil: [self error] ] raise: Halt.



]

{
	#category : #'tests - testing',
	#timestamp : ' 8/31/2017 05:26:30'
}
UndefinedObjectTest>>testIfNotNil [

	nil ifNotNil: [
		self fail: 'should not get here' ].



]

{
	#category : #'tests - testing',
	#timestamp : ' 8/31/2017 05:26:30'
}
UndefinedObjectTest>>testIfNotNilDo [

	nil ifNotNil: [
		self fail: 'should not get here' ].

]

{
	#category : #'tests - testing',
	#timestamp : ' 8/31/2017 05:26:30'
}
UndefinedObjectTest>>testIfNotNilIfNil [

	self should: [ nil ifNotNil: [self error] ifNil: [self halt] ] raise: Halt.



]

{
	#category : #'tests - testing',
	#timestamp : ' 8/31/2017 05:26:30'
}
UndefinedObjectTest>>testIsEmptyOrNil [

	self assert: (nil isEmptyOrNil).
]

{
	#category : #'tests - testing',
	#timestamp : ' 8/31/2017 05:26:30'
}
UndefinedObjectTest>>testIsLiteral [

	self assert: (nil isLiteral).
]

{
	#category : #'tests - testing',
	#timestamp : ' 8/31/2017 05:26:30'
}
UndefinedObjectTest>>testIsNil [

	self assert: (nil isNil).
]

{
	#category : #'tests - Class Methods',
	#timestamp : ' 8/31/2017 05:26:30'
}
UndefinedObjectTest>>testNew [

	self should: [ UndefinedObject new] raise: Error.
]

{
	#category : #'tests - testing',
	#timestamp : ' 8/31/2017 05:26:30'
}
UndefinedObjectTest>>testNotNil [

	self deny: (nil notNil).
]

{
	#category : #'tests - printing',
	#timestamp : ' 8/31/2017 05:26:30'
}
UndefinedObjectTest>>testPrintOn [

	| string |
	string := String streamContents: [:stream | nil printOn: stream].
	self assert: (string = 'nil').
]

{
	#category : #'tests - copying',
	#timestamp : ' 8/31/2017 05:26:30'
}
UndefinedObjectTest>>testShallowCopy [
	self assert: nil shallowCopy isNil
]

{
	#category : #'tests - printing',
	#timestamp : ' 8/31/2017 05:26:30'
}
UndefinedObjectTest>>testStoreOn [
	| string |
	string := String streamContents: [ :stream | nil storeOn: stream ].
	self assert: (self class compiler evaluate: string) isNil
]

{
	#category : #'tests - copying',
	#timestamp : ' 8/31/2017 05:26:30'
}
UndefinedObjectTest>>testVeryDeepCopyWith [
	self assert: (nil veryDeepCopyWith: nil) isNil
]
