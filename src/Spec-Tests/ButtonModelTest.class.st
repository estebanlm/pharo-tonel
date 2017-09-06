"
SUnit tests for Button model
"
Class {
	#name : #ButtonModelTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-Core-Widgets,
	#timestamp : 'TorstenBergmann 2/5/2014 09:21'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
ButtonModelTest>>classToTest [
^ ButtonModel 
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
ButtonModelTest>>morph [
	^ testedInstance widget widget
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
ButtonModelTest>>testAskBeforeChanging [
	| state |
	self assert: testedInstance askBeforeChanging not.
	self openInstance.
	state := testedInstance widget askBeforeChanging.
	self assert: state not.
	testedInstance askBeforeChanging: true.
	state := testedInstance widget askBeforeChanging.
	self assert: state
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
ButtonModelTest>>testEnabled [
	self assert: testedInstance enabled.
	self openInstance.
	self assert: self morph enabled.
	testedInstance enabled: false.
	self deny: self morph enabled
]
