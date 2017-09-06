"
Like SortHierarchically but sort by name and without indentation.
"
Class {
	#name : #SortAlphabeticallyClassList,
	#superclass : #Object,
	#instVars : [
		'list'
	],
	#category : #Nautilus,
	#timestamp : 'NicolaiHess 9/7/2014 00:35'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
SortAlphabeticallyClassList class>>buildHierarchyForClasses: aCollection [
	| nodes |
	nodes := aCollection asOrderedCollection sort: [:a :b  | a name < b name].
	^ self new
		list: nodes;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
SortAlphabeticallyClassList class>>buildListFor: aPackageGroup in: anEnvironment [
	^ aPackageGroup withClassesIn: anEnvironment createHierarchySorter: self 
]

{
	#category : #combining,
	#timestamp : ' 8/31/2017 05:26:22'
}
SortAlphabeticallyClassList>>, another  [

	^ self class new
		list: (self list, another list);
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
SortAlphabeticallyClassList>>initialize [
	list := OrderedCollection new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
SortAlphabeticallyClassList>>list [
	^ list
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
SortAlphabeticallyClassList>>list: aList [
	list := aList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
SortAlphabeticallyClassList>>sortedElements [
	^ list
]
