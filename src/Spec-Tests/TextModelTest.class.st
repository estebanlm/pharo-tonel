Class {
	#name : #TextModelTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-Core-Widgets
}

{ #category : #running }
TextModelTest >> classToTest [
	^ TextModel
]

{ #category : #running }
TextModelTest >> initializationText [
	testedInstance text: 'Text for tests.'
]

{ #category : #tests }
TextModelTest >> testSelectAll [
	self initializationText.
	self openInstance.
	testedInstance selectAll.
	self assert: testedInstance getSelection equals: (1 to: 15).
	testedInstance clearSelection.
	self assert: testedInstance getSelection isEmpty
]
