"
testing ListComposableModel
"
Class {
	#name : #ListModelTest,
	#superclass : #SpecTestCase,
	#category : #Spec-Tests-Core-Widgets
}

{ #category : #running }
ListModelTest >> classToTest [
	^ ListModel
]

{ #category : #tests }
ListModelTest >> testSelectAll [
	| items |
	items := #(#AAA #BBB #CCC).
	testedInstance items: items.
	testedInstance beMultipleSelection.
	self assert: testedInstance selectedItems equals: #().
	testedInstance selectAll.
	self assert: testedInstance selectedItems equals: items
]

{ #category : #tests }
ListModelTest >> testWhenListChanged [
	"Two stages list changed notification."

	50
		timesRepeat: [ | ok |
			testedInstance := ListModel new.
			testedInstance items: #(1 2); whenListChanged: [ :aList | ok := aList = testedInstance listItems ]; listItems;	"Call listItems to set the cache"
			 items: #(1 2 3).
			self assert: ok ]
]

{ #category : #tests }
ListModelTest >> testWhenListChangedOldContents [
	"access to old and new contents in whenListChanged."

	| oldL newL |
	oldL := #(1 2).
	newL := #(1 2 3).
	testedInstance items: oldL.
	testedInstance
		whenListChanged: [ :aList :anOldList | 
			self assert: oldL = anOldList.
			self assert: newL = aList ].
	testedInstance listItems.	"Call listItems to set the cache"
	testedInstance items: #(1 2 3)
]
