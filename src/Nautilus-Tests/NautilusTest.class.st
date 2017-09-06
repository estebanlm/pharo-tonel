"
A NautilusTest is a test class for testing the behavior of Nautilus
"
Class {
	#name : #NautilusTest,
	#superclass : #TestCase,
	#instVars : [
		'nautilus'
	],
	#category : #Nautilus-Tests,
	#timestamp : '<historical>'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusTest>>setUp [

	nautilus := Nautilus new.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusTest>>tearDown [

	nautilus := nil.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusTest>>testSelectedCategory [

	self assert: nautilus selectedMethod isNil.
	nautilus selectedMethod: (Object>>#at:).
	nautilus selectedCategory: 'test'.
	self assert: (nautilus selectedCategory = 'test').
	self assert: (nautilus selectedMethod isNil).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusTest>>testSelectedClass [

	self assert: nautilus selectedMethod isNil.
	nautilus selectedMethod: (Object>>#at:).
	nautilus selectedCategory: 'test'.
	self assert: (nautilus selectedCategory = 'test').
	self assert: (nautilus selectedMethod isNil).
	
	nautilus selectedClass: Morph.
	self assert: (nautilus selectedClass = Morph).
	self assert: (nautilus selectedCategory isNil).
	self assert: (nautilus selectedMethod isNil).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
NautilusTest>>testSelectedMethod [

	self assert: nautilus selectedMethod isNil.
	nautilus selectedMethod: (Object>>#at:).
	self assert: (nautilus selectedMethod = (Object>>#at:))
]
