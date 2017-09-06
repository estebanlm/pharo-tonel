"
I'm a package selection.
"
Class {
	#name : #PackageTreePackageSelection,
	#superclass : #PackageTreeSelection,
	#category : #Nautilus-Tree,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageSelection class>>package: aPackage  [
	^ self node: (PackageTreePackageNodeModel with: aPackage)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageSelection>>categoryName  [
	^ self item categoryName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageSelection>>classTags  [
	^ self item classTags
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageSelection>>classes  [
	^ self item classes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageSelection>>definedClasses  [
	^ self item definedClasses
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageSelection>>extendedClasses [
	^ self item extendedClasses
]

{
	#category : #'system compatibility',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageSelection>>extensionCategoriesForClass: aClass [
	^ self item extensionCategoriesForClass: aClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageSelection>>extensionClasses [
	^ self item extensionClasses
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageSelection>>includesCategory: aSymbol [
	^ self package name == aSymbol
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageSelection>>includesClass: aClass  [
	^ self item includesClass: aClass
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageSelection>>includesSelector: aSelector ofClass: aClass [
	^ self item includesSelector: aSelector ofClass: aClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageSelection>>menu: aMenu shifted: aBoolean target: aTarget [
	^ aTarget packagesMenu: aMenu shifted: aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageSelection>>package  [
	^ self item
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageSelection>>packageComment [
	^ self item package packageComment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageSelection>>packageComment: aDescription [
	^ self item package packageComment: aDescription
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageSelection>>packageName [
	^ self item packageName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageSelection>>registerSelectionTarget: aTarget  [
	aTarget registerSelectionPackage: self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageSelection>>removeTarget: target  [
	target removePackageCategory: self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreePackageSelection>>renameTarget: target    [
	target renamePackageCategory: self item.
]
