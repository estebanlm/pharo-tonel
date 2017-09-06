"
My instances decide if an OmEntry is accepted applying an ""or"" logic operation with sub filters.
"
Class {
	#name : #EpOrFilter,
	#superclass : #EpFilter,
	#instVars : [
		'subFilters'
	],
	#category : #EpiceaBrowsers-Filters,
	#timestamp : 'MartinDias 8/20/2014 11:58'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOrFilter class>>withAll: aCollection  [
	^ self new 
		subFilters: aCollection;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOrFilter>>= other  [
	^ self class = other class and: [ self subFilters = other subFilters ]
]

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOrFilter>>accepts: anEntry [
	^ self subFilters anySatisfy: [ :aFilter | aFilter accepts: anEntry ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOrFilter>>hash [
	^ self class hash bitXor: self subFilters hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOrFilter>>subFilters [
	^ subFilters
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOrFilter>>subFilters: aCollectionOfFilters [
	subFilters := aCollectionOfFilters
]
