"
A builder for the settings tree
"
Class {
	#name : #SettingTreeBuilder,
	#superclass : #Object,
	#instVars : [
		'nodeList',
		'currentParent',
		'currentPragma'
	],
	#category : #System-Settings-Browser,
	#timestamp : 'TorstenBergmann 1/31/2014 10:32'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingTreeBuilder class>>acceptableKeywords: aCollectionOfRegExps  [
	^ self new acceptableKeywords: aCollectionOfRegExps 

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingTreeBuilder>>buildPragma: aPragma [
	currentPragma := aPragma.
	self perform: aPragma keyword withArguments: aPragma arguments.
	^ nodeList
]

{
	#category : #'public tree building',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingTreeBuilder>>group: aSymbol [
	^ self nodeClass: PragmaSetting name: aSymbol

]

{
	#category : #'public tree building',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingTreeBuilder>>launcher: aSymbol [
	^ self nodeClass: SystemSettingLauncher name: aSymbol

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingTreeBuilder>>nodeClass [
	^ SettingNode
]

{
	#category : #'private tree building',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingTreeBuilder>>nodeClass: aClass name: aSymbol [
	| node |
	node := self nodeClass with: aClass new.
	node item name: aSymbol.
	node pragma: currentPragma.
	node parentName: (currentParent ifNotNil: [currentParent name]).
	self nodeList add: node.
	^ (SettingNodeBuilder new) node: node; builder: self; yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingTreeBuilder>>nodeList [
	^ nodeList ifNil: [nodeList := OrderedCollection new]

]

{
	#category : #'private tree building',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingTreeBuilder>>parent: aNode while: aBlock [
	| oldParent |
	oldParent := currentParent.
	currentParent := aNode.
	aBlock value.
	currentParent := oldParent
]

{
	#category : #'public tree building',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingTreeBuilder>>pickOne: aSymbol [
	^ self nodeClass: PickOneSettingDeclaration name: aSymbol

]

{
	#category : #'public tree building',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingTreeBuilder>>range: aSymbol [
	^ self nodeClass: RangeSettingDeclaration name: aSymbol

]

{
	#category : #'public tree building',
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingTreeBuilder>>setting: aSymbol [
	^ self nodeClass: SettingDeclaration name: aSymbol

]

{
	#category : #pragmas,
	#timestamp : ' 8/31/2017 05:26:16'
}
SettingTreeBuilder>>systemsettings [
	"Process a <systemsettings> pragma"

	<settingPragmaProcessor>
	currentPragma methodClass theNonMetaClass
		perform: currentPragma methodSelector
		with: self
]
