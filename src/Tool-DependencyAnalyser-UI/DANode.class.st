"
A PDNode is an abstract class for to display nodes in a tree.
"
Class {
	#name : #DANode,
	#superclass : #TreeNodeModel,
	#instVars : [
		'treeModelParent',
		'packageTreeNautilus',
		'packageTreeNautilusUI',
		'cycle'
	],
	#category : #Tool-DependencyAnalyser-UI-Nodes,
	#timestamp : 'BaptisteQuide 7/11/2014 11:43'
}

{
	#category : #building-menu,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>addMenuEntriesOn: aMenuGroup [
	"overide this method to add contextual menu on nodes"
]

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>browseClass: classToBrowse [
	Smalltalk tools browser openOnClass: classToBrowse
]

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>browseClassInNautilus: aClass [
	| nautilus |
	
	nautilus := self rootNode packageTreeNautilus.
	self setSelectionOnMethod: nil class: aClass with: nautilus.
	self refreshNautilus: nautilus.
	self rootNode packageTreeNautilusUI sourceTextModel announce: NautilusClassSelected.
]

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>browseInNautilus [
	^ self subclassResponsibility
]

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>browseInOtherNautilus [
	"do nothing by default"
]

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>browseMethodInNautilus: aMethod [
	| classToBrowse nautilus compiledMethod nautilusUI |
	nautilus := self rootNode packageTreeNautilus.
	nautilusUI := self rootNode packageTreeNautilusUI.
	classToBrowse := aMethod methodClass.
	compiledMethod := classToBrowse>>aMethod selector.
	self setSelectionOnMethod: compiledMethod class: classToBrowse with: nautilus.
	nautilusUI updateCategoryAndMethodList.
	nautilusUI sourceTextModel announce: NautilusMethodSelected.	
	
	
]

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>browsePackageInNautilus: aPackage [
	| classToBrowse classFromPackage classesToBrowse |
	classFromPackage := aPackage classes.
	classesToBrowse := classFromPackage reject: [ :class | classFromPackage includes: class superclass ].
	classToBrowse := classesToBrowse isEmpty
		ifFalse: [ (classesToBrowse sorted: [ :a :b | a asString < b asString ]) first ].
	classToBrowse ifNotNil: [ self browseClassInNautilus: classToBrowse ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>cycle: anObject [
	cycle := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>isClassToDependencyNode [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>isCycle [
	^ cycle
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>isCycleNode [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>isPackageNode [
 	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>isReferenceNode [
	^ false
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>label [
	^ self content displayString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>packageTreeNautilus [
	^ packageTreeNautilus
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>packageTreeNautilus: anObject [
	packageTreeNautilus := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>packageTreeNautilusUI [
	^ packageTreeNautilusUI
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>packageTreeNautilusUI: anObject [
	packageTreeNautilusUI := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>packageUnderAnalysis [
	^ self rootNode daPackage rPackageSet packages first
]

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>refreshNautilus: nautilus [

	| nautilusUI |
	nautilusUI := self rootNode packageTreeNautilusUI.
	nautilusUI updatePackageGroupAndClassList.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>rootNode [
	| rootNode currentNode |
	currentNode := self.
	rootNode := currentNode parentNode.
	[ rootNode isNil ]
		whileFalse: [ 
			currentNode := rootNode.
			rootNode := currentNode parentNode ].
	^ currentNode.
]

{
	#category : #browse-nautilus,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>setSelectionOnMethod: aMethod class: aClass with: nautilus [
	| protocol nautilusUI |
	aMethod ifNotNil: [ protocol := aMethod protocol ].
	nautilusUI := self rootNode packageTreeNautilusUI.
	self refreshNautilus: nautilus.
	nautilus
		browsedEnvironment: Nautilus defaultBrowsedEnvironment;
		showInstance: aClass isMeta not.
	nautilus
		package: aClass package
		class: aClass
		protocol: protocol
		method: aMethod.
	nautilusUI
		showHierarchy: false;
		giveFocusToMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>treeModelParent [
	^ treeModelParent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DANode>>treeModelParent: anObject [
	treeModelParent := anObject
]
