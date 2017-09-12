Class {
	#name : #SearchableListTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-PolyWidgets-ListAndTree
}

{ #category : #running }
SearchableListTest >> classToTest [
	^ SearchableList
]

{ #category : #tests }
SearchableListTest >> testFiltering [
	testedInstance listModel items: {'aa' . 'bb' . 'ab' . 'ba'}.
	testedInstance searchModel text: 'a'.
	self assert: testedInstance listModel listItems asArray equals: {'aa' . 'ab'}
]
