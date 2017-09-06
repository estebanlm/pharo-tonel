"

"
Class {
	#name : #GLMExpanderContentsNodeModel,
	#superclass : #MorphTreeNodeModel,
	#instVars : [
		'containerNode'
	],
	#category : #Glamour-Morphic-Widgets,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExpanderContentsNodeModel>>containerNode [
	^ containerNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExpanderContentsNodeModel>>containerNode: anObject [
	containerNode := anObject
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExpanderContentsNodeModel>>elementColumn [
	| row morph |
	
	morph := GLMMorphicPaneWithoutTitleRenderer new render: self containerNode item.
	morph 
		borderStyle: (UITheme current buttonSelectedBorderStyleFor: morph).

	row := OrderedCollection with: morph.
	^ UITheme current newRowIn: World for: row
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExpanderContentsNodeModel>>icon [
	^ nil
]
