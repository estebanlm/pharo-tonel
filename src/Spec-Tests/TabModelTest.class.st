Class {
	#name : #TabModelTest,
	#superclass : #SpecTestCase,
	#instVars : [
		'manager'
	],
	#category : #Spec-Tests-Core-Widgets
}

{ #category : #running }
TabModelTest >> classToTest [
	^ TabModel
]

{ #category : #running }
TabModelTest >> initializeTestedInstance [
	manager := TabManagerModel new
]

{ #category : #'instance creation' }
TabModelTest >> redMorphTab [
	testedInstance
		label: 'Red Morph';
		icon: (testedInstance iconNamed: #smallBackIcon);
		contents:
			(Morph new
				color: Color red;
				yourself).
]

{ #category : #tests }
TabModelTest >> testChangeLabel [
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

{ #category : #tests }
TabModelTest >> testSetOwner [
	"issue 16553"

	| button |
	button := ButtonModel new.
	self assert: button owner equals: nil.
	testedInstance model: button.
	self assert: button owner equals: testedInstance
]
