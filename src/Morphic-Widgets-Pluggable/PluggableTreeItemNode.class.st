"
Tree item for PluggableTreeMorph.
"
Class {
	#name : #PluggableTreeItemNode,
	#superclass : #ListItemWrapper,
	#category : #Morphic-Widgets-Pluggable,
	#timestamp : 'ar 2/12/2005 04:37'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeItemNode>>acceptDroppingObject: anotherItem [
	^model dropNode: anotherItem on: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeItemNode>>asString [
	^model printNode: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeItemNode>>balloonText [
	^model balloonTextForNode: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeItemNode>>canBeDragged [
	^model isDraggableNode: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeItemNode>>contents [
	^model contentsOfNode: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeItemNode>>hasContents [
	^model hasNodeContents: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeItemNode>>icon [
	^model iconOfNode: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeItemNode>>wantsDroppedObject: anotherItem [
	^model wantsDroppedNode: anotherItem on: self
]
