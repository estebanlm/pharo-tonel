"
I'm a group selection for group.
"
Class {
	#name : #PackageTreeGroupSelection,
	#superclass : #PackageTreeSelection,
	#category : #Nautilus-Tree,
	#timestamp : 'FranckWarlouzet 7/8/2015 17:15'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeGroupSelection class>>group: aGroup [
	^ self node: (PackageTreeMethodGroupNodeModel with: aGroup)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeGroupSelection>>categoryName  [
	^ ''
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeGroupSelection>>classes [
	^ self definedClasses
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeGroupSelection>>definedClasses [
	^ self item classes
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeGroupSelection>>includesCategory: aSymbol [
	^ self item packages anySatisfy: [ :each | each name == aSymbol ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeGroupSelection>>includesClass: aClass [
	^ self item hasClassNamed: aClass name
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeGroupSelection>>isGroup  [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeGroupSelection>>isReadOnly  [
	^ self item isReadOnly 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeGroupSelection>>menu: aMenu shifted: aBoolean target: aTarget [
	^ aTarget groupsMenu: aMenu shifted: aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeGroupSelection>>methodsFor: class  [
	^ self item methodsFor: class
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeGroupSelection>>methodsFor: class categorised: aCategory [
	^ self item 
		methodsFor: class 
		categorised: aCategory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeGroupSelection>>package  [
	^ self item packages 
		ifNotEmpty: [ :packages | packages first ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeGroupSelection>>protocolsFor: class  [
	^ self item protocolsFor: class
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeGroupSelection>>registerSelectionTarget: aTarget  [
	aTarget registerSelectionGroup: self.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
PackageTreeGroupSelection>>removable  [
	^ self item removable 
]
