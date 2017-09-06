"
A filter for selectors
"
Class {
	#name : #SelectorFilter,
	#superclass : #StackFilter,
	#instVars : [
		'selectors'
	],
	#category : #DebuggerFilters,
	#timestamp : 'TorstenBergmann 1/31/2014 11:30'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:17'
}
SelectorFilter class>>forSelector: aSelector [
	|filter|
	
	filter:= self new.
	filter selectors add: aSelector.
	^ filter
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:17'
}
SelectorFilter class>>forSelectors: someSelectors [
	 |filter|
	
	 filter:= self new.
	 filter selectors addAll: someSelectors.
	^ filter
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:17'
}
SelectorFilter>>initialize [
	super initialize.
	self selectors: OrderedCollection new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
SelectorFilter>>selectors [
 	^selectors
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
SelectorFilter>>selectors: someSelectors [
	selectors := someSelectors
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:17'
}
SelectorFilter>>shouldDisplay: aContext [
	 ^ (self selectors  
		includes: aContext method selector) not.
]
