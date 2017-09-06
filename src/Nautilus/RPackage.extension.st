Extension {
	#name : #RPackage
}

{
	#category : #'*Nautilus',
	#timestamp : ' 8/31/2017 05:26:22'
}
RPackage>>asNautilusItemPath [
	^ Array with: self
]

{
	#category : #'*Nautilus',
	#timestamp : ' 8/31/2017 05:26:22'
}
RPackage>>asNautilusNodeWithModel: anObject [
	^ PackageTreePackageNodeModel with: self model: anObject.
]

{
	#category : #'*Nautilus',
	#timestamp : ' 8/31/2017 05:26:22'
}
RPackage>>asNautilusSelection  [
	^ PackageTreePackageSelection package: self
]

{
	#category : #'*Nautilus',
	#timestamp : ' 8/31/2017 05:26:22'
}
RPackage>>withClassesIn: anEnvironment createHierarchySorter: aHierarchClass [
	^ self asNautilusSelection withClassesIn: anEnvironment createHierarchySorter: aHierarchClass
]
