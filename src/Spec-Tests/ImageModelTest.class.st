Class {
	#name : #ImageModelTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-Core-Widgets
}

{ #category : #running }
ImageModelTest >> classToTest [
	^ ImageModel
]

{ #category : #tests }
ImageModelTest >> testSwitchAutoScale [
	| autoState |
	autoState := testedInstance autoScale.
	testedInstance switchAutoscale.
	self assert: testedInstance autoScale equals: autoState not
]
