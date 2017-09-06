"

"
Class {
	#name : #DateModelTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-PolyWidgets-Widgets,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
DateModelTest>>classToTest [
	^ DateModel
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
DateModelTest>>testOnDateChosen [
	| mookChoseDate |
	mookChoseDate := ChoseDate new.
	mookChoseDate
		calendar: StandardWindow new;
		date: Date tomorrow.
	testedInstance onDateChosen: mookChoseDate.
	self assert: testedInstance date equals: Date tomorrow
]
