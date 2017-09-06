"

"
Class {
	#name : #ImageModelTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-Core-Widgets,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
ImageModelTest>>classToTest [
	^ ImageModel
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
ImageModelTest>>testSwitchAutoScale [
	| autoState |
	autoState := testedInstance autoScale.
	testedInstance switchAutoscale.
	self assert: testedInstance autoScale equals: autoState not
]
