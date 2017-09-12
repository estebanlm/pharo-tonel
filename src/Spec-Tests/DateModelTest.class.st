Class {
	#name : #DateModelTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-PolyWidgets-Widgets
}

{ #category : #running }
DateModelTest >> classToTest [
	^ DateModel
]

{ #category : #tests }
DateModelTest >> testOnDateChosen [
	| mookChoseDate |
	mookChoseDate := ChoseDate new.
	mookChoseDate
		calendar: StandardWindow new;
		date: Date tomorrow.
	testedInstance onDateChosen: mookChoseDate.
	self assert: testedInstance date equals: Date tomorrow
]
