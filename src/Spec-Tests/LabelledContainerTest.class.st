Class {
	#name : #LabelledContainerTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-PolyWidgets-Elementary
}

{ #category : #running }
LabelledContainerTest >> classToTest [
	^ LabelledContainer
]

{ #category : #running }
LabelledContainerTest >> initializeTestedInstance [
	testedInstance content: TestingComposableModel.
]

{ #category : #tests }
LabelledContainerTest >> testContent [
	testedInstance content: ListModel.
	self assert: testedInstance subwidget class equals: ListModel
]

{ #category : #tests }
LabelledContainerTest >> testDoesNotUnderstand [
	testedInstance content: ListModel.
	testedInstance items: {'aaa' . 'bbb' . 'ccc'}.
	self assertCollection: testedInstance listItems hasSameElements: {'aaa' . 'bbb' . 'ccc'}
]

{ #category : #tests }
LabelledContainerTest >> testLabelBottom [
	self openInstance: #labelBottom
]

{ #category : #tests }
LabelledContainerTest >> testLabelLeft [
	self openInstance:#labelLeft
]

{ #category : #tests }
LabelledContainerTest >> testLabelRight [
	self openInstance:#labelRight
]
