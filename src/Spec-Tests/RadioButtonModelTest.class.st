"

"
Class {
	#name : #RadioButtonModelTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-Core-Widgets,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
RadioButtonModelTest>>classToTest [
	^  RadioButtonModel
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
RadioButtonModelTest>>testCanDeselectByClick [
	self deny: testedInstance canDeselectByClick.
	testedInstance click.
	self assert: testedInstance state.
	testedInstance click.
	self assert: testedInstance state.
	testedInstance canDeselectByClick: true.
	testedInstance click.
	self deny: testedInstance state
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
RadioButtonModelTest>>testToggleState [
	self deny: testedInstance state.
	testedInstance toggleState.
	self assert: testedInstance state
]
