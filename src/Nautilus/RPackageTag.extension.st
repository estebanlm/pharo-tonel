Extension {
	#name : #RPackageTag
}

{
	#category : #'*Nautilus',
	#timestamp : ' 8/31/2017 05:26:22'
}
RPackageTag>>asNautilusItemPath [
	^ 	Array 
			with: self package
			with: self.

]

{
	#category : #'*Nautilus',
	#timestamp : ' 8/31/2017 05:26:22'
}
RPackageTag>>asNautilusNodeWithModel: anObject [
	^ PackageTreeTagNodeModel with: self model: anObject.
]

{
	#category : #'*Nautilus',
	#timestamp : ' 8/31/2017 05:26:22'
}
RPackageTag>>asNautilusSelection  [
	^ PackageTreeTagSelection tag: self
]

{
	#category : #'*Nautilus',
	#timestamp : ' 8/31/2017 05:26:22'
}
RPackageTag>>withClassesIn: aRBBrowserEnvironment createHierarchySorter: aClass  [
	^ self asNautilusSelection withClassesIn: aRBBrowserEnvironment createHierarchySorter: aClass
]
