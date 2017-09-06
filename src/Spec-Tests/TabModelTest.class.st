"

"
Class {
	#name : #TabModelTest,
	#superclass : #SpecTestCase,
	#instVars : [
		'manager'
	],
	#category : #Spec-Tests-Core-Widgets,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
TabModelTest>>classToTest [
	^ TabModel
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
TabModelTest>>initializeTestedInstance [
	manager := TabManagerModel new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
TabModelTest>>redMorphTab [
	testedInstance
		label: 'Red Morph';
		icon: (testedInstance iconNamed: #smallBackIcon);
		contents:
			(Morph new
				color: Color red;
				yourself).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
TabModelTest>>testChangeLabel [
	"issue 14885"

	self redMorphTab.
	manager addTab: testedInstance.
	self assert: testedInstance label = 'Red Morph'.
	testedInstance label: 'Change Before Opening'.
	self assert: testedInstance label = 'Change Before Opening'.
	window := manager openWithSpec.
	testedInstance label: 'Change After Opening'.
	self assert: testedInstance label = 'Change After Opening'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
TabModelTest>>testSetOwner [
	"issue 16553"

	| button |
	button := ButtonModel new.
	self assert: button owner equals: nil.
	testedInstance model: button.
	self assert: button owner equals: testedInstance
]
