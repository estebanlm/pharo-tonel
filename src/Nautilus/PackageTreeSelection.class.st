"
I'm a base selection of an item from package tree. 

"
Class {
	#name : #PackageTreeSelection,
	#superclass : #Object,
	#instVars : [
		'node'
	],
	#category : #Nautilus-Tree,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection class>>new  [
	self error: 'Use #node:'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection class>>node: aNode  [
	^ self basicNew 
		initializeNode: aNode;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>= other  [
	^ (self class = other class) and:[ self item = other item].

]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>asNautilusSelection [
	^ self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>categoryName  [
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>definedClasses [
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>extendedClasses [
	^ #()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>extensionClasses [
	^ #()
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>hash [
	^ self class hash bitXor: self item hash
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>includesCategory: aSymbol [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>includesClass: aClass  [
	^ self subclassResponsibility
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>initializeNode: aNode  [
	self initialize.
	node := aNode. 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>isGroup  [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>isPackageTag [

	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>item  [
	^ self node item.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>mcPackage  [
	^ self package mcPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>menu: aMenu shifted: aBoolean target: aTarget [
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>name  [
	^ self item name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>node  [
	^ node
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>nodePath  [
	^ self node path
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>registerSelectionTarget: aTarget  [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>removeTarget: target  [
	self subclassResponsibility.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>renameTarget: target  [

]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeSelection>>withClassesIn: anEnvironment createHierarchySorter: aHierarchyClass  [
	| classes defined extensions |
	classes := self definedClasses collect: #theNonMetaClass.
	anEnvironment isSystem
		ifFalse: [ classes := classes intersection: anEnvironment classes ].

	defined := aHierarchyClass buildHierarchyForClasses: classes.
	
	classes := self extensionClasses collect: #theNonMetaClass.
	anEnvironment isSystem
		ifFalse: [ classes := classes intersection: anEnvironment classes ].
	
	extensions := aHierarchyClass buildHierarchyForClasses: classes asSet.

	^ defined, extensions
]
