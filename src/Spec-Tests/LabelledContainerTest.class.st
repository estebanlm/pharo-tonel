"

"
Class {
	#name : #LabelledContainerTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-PolyWidgets-Elementary,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
LabelledContainerTest>>classToTest [
	^ LabelledContainer
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
LabelledContainerTest>>initializeTestedInstance [
	testedInstance content: TestingComposableModel.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
LabelledContainerTest>>testContent [
	testedInstance content: ListModel.
	self assert: testedInstance subwidget class equals: ListModel
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
LabelledContainerTest>>testDoesNotUnderstand [
	testedInstance content: ListModel.
	testedInstance items: {'aaa' . 'bbb' . 'ccc'}.
	self assertCollection: testedInstance listItems hasSameElements: {'aaa' . 'bbb' . 'ccc'}
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
LabelledContainerTest>>testLabelBottom [
	self openInstance: #labelBottom
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
LabelledContainerTest>>testLabelLeft [
	self openInstance:#labelLeft
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
LabelledContainerTest>>testLabelRight [
	self openInstance:#labelRight
]
