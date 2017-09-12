Class {
	#name : #RadioButtonModelTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-Core-Widgets
}

{ #category : #running }
RadioButtonModelTest >> classToTest [
	^  RadioButtonModel
]

{ #category : #tests }
RadioButtonModelTest >> testCanDeselectByClick [
	self deny: testedInstance canDeselectByClick.
	testedInstance click.
	self assert: testedInstance state.
	testedInstance click.
	self assert: testedInstance state.
	testedInstance canDeselectByClick: true.
	testedInstance click.
	self deny: testedInstance state
]

{ #category : #tests }
RadioButtonModelTest >> testToggleState [
	self deny: testedInstance state.
	testedInstance toggleState.
	self assert: testedInstance state
]
