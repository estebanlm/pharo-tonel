"
I'm a group node model for the package groups
"
Class {
	#name : #PackageTreePackageGroupNodeModel,
	#superclass : #PackageTreeGroupModel,
	#category : #Nautilus-Tree,
	#timestamp : 'FranckWarlouzet 7/8/2015 16:55'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageGroupNodeModel>>canBeRenamed [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageGroupNodeModel>>childNodeClassFromItem: anItem [
	^ PackageTreePackageNodeModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageGroupNodeModel>>childrenItems [
	^ self item elements
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageGroupNodeModel>>doubleClick [
	self model model renameGroup
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageGroupNodeModel>>icon [
	^ self iconNamed: #publishIcon
]
