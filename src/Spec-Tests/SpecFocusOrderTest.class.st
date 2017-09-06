"

"
Class {
	#name : #SpecFocusOrderTest,
	#superclass : #TestCase,
	#instVars : [
		'specFocusOrder',
		'button1',
		'button2'
	],
	#category : #Spec-Tests-Core-Support,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SpecFocusOrderTest>>setUp [
	super setUp.
	specFocusOrder := SpecFocusOrder new.
	button1 := ButtonModel new.
	button2 := ButtonModel new
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SpecFocusOrderTest>>testAdd [
	self
		assert: specFocusOrder presenters isEmpty;
		shouldnt: [ specFocusOrder
				add: button1;
				add: button2;
				add: button1;
				add: button1 ]
			raise: Error;
		assert: specFocusOrder presenters
			equals:
			{button1.
			button2.
			button1.
			button1} asOrderedCollection
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SpecFocusOrderTest>>testAddLast [
	self
		assert: specFocusOrder presenters isEmpty;
		shouldnt: [ specFocusOrder
				addLast: button1;
				addLast: button2]
			raise: Error;
		assert: specFocusOrder presenters
			equals:
			{button1.
			button2} asOrderedCollection
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SpecFocusOrderTest>>testGiveFocusToNextFrom [
	self
		assert: specFocusOrder presenters isEmpty;
		shouldnt: [ specFocusOrder
				add: button1;
				add: button2 ]
			raise: Error;
			assert: (specFocusOrder giveFocusToNextFrom:button1 for: nil).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SpecFocusOrderTest>>testRemoveAll [
	self
		assert: specFocusOrder presenters isEmpty;
		shouldnt: [ specFocusOrder
				add: button1;
				add: button2 ]
			raise: Error;
		assert: specFocusOrder presenters size == 2;
		shouldnt: [ specFocusOrder removeAll ] raise: Error;
		assert: specFocusOrder presenters isEmpty
]
