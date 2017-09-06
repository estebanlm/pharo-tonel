"
I'm the core of Hiedra. See my users to understand me.
"
Class {
	#name : #HiRulerController,
	#superclass : #Object,
	#instVars : [
		'rulerBuilder',
		'rulerForm',
		'indexesByNode',
		'nodes',
		'treeModel'
	],
	#category : #Hiedra-Spec,
	#timestamp : 'MartinDias 7/8/2015 14:59'
}

{
	#category : #private-refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerController>>buildIndexesByNode [
	indexesByNode := IdentityDictionary new.
	nodes withIndexDo: [ :aNode :index |
		indexesByNode 
			at: aNode 
			put: index ]
]

{
	#category : #private-refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerController>>buildRulerForm [
	rulerForm := 
		rulerBuilder
			values: nodes;
			form
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerController>>indexOfNode: aNode [
	^ indexesByNode at: aNode
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerController>>initialize [
	super initialize.
	self initializeRulerBuilder.
	nodes := #().
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerController>>initializeRulerBuilder [
	rulerBuilder := HiRulerBuilder new.
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerController>>newTreeColumnModel [
	"Answer a TreeColumnModel ready to be used in a TreeModel."
	
	^ TreeColumnModel new	
		displayBlock: [ :item | self rowMorphFor: item content ];
		yourself.	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerController>>nodes [
	^ nodes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerController>>preferredWidth [
	^ rulerForm width
]

{
	#category : #private-refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerController>>refreshRuler [
	self buildIndexesByNode.
	self buildRulerForm.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerController>>rowMorphFor: aMorphTreeNode [
	^ HiRulerLazyMorph model: self key: aMorphTreeNode withoutListWrapper
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerController>>rulerBuilder [
	^ rulerBuilder
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerController>>rulerForm [
	^ rulerForm
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerController>>rulerMorphBoundsFor: aNode [
	| nodeIndex |
	"hack: sync with tree if needed"
	(nodes includes: aNode) ifFalse: [ self updateFromTree ].
	
	nodeIndex := self indexOfNode: aNode.

	^ 0 @ ((nodeIndex - 1) * rulerBuilder rowSize) corner: rulerForm width @ (nodeIndex * rulerBuilder rowSize)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerController>>treeModel [
	^ treeModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerController>>treeModel: anObject [
	treeModel := anObject
]

{
	#category : #private-refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerController>>updateFromTree [
	self values: treeModel roots
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
HiRulerController>>values: aCollection  [
	nodes := aCollection.
	
	self refreshRuler.
]
