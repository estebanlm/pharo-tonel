"
I am an abstract group node model
"
Class {
	#name : #PackageTreeGroupModel,
	#superclass : #PackageTreeNodeModel,
	#category : #Nautilus-Tree,
	#timestamp : 'FranckWarlouzet 7/19/2015 11:44'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeGroupModel>>asNautilusSelection [
	^ PackageTreeGroupSelection node: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeGroupModel>>rowMorphForColumn: aTreeColumn [
	^ self item name asMorph
]
