"

"
Class {
	#name : #SliderModelTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-Core-Widgets,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SliderModelTest>>classToTest [
	^ SliderModel
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SliderModelTest>>initMinMax [
 testedInstance min: 0;
		max: 100
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SliderModelTest>>testAbsoluteValue [
	self initMinMax.
	testedInstance absoluteValue: 0.5.
	self assert: testedInstance value == 50
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SliderModelTest>>testReset [
	self initMinMax.
	testedInstance
		value: 50;
		reset.
	self assert: testedInstance value == 0
]
