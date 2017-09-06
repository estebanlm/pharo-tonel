"
Abstract wrapper for method references
"
Class {
	#name : #AbstractMethodReferenceConverter,
	#superclass : #AbstractMethodConverter,
	#instVars : [
		'referencesList'
	],
	#category : #Tool-Base,
	#timestamp : 'TorstenBergmann 2/20/2014 13:48'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMethodReferenceConverter class>>methodReference: aMessage referencesList: aListOfReferences [
	^ (self method: aMessage)
		referencesList: aListOfReferences;
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMethodReferenceConverter>>initialize [

	super initialize.
	referencesList := #()
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMethodReferenceConverter>>priorVersionOfAMethod: aMethodReference [
	| tempList |
	
	tempList := referencesList select:[:each | 
		(each className = aMethodReference className) & 
		(each name = aMethodReference name)].
	^ tempList detect: [:each | (self versionOfAMethod: each) = ((self versionOfAMethod: aMethodReference) -1)] ifNone: [aMethodReference].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMethodReferenceConverter>>referencesList: aListOfReferences [

	referencesList := aListOfReferences
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
AbstractMethodReferenceConverter>>versionOfAMethod: aMethodReference [
	| tempList |
	
	tempList := referencesList select: [:each | 
		(each className = aMethodReference className) & 
		(each name = aMethodReference name)].
	tempList := tempList sort: [:m1 :m2 | m1 timeStamp < m2 timeStamp].
	^ tempList identityIndexOf: aMethodReference ifAbsent: [0]
]
