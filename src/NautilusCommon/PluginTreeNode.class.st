"
A PluginTreeNode is a node of a NautilusPluginManagerTree
"
Class {
	#name : #PluginTreeNode,
	#superclass : #MorphTreeNodeModel,
	#instVars : [
		'selectedPosition'
	],
	#category : #NautilusCommon-Plugin-Manager,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
PluginTreeNode>>buildDropListFor: aSelector [

	| dropList |
	dropList :=  self theme
					newDropListIn: World
					for: self
					list: #getPositionsList
					getSelected: #getSelectedPosition
					setSelected: #setSelectedPosition:
					getEnabled: nil
					useIndex: true
					help: 'Select the position where the plugin will be displayed'.
	dropList
		hResizing: #rigid.
	dropList width: 75.
	^ dropList
]

{
	#category : #morphs,
	#timestamp : ' 8/31/2017 05:26:22'
}
PluginTreeNode>>firstMorph [

	^ self item 
		ifNotNil: [:it | it first pluginName asStringMorph ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
PluginTreeNode>>getPositionsList [

	^ self item 
		ifNil: [ {} ]
		ifNotNil: [:it | it first possiblePositions ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
PluginTreeNode>>getSelectedPosition [

	^ selectedPosition ifNil: [| it |
		it := self item ifNotNil: [ self item second ].
		selectedPosition := self getPositionsList indexOf: it ]
]

{
	#category : #morphs,
	#timestamp : ' 8/31/2017 05:26:22'
}
PluginTreeNode>>secondMorph [
	
	^ self item 
		ifNotNil: [:it |	self buildDropListFor: it second ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
PluginTreeNode>>setSelectedPosition: anIndex [

	| position |
	selectedPosition := anIndex.
	position := self getPositionsList at: anIndex.
	self item at: 2 put: position.
	self changed: #getSelectedPosition
]
