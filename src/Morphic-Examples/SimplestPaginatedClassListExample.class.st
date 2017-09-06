"
Example for a paginated class list
"
Class {
	#name : #SimplestPaginatedClassListExample,
	#superclass : #PaginatedMorphTreeModel,
	#instVars : [
		'rootClass'
	],
	#category : #Morphic-Examples-MorphTreeWidget,
	#timestamp : 'TorstenBergmann 2/3/2014 23:55'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestPaginatedClassListExample class>>example [

	^SimplestPaginatedClassListExample new openOn: Object
]

{
	#category : #view,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestPaginatedClassListExample>>defaultTreeMorph [
	^ super defaultTreeMorph
		multiSelection: true;
		autoMultiSelection: true;
		yourself
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestPaginatedClassListExample>>itemsForTest [
	^ rootClass allSubclasses
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestPaginatedClassListExample>>openDialogOn: aClass  [
	rootClass := aClass.
	^ self openDialogWindowIn: World title: 'All Object subclasses'

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestPaginatedClassListExample>>openOn: aClass  [
	rootClass := aClass.
	(self dialogWindowIn: World title: 'All Object subclasses') openInWorld

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
SimplestPaginatedClassListExample>>rootItems [
	^ self itemsForTest asArray sort: [:a :b | a name < b name]
]
