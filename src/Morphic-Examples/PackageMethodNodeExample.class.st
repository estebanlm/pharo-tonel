"
Example for a package method node
"
Class {
	#name : #PackageMethodNodeExample,
	#superclass : #PackageAbstractNodeExample,
	#category : #Morphic-Examples-MorphTreeWidget,
	#timestamp : 'TorstenBergmann 2/3/2014 23:55'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageMethodNodeExample>>browseItem [
	Smalltalk tools browser openOnClass: self itemClass  selector: self selector 
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageMethodNodeExample>>compiledMethod [
	^ self itemClass
		compiledMethodAt: self selector
		ifAbsent: [self itemClass class
				compiledMethodAt: self selector
				ifAbsent: []]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageMethodNodeExample>>itemClass [
	^ self parentNode parentNode item.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageMethodNodeExample>>selector [
	^ self item
]
