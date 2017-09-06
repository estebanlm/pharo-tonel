"

"
Class {
	#name : #RadioButtonGroupModelTest,
	#superclass : #SpecTestCase,
	#instVars : [
		'radio1',
		'radio2'
	],
	#category : #Spec-Tests-Core-Widgets,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
RadioButtonGroupModelTest>>classToTest [
	^ RadioButtonGroupModel
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
RadioButtonGroupModelTest>>initializeTestedInstance [
	radio1 := RadioButtonModel new.
	radio2 := RadioButtonModel new
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
RadioButtonGroupModelTest>>testAddRadioButton [
	self assert: testedInstance buttons size == 0.
	testedInstance
		addRadioButton: radio1;
		addRadioButton: radio2.
	self assert: testedInstance buttons size == 2
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
RadioButtonGroupModelTest>>testAddingFocusOrder [
	testedInstance
		addRadioButton: radio1;
		addRadioButton: radio2.
	self shouldnt: [ testedInstance takeKeyboardFocus ] raise: Error.
	self assert: (testedInstance giveFocusToNextFrom: radio1)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
RadioButtonGroupModelTest>>testCurrentActivated [
	testedInstance addRadioButton: radio1.
	self assert: testedInstance currentActivated equals: nil.
	radio1 click.
	self assert: testedInstance currentActivated equals: radio1
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
RadioButtonGroupModelTest>>testDefault [
	testedInstance addRadioButton: radio1.
	self assert: radio1 state == false
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
RadioButtonGroupModelTest>>testLinkRadioButton [
	testedInstance
		addRadioButton: radio1;
		addRadioButton: radio2.
	self assert: radio1 state == false.
	self assert: radio2 state == false.
	radio1 click.
	self assert: radio1 state == true.
	self assert: radio2 state == false.
	radio2 click.
	self assert: radio1 state == false.
	self assert: radio2 state == true
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
RadioButtonGroupModelTest>>testRebuildWidget [
	testedInstance
		addRadioButton: radio1;
		addRadioButton: radio2.
	self shouldnt: [ testedInstance radio2 ] raise: Error.
	self assert: testedInstance buttons size == 2
]
