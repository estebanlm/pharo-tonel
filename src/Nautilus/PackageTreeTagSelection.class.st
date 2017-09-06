"
I'm a tag selection.
"
Class {
	#name : #PackageTreeTagSelection,
	#superclass : #PackageTreePackageSelection,
	#category : #Nautilus-Tree,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeTagSelection class>>tag: aTag  [
	^ self node: ((PackageTreeTagNodeModel with: aTag)
		parentNode: (PackageTreePackageNodeModel with: aTag package);
		yourself)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeTagSelection>>classTags  [
	^ #()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeTagSelection>>classes  [
	^ self definedClasses
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeTagSelection>>definedClasses  [
	^ self item classes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeTagSelection>>extendedClasses [
	^ #()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeTagSelection>>extensionClasses [
	^ #()
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeTagSelection>>includesCategory: aSymbol [
	^ self categoryName asSymbol == aSymbol
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeTagSelection>>includesClass: aClass  [
	^ self item classNames includes: aClass instanceSide name.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeTagSelection>>isPackageTag [

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeTagSelection>>package  [
	^ self item package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeTagSelection>>removeTarget: target  [
	target removeClassCategory: self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeTagSelection>>renameTarget: target  [
	target renameClassCategory: self item.
]
