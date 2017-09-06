"
I'm a group node model for the last modified methods group.
"
Class {
	#name : #PackageTreeMethodGroupNodeModel,
	#superclass : #PackageTreeGroupModel,
	#category : #Nautilus-Tree,
	#timestamp : 'FranckWarlouzet 7/8/2015 16:55'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeMethodGroupNodeModel>>icon  [
	^ self model groupIconFor: self item.
]
