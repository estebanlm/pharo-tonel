"

"
Class {
	#name : #GlobalVariableTest,
	#superclass : #TestCase,
	#category : #Slot-Tests,
	#timestamp : ''
}

{
	#category : #'tests  - properties',
	#timestamp : ' 8/31/2017 05:26:46'
}
GlobalVariableTest>>testIsReadInMethod [

	self assert: (Object binding isReadIn: self class >> testSelector).
	self deny: ((self class environment classNamed: #String) binding 
							isReadIn: self class >> testSelector).
]

{
	#category : #'tests  - properties',
	#timestamp : ' 8/31/2017 05:26:46'
}
GlobalVariableTest>>testNotWrittenInMethod [

	self deny: (Object binding isWrittenIn: self class >> testSelector)
]

{
	#category : #'tests  - properties',
	#timestamp : ' 8/31/2017 05:26:46'
}
GlobalVariableTest>>testPropertyAtPut [

	| testValue |
	
	testValue := Date today.
	self class binding propertyAt: #testKeySelector put: testValue.
	self
		assert: (self class binding propertyAt: #testKeySelector)
		equals: testValue.
	self class binding removeProperty: #testKeySelector.
	self assert: self class binding properties isNil.
]

{
	#category : #'tests  - properties',
	#timestamp : ' 8/31/2017 05:26:46'
}
GlobalVariableTest>>testRemoveProperty [

	self class binding propertyAt: #testKeySelector put: 1.
		
	self class binding removeProperty: #testKeySelector.
	self
		assert: (self class binding propertyAt: #testKeySelector)
		equals: nil.
		
	self assert: self class binding properties isNil.
]
