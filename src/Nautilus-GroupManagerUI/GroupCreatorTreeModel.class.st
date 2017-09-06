"
Tree model for group creation in Nautilus
"
Class {
	#name : #GroupCreatorTreeModel,
	#superclass : #MorphTreeModel,
	#instVars : [
		'model'
	],
	#category : #Nautilus-GroupManagerUI,
	#timestamp : 'TorstenBergmann 2/4/2014 21:13'
}

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupCreatorTreeModel>>acceptDroppingMorph: transferMorph event: evt inMorph: listMorph [
	"transferMorph passenger complexContents item pour récupérer le package"

	| group package target |
	(listMorph scrollerSubMorphFromPoint: evt position) complexContents
		ifNil: [ 
			self model groupManager patternModel acceptEditsInView.
			^ self ]
		ifNotNil: [ :node | target := node ].
	target isGroup
		ifTrue: [ group := target item ]
		ifFalse: [ group := target parentNode item ].
	package := transferMorph passenger complexContents item.
	self model groupManager add: {package} into: group.
	self model groupTree updateList.
	self model groupManager patternModel acceptEditsInView
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupCreatorTreeModel>>dropEnabled [
	^ true
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupCreatorTreeModel>>groups [

	^ self model groups
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupCreatorTreeModel>>groupsManager [

	^ self model groupsManager
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupCreatorTreeModel>>hardlySelectItem: anItem [

	self selectNodePath: ((self setSelectedNodeItem: anItem)collect:#complexContents)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupCreatorTreeModel>>model [

	^ model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupCreatorTreeModel>>model: anObject [

	model := anObject
]

{
	#category : #'t - accessing',
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupCreatorTreeModel>>rootItems [
	
	^ self groups
]

{
	#category : #'t - accessing',
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupCreatorTreeModel>>rootNodeClassFromItem: anItem [

	^ GroupNode
]

{
	#category : #'t - accessing',
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupCreatorTreeModel>>selection [

	| list |
	list := self rootItems.
	(list notEmpty and: [ super selection isNil ])
		ifTrue: [	self hardlySelectItem: list first ].
	^ super selection
]

{
	#category : #'t - accessing',
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupCreatorTreeModel>>selection: aNode [
	super selection: aNode.
	self model updateSelectedNode
]

{
	#category : #'t - accessing',
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupCreatorTreeModel>>setSelectedNodeItem: anItem [

	^ self model setSelectedNodeItem: anItem
]

{
	#category : #'drag and drop',
	#timestamp : ' 8/31/2017 05:26:22'
}
GroupCreatorTreeModel>>wantsDroppedMorph: transferMorph event: evt inMorph: listMorph [
	(transferMorph isKindOf: TransferMorph)
		ifFalse: [ ^ false ].
	(self model groupManager dragTransferTypeForMorph: listMorph) = #SelectedPackage
		ifFalse: [ ^ false ].
	^ true
]
