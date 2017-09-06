"
I'm a package node model.
"
Class {
	#name : #PackageTreePackageNodeModel,
	#superclass : #PackageTreeNodeModel,
	#category : #Nautilus-Tree,
	#timestamp : '<historical>'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageNodeModel>>asNautilusSelection [
	^ PackageTreePackageSelection node: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageNodeModel>>canBeRenamed [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageNodeModel>>childNodeClassFromItem: anItem  [
	^ PackageTreeTagNodeModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageNodeModel>>childrenItems [
	| tags |

	tags := self item classTags.
	"If there is just one, do not show"
	^ (tags size = 1 and: [ tags anyOne name = self item name ])
		ifTrue: [ #() ]
		ifFalse: [ tags sorted: [ :a :b | a categoryName < b categoryName ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageNodeModel>>helpText [
	^ self model helpTextFor: self item.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageNodeModel>>icon  [
	^ self model packageIconFor: self item.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageNodeModel>>rowMorphForColumn: aTreeColumn [
	^ self item name asMorph
]
