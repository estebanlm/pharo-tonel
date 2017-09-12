"
SUnit tests for Button model
"
Class {
	#name : #ButtonModelTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-Core-Widgets
}

{ #category : #running }
ButtonModelTest >> classToTest [
^ ButtonModel 
]

{ #category : #running }
ButtonModelTest >> morph [
	^ testedInstance widget widget
]

{ #category : #tests }
ButtonModelTest >> testAskBeforeChanging [
	| state |
	self assert: testedInstance askBeforeChanging not.
	self openInstance.
	state := testedInstance widget askBeforeChanging.
	self assert: state not.
	testedInstance askBeforeChanging: true.
	state := testedInstance widget askBeforeChanging.
	self assert: state
]

{ #category : #tests }
ButtonModelTest >> testEnabled [
	self assert: testedInstance enabled.
	self openInstance.
	self assert: self morph enabled.
	testedInstance enabled: false.
	self deny: self morph enabled
]
