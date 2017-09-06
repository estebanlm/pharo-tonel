"
An IdentityMorphTreeListManager is a MorphTreeListManager which always check for identity between items

"
Class {
	#name : #IdentityMorphTreeListManager,
	#superclass : #MorphTreeListManager,
	#category : #Nautilus-MorphTreeWidget-Extension,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
IdentityMorphTreeListManager>>nodeMorphsWithAllNodeItems: aNodeItemList [

	^ self allNodeMorphs select: [:m | aNodeItemList identityIncludes: m complexContents withoutListWrapper]
]
