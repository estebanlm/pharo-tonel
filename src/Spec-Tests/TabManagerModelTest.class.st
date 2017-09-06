"

"
Class {
	#name : #TabManagerModelTest,
	#superclass : #SpecTestCase,
	#instVars : [
		'redTab'
	],
	#category : #Spec-Tests-Core-Widgets,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
TabManagerModelTest>>classToTest [
	^ TabManagerModel
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
TabManagerModelTest>>initializeTestedInstance [
	redTab := self redMorphTab
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:46'
}
TabManagerModelTest>>morphicTabsFor: aManagerModel [
	"Retrieve all tabs in the morphic world to test whether they are being properly added/removed. It is assumed that the Model has already been built."

	^ (aManagerModel widget widget submorphs detect: [ :each | each class = TabBarMorph ]) tabs
]

{
	#category : #'tabs creation',
	#timestamp : ' 8/31/2017 05:26:46'
}
TabManagerModelTest>>redMorphTab [
	| tab |
	tab := TabModel new.
	tab
		label: 'Red Morph';
		icon: (tab iconNamed: #smallBackIcon);
		contents:
			(Morph new
				color: Color red;
				yourself).
	^ tab
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
TabManagerModelTest>>testAddTabOpened [
	self openInstance.
	self assertCollection: testedInstance tabs hasSameElements: #().
	testedInstance addTab: redTab.
	self assertCollection: testedInstance tabs hasSameElements: {redTab}
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
TabManagerModelTest>>testAddTabSetOwner [
	"issue #16553"

	self assert: redTab owner equals: nil.
	testedInstance addTab: redTab.
	self assert: redTab owner equals: testedInstance
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
TabManagerModelTest>>testAddTabUnopened [
	self assertCollection: testedInstance tabs hasSameElements: #().
	testedInstance addTab: redTab.
	self assertCollection: testedInstance tabs hasSameElements: {redTab}
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
TabManagerModelTest>>testInitialSelectedTab [
	"issue 15145"

	self assert: testedInstance selectedTab equals: nil.
	testedInstance addTab: redTab.
	self assert: testedInstance selectedTab equals: redTab.
	testedInstance addTab: self redMorphTab.
	self assert: testedInstance selectedTab equals: redTab
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
TabManagerModelTest>>testRemoveTab [
	"issue 11461"

	testedInstance addTab: redTab.
	self assertCollection: testedInstance tabs hasSameElements: {redTab}.
	testedInstance removeTab: redTab.
	self assertCollection: testedInstance tabs hasSameElements: #()
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
TabManagerModelTest>>testRemoveTabFromManager [
	"issue 11461 - update tab collection in the model when tab has been removed in morphic"

	self openInstance.
	testedInstance addTab: redTab.
	self assertCollection: testedInstance tabs hasSameElements: {redTab}.
	self assertCollection: (self morphicTabsFor: testedInstance) hasSameElements: {redTab widget widget}.
	redTab widget widget delete.
	self assertCollection: testedInstance tabs hasSameElements: #().
	self assertCollection: (self morphicTabsFor: testedInstance) hasSameElements: #()
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
TabManagerModelTest>>testRemoveTabFromManager2 [
	"issue 11461 -	update tab collection in the model when tab has been removed in morphic"

	testedInstance addTab: redTab.
	self assertCollection: testedInstance tabs hasSameElements: {redTab}.
	self openInstance .
	redTab widget widget delete.
	self assertCollection: testedInstance tabs hasSameElements: #().
	self assertCollection: (self morphicTabsFor: testedInstance) hasSameElements: #()
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
TabManagerModelTest>>testRemoveTabFromMorphic [
	"issue 11461 - remove tab from morphic when it was removed from model"

	testedInstance addTab: redTab.
	self openInstance.
	self assertCollection: testedInstance tabs hasSameElements: {redTab}.
	testedInstance removeTab: redTab.
	self assertCollection: testedInstance tabs hasSameElements: #().
	self assertCollection: (self morphicTabsFor: testedInstance) hasSameElements: #()
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
TabManagerModelTest>>testRemoveTabUnsetOwner [
	"issue 16553"

	testedInstance addTab: redTab.
	self assert: redTab owner equals: testedInstance.
	testedInstance removeTab: redTab.
	self assert: redTab owner equals: nil
]
