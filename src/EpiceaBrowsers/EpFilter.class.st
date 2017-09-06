"
My instances decide if an OmEntry is accepted.
"
Class {
	#name : #EpFilter,
	#superclass : #Object,
	#category : #EpiceaBrowsers-Filters,
	#timestamp : 'MartinDias 8/20/2014 11:58'
}

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpFilter>>accepts: anEntry [
	^ self subclassResponsibility
]
