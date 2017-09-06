"
Example for a package class node
"
Class {
	#name : #PackageClassNodeExample,
	#superclass : #PackageAbstractNodeExample,
	#category : #Morphic-Examples-MorphTreeWidget,
	#timestamp : 'TorstenBergmann 2/3/2014 23:55'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageClassNodeExample>>browseItem [
	Smalltalk tools browser openOnClass: self item
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageClassNodeExample>>childNodeClassFromItem: anItem [
	^PackageMethodCategoryNodeExample
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageClassNodeExample>>childrenItems [
	^ self item organization categories 

]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageClassNodeExample>>methodsInCategory: aCat [
	^ self item  selectorsInProtocol: aCat
]
