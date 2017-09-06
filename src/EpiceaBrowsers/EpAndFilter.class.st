"
A TrAndFilter is a chain of AND filters.
"
Class {
	#name : #EpAndFilter,
	#superclass : #EpFilter,
	#instVars : [
		'subFilters'
	],
	#category : #EpiceaBrowsers-Filters,
	#timestamp : 'LucasGodoy 10/10/2014 17:18'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAndFilter class>>withAll: aCollection  [
	^ self new 
		subFilters: aCollection;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAndFilter>>= other  [
	^ self class = other class and: [ self subFilters = other subFilters ]
]

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAndFilter>>accepts: anEntry [
	^ self subFilters allSatisfy: [ :aFilter | aFilter accepts: anEntry ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAndFilter>>hash [
	^ self class hash bitXor: self subFilters hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAndFilter>>subFilters [
	^ subFilters
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpAndFilter>>subFilters: aCollectionOfFilters [
	subFilters := aCollectionOfFilters
]
