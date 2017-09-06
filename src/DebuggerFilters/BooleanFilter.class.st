"
A filter for booleans
"
Class {
	#name : #BooleanFilter,
	#superclass : #StackFilter,
	#instVars : [
		'filters',
		'booleanOperator'
	],
	#category : #DebuggerFilters,
	#timestamp : 'TorstenBergmann 1/31/2014 11:30'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:17'
}
BooleanFilter class>>withFilters: someFilters operator: booleanOperator [
	^self new 
		filters: someFilters; 
		booleanOperator: booleanOperator
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
BooleanFilter>>booleanOperator [
	^booleanOperator
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
BooleanFilter>>booleanOperator: aSymbol [
	booleanOperator:= aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
BooleanFilter>>filters [
	^filters
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
BooleanFilter>>filters: theFilters [
	filters:= theFilters
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:17'
}
BooleanFilter>>shouldDisplay: aContext [
	^ (self filters first shouldDisplay: aContext) perform: booleanOperator with: [self filters last shouldDisplay: aContext]  
]
