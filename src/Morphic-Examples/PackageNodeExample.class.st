"
Example for a pakage node
"
Class {
	#name : #PackageNodeExample,
	#superclass : #PackageAbstractNodeExample,
	#category : #Morphic-Examples-MorphTreeWidget,
	#timestamp : 'TorstenBergmann 2/3/2014 23:55'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageNodeExample>>asString [
	^ self item packageName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageNodeExample>>childNodeClassFromItem: anItem [
	^  PackageClassNodeExample 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PackageNodeExample>>childrenItems [
	^ self item classes 
]
