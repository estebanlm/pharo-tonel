Class {
	#name : #SliderModelTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-Core-Widgets
}

{ #category : #running }
SliderModelTest >> classToTest [
	^ SliderModel
]

{ #category : #running }
SliderModelTest >> initMinMax [
 testedInstance min: 0;
		max: 100
]

{ #category : #tests }
SliderModelTest >> testAbsoluteValue [
	self initMinMax.
	testedInstance absoluteValue: 0.5.
	self assert: testedInstance value == 50
]

{ #category : #tests }
SliderModelTest >> testReset [
	self initMinMax.
	testedInstance
		value: 50;
		reset.
	self assert: testedInstance value == 0
]
