"

"
Class {
	#name : #GLMTextPresentationTest,
	#superclass : #TestCase,
	#category : #Glamour-Tests-Core,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTextPresentationTest>>expectedFailures [

	^ #(testTextPortIsPopulatedByDefault)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTextPresentationTest>>testSelectedText [
	| presentation |
	presentation := GLMRubricTextPresentation new.
	self assert: presentation selectedText equals: ''.
	presentation selectedTextBlock: [ 'selection' ].
	self assert: presentation selectedText equals: 'selection'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTextPresentationTest>>testSelectionIntervalInitialization [
	| presentation |
	presentation := GLMRubricTextPresentation new
		initialize: [ :pres | pres selectionInterval: (3 to: 9) ].
	self assert: presentation selectionInterval equals: nil.
	presentation initializePresentation.
	self assert: presentation selectionInterval equals: (3 to: 9)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTextPresentationTest>>testTextPortIsPopulatedByDefault [
	| composite |
	composite := (GLMCompositePresentation new with: [:a | a text ]) startOn: '42'.
	self assert: composite presentations first text equals: '42'
]
