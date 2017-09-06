"

"
Class {
	#name : #IconListModelTest,
	#superclass : #ListModelTest,
	#category : #Spec-Tests-Core-Widgets,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
IconListModelTest>>classToTest [
	^ IconListModel
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
IconListModelTest>>testGetIconFor [
	testedInstance
		items: #(#add #back #catalog);
		icons: [ :item |  Smalltalk ui icons iconNamed: item asSymbol ].
	self assert: (testedInstance getIconFor: #add) equals: (Smalltalk ui icons iconNamed: #add)
]
