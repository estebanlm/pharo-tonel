"
A filter on the current stack for debugging
"
Class {
	#name : #StackFilter,
	#superclass : #Object,
	#instVars : [
		'stack'
	],
	#category : #DebuggerFilters,
	#timestamp : 'TorstenBergmann 1/31/2014 11:30'
}

{
	#category : #operators,
	#timestamp : ' 8/31/2017 05:26:17'
}
StackFilter>>and: aFilter [
	  ^ BooleanFilter withFilters: (OrderedCollection with: self with: aFilter) operator: #and:
]

{
	#category : #operators,
	#timestamp : ' 8/31/2017 05:26:17'
}
StackFilter>>or: aFilter [
	  ^ BooleanFilter withFilters: (OrderedCollection with: self with: aFilter) operator: #or:
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:17'
}
StackFilter>>shouldDisplay: aContext [
	^self subclassResponsibility 
]
