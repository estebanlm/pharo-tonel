"
Example for a package method node
"
Class {
	#name : #PackageMethodCategoryNodeExample,
	#superclass : #PackageAbstractNodeExample,
	#category : #Morphic-Examples-MorphTreeWidget,
	#timestamp : 'TorstenBergmann 2/3/2014 23:55'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageMethodCategoryNodeExample>>childNodeClassFromItem: anItem [
	^ PackageMethodNodeExample
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageMethodCategoryNodeExample>>childrenItems [
	^ self parentNode item selectorsInProtocol: self item
]
