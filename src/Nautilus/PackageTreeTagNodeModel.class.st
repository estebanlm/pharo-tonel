"
I'm a tag node model.
"
Class {
	#name : #PackageTreeTagNodeModel,
	#superclass : #PackageTreeNodeModel,
	#category : #Nautilus-Tree,
	#timestamp : '<historical>'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeTagNodeModel>>asNautilusSelection  [
	^ PackageTreeTagSelection node: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeTagNodeModel>>canBeRenamed [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeTagNodeModel>>icon  [
	^ self model tagIconFor: self item
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeTagNodeModel>>rowMorphForColumn: aTreeColumn [
	^ self item name asMorph
]
