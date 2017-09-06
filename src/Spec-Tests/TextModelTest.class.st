"

"
Class {
	#name : #TextModelTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-Core-Widgets,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
TextModelTest>>classToTest [
	^ TextModel
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
TextModelTest>>initializationText [
	testedInstance text: 'Text for tests.'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
TextModelTest>>testSelectAll [
	self initializationText.
	self openInstance.
	testedInstance selectAll.
	self assert: testedInstance getSelection equals: (1 to: 15).
	testedInstance clearSelection.
	self assert: testedInstance getSelection isEmpty
]
