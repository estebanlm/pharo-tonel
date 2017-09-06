"

"
Class {
	#name : #EditableListTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-PolyWidgets-ListAndTree,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
EditableListTest>>classToTest [
	^ EditableList
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
EditableListTest>>testMoveElementAtTo [
	testedInstance list: {'AAA' . 'BBB' . 'CCC'}.
	testedInstance moveElementAt: 1 to: 3.
	self
		assert: testedInstance list listItems asArray 
		equals: {'BBB' . 'CCC' . 'AAA'}
]
