"
I represent a node in a tree widget.
I hold an item, an icon and the list of my children.

In addition, I have a filtering mechanism
"
Class {
	#name : #TreeNodeModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'children',
		'content',
		'icon',
		'container',
		'matchTokenFilter',
		'contents',
		'parentNode',
		'childNodeClass',
		'selected',
		'lastClicked',
		'mouseDownAction',
		'hasContentToShow',
		'isExpanded',
		'hasChildren'
	],
	#category : #Spec-Core-Widgets,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel class>>adapterName [

	^ #TreeNodeAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel class>>defaultSpec [
	<spec: #default>
	
	^ #(TreeNodeAdapter
		adapt: #(model))
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>allSelectedItems [
	| result |
	
	result := OrderedCollection new.
	self selected ifTrue: [ result add: self ].
	self children value do: [ :e | 
		result addAll: e allSelectedItems ].
	^ result
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>allUnselectedItems [
	| result |
	
	result := OrderedCollection new.
	self selected ifFalse: [ result add: self ].
	self children value do: [ :e | 
		result addAll: e allUnselectedItems ].
	^ result
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>buildChildren [

	contents := self children value collect: [ :each || node | 
		node := each isTreeNodeModel
			ifTrue: [ each ]
			ifFalse: [  (self childNodeClassFor: each) new
				content: each  ].
		node 
			parentNode: self;
			yourself ].
		
	^ contents
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>childNodeClass [

	^ childNodeClass value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>childNodeClass: aBlock [

	childNodeClass value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>childNodeClassFor: anItem [

	^ childNodeClass value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>children [

	^ children value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>children: aBlock [

	children value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>container [

	^ container value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>container: anObject [

	container value: anObject
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>content [

	^ content value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>content: anObject [

	content value: anObject
]

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>contents [
	^ contents ifNil: [ 
		self buildChildren.
		contents ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>hasChildren [

	^ hasChildren value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>hasChildren: aBlock [

	hasChildren value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>hasContentToShow [

	^ hasContentToShow value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>hasContentToShow: aBlock [

	hasContentToShow value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>icon [

	^ icon value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>icon: anIcon [

	icon value: anIcon
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>iconName: aSelector [

	icon value: (self iconNamed: aSelector)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>initialize [

	super initialize.

	children := [ self container childrenFor: self content ] asValueHolder.
	hasChildren := [ self container hasChildrenFor: self content ] asValueHolder.
	content := nil asValueHolder.
	icon := nil asValueHolder.
	container := nil asValueHolder.
	matchTokenFilter := [ :aFilter | false ] asValueHolder.
	parentNode := nil asValueHolder.
	childNodeClass := self class asValueHolder.
	selected := false asValueHolder.
	lastClicked := false asValueHolder.
	mouseDownAction := [:event | ] asValueHolder.
	hasContentToShow := false asValueHolder.
	isExpanded := false asValueHolder.
	
	selected whenChangedDo: [ :aBoolean | self changed: #selected: with: { aBoolean } ].
	isExpanded whenChangedDo: [ :aBoolean | self changed: #isExpanded: with: { aBoolean } ].
]

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>isEmpty [
	^ self contents isEmpty
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>isExpanded [
	
	^ isExpanded value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>isExpanded: aBoolean [

	isExpanded value: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>isPartialMatch [
	| result |

	result := false.
	
	self children value do: [:each | 
		(each selected or: [ each isPartialMatch ]) ifTrue: [ result := true ] ].

	^ result
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>isTreeNodeModel [

	^ true
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>lastClicked [
	
	^ lastClicked value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>lastClicked: aBoolean [

	lastClicked value: aBoolean
]

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>matchTokenFilter: aFilter [

	^ self matchTokenFilterBlock value: aFilter
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>matchTokenFilterBlock [

	^ matchTokenFilter value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>matchTokenFilterBlock: aBlock [

	matchTokenFilter value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>mouseDownAction [

	^ mouseDownAction value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>mouseDownAction: aBlock [

	mouseDownAction value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>parentNode [

	^ parentNode value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>parentNode: aNode [

	parentNode value: aNode
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>selectAllChildren [

	self children value do: [ :e | 
		e selected: true.
		e selectAllChildren ].
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>selected [
	
	^ selected value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>selected: aBoolean [

	selected value: aBoolean
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>takeHighlight [

	self changed: #takeHighlight with: #()
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>unselectAllChildren [

	self children value do: [ :e | 
		e selected: false.
		e unselectAllChildren ].	
]

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>updateAccordingTo: aFilter [

	(aFilter keepTreeNode: self) 
		ifFalse: [
			self changed: #updateAccordingTo: with: { aFilter } ]
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>whenContentChanged: aBlock [

	content whenChangedDo: aBlock

	
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>whenIsExpandedChanged: aBlock [

	isExpanded whenChangedDo: aBlock

	
]

{
	#category : #api-events,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeNodeModel>>whenSelectedChanged: aBlock [

	selected whenChangedDo: aBlock

	
]
