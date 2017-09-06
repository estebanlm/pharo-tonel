"
I am a Tree node especially made for being used by the Spec framework.
"
Class {
	#name : #SpecTreeNodeModel,
	#superclass : #MorphTreeNodeModel,
	#instVars : [
		'nodeModel',
		'icon',
		'childrenItems',
		'hasContents',
		'childrenItemsBlock'
	],
	#category : #Spec-MorphicAdapters-Support,
	#timestamp : '<historical>'
}

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>bindKeyCombination: aShortcut toAction: aBlock [
	"Do nothing"
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>childNodeFromItem: anItem [

	^ (anItem
		container: self model;
		buildWithSpec)
		parentNode: self;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>childrenItems [
	^ self model autoRefreshOnExpand
		ifTrue: [ childrenItemsBlock value ]
		ifFalse: [ childrenItems ifNil: [ childrenItems := childrenItemsBlock value ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>childrenItems: aCollection [
	childrenItems := aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>childrenItemsBlock [
	^ childrenItemsBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>childrenItemsBlock: aBlock [
	childrenItemsBlock := aBlock
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>content [
	^ self nodeModel content
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>contents [
	^ self childrenItems collect: [ :child | self childNodeFromItem: child ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>hasContentToShow [

	^ self nodeModel hasContentToShow
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>hasContents [
	hasContents isBlock
		ifTrue: [ ^ hasContents value ].
	^ self childrenItems notEmpty
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>hasContents: aBlock [

	hasContents := aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>helpText [

	^ nodeModel help
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>icon [

	^ icon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>icon: anIcon [

	icon := anIcon
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>isExpanded [

	^ self nodeModel isExpanded
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>isExpanded: aBoolean [

	self nodeModel isExpanded: aBoolean
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>lastClicked: aBoolean [

	self nodeModel lastClicked: aBoolean.
	aBoolean
		ifTrue: [ self model highlightedItem: self nodeModel ]
		ifFalse: [ self model highlightedItem: nil ].
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>mouseDown: event [

	self nodeModel mouseDownAction cull: event
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>nodeModel [
	^ nodeModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>nodeModel: anObject [
	nodeModel := anObject
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>selected [

	^ self nodeModel selected
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>selected: aBoolean [

	self nodeModel selected: aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTreeNodeModel>>setChildren: aBlock [
	"Store a aBlock which will return the children when evaluated."

	self childrenItemsBlock: aBlock
]
