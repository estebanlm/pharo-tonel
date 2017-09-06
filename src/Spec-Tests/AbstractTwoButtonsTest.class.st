"

"
Class {
	#name : #AbstractTwoButtonsTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-PolyWidgets-Support,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
AbstractTwoButtonsTest>>classToTest [
	^ TestingAbstractTwoButtons
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
AbstractTwoButtonsTest>>testFirstActionSecondAction [
	| action1 action2 |
	action1 := false.
	action2 := false.
	testedInstance firstAction: [ action1 := true ] secondAction: [ action2 := true ].
	testedInstance firstButton performAction.
	testedInstance secondButton performAction.
	self assert: action1.
	self assert: action2
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
AbstractTwoButtonsTest>>testFirstIconSecondIcon [
		testedInstance firstIcon: #thumbsUp secondIcon: #thumbsDown.
	self assert: testedInstance firstButton icon == #thumbsUp asIcon.
	self assert: testedInstance secondButton icon == #thumbsDown asIcon
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
AbstractTwoButtonsTest>>testFirstLabelSecondLabel [
	testedInstance firstLabel: 'label 1' secondLabel: 'label 2'.
	self assert: testedInstance firstButton label asString equals: 'label 1'.
	self assert: testedInstance secondButton label asString equals: 'label 2'
]
