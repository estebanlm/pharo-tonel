"

"
Class {
	#name : #SearchableListTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-PolyWidgets-ListAndTree,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SearchableListTest>>classToTest [
	^ SearchableList
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SearchableListTest>>testFiltering [
	testedInstance listModel items: {'aa' . 'bb' . 'ab' . 'ba'}.
	testedInstance searchModel text: 'a'.
	self assert: testedInstance listModel listItems asArray equals: {'aa' . 'ab'}
]
