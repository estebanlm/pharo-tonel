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
	#category : #Spec-Core-Widgets
}

{ #category : #specs }
TreeNodeModel class >> adapterName [

	^ #TreeNodeAdapter
]

{ #category : #specs }
TreeNodeModel class >> defaultSpec [
	<spec: #default>
	
	^ #(TreeNodeAdapter
		adapt: #(model))
]

{ #category : #api }
TreeNodeModel >> allSelectedItems [
	| result |
	
	result := OrderedCollection new.
	self selected ifTrue: [ result add: self ].
	self children value do: [ :e | 
		result addAll: e allSelectedItems ].
	^ result
]

{ #category : #api }
TreeNodeModel >> allUnselectedItems [
	| result |
	
	result := OrderedCollection new.
	self selected ifFalse: [ result add: self ].
	self children value do: [ :e | 
		result addAll: e allUnselectedItems ].
	^ result
]

{ #category : #api }
TreeNodeModel >> buildChildren [

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

{ #category : #api }
TreeNodeModel >> childNodeClass [

	^ childNodeClass value
]

{ #category : #api }
TreeNodeModel >> childNodeClass: aBlock [

	childNodeClass value: aBlock
]

{ #category : #api }
TreeNodeModel >> childNodeClassFor: anItem [

	^ childNodeClass value
]

{ #category : #api }
TreeNodeModel >> children [

	^ children value
]

{ #category : #api }
TreeNodeModel >> children: aBlock [

	children value: aBlock
]

{ #category : #api }
TreeNodeModel >> container [

	^ container value
]

{ #category : #api }
TreeNodeModel >> container: anObject [

	container value: anObject
]

{ #category : #api }
TreeNodeModel >> content [

	^ content value
]

{ #category : #api }
TreeNodeModel >> content: anObject [

	content value: anObject
]

{ #category : #filtering }
TreeNodeModel >> contents [
	^ contents ifNil: [ 
		self buildChildren.
		contents ]
]

{ #category : #api }
TreeNodeModel >> hasChildren [

	^ hasChildren value
]

{ #category : #api }
TreeNodeModel >> hasChildren: aBlock [

	hasChildren value: aBlock
]

{ #category : #api }
TreeNodeModel >> hasContentToShow [

	^ hasContentToShow value
]

{ #category : #api }
TreeNodeModel >> hasContentToShow: aBlock [

	hasContentToShow value: aBlock
]

{ #category : #api }
TreeNodeModel >> icon [

	^ icon value
]

{ #category : #api }
TreeNodeModel >> icon: anIcon [

	icon value: anIcon
]

{ #category : #api }
TreeNodeModel >> iconName: aSelector [

	icon value: (self iconNamed: aSelector)
]

{ #category : #initialization }
TreeNodeModel >> initialize [

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

{ #category : #filtering }
TreeNodeModel >> isEmpty [
	^ self contents isEmpty
]

{ #category : #api }
TreeNodeModel >> isExpanded [
	
	^ isExpanded value
]

{ #category : #api }
TreeNodeModel >> isExpanded: aBoolean [

	isExpanded value: aBoolean
]

{ #category : #api }
TreeNodeModel >> isPartialMatch [
	| result |

	result := false.
	
	self children value do: [:each | 
		(each selected or: [ each isPartialMatch ]) ifTrue: [ result := true ] ].

	^ result
]

{ #category : #converting }
TreeNodeModel >> isTreeNodeModel [

	^ true
]

{ #category : #api }
TreeNodeModel >> lastClicked [
	
	^ lastClicked value
]

{ #category : #api }
TreeNodeModel >> lastClicked: aBoolean [

	lastClicked value: aBoolean
]

{ #category : #filtering }
TreeNodeModel >> matchTokenFilter: aFilter [

	^ self matchTokenFilterBlock value: aFilter
]

{ #category : #api }
TreeNodeModel >> matchTokenFilterBlock [

	^ matchTokenFilter value
]

{ #category : #api }
TreeNodeModel >> matchTokenFilterBlock: aBlock [

	matchTokenFilter value: aBlock
]

{ #category : #api }
TreeNodeModel >> mouseDownAction [

	^ mouseDownAction value
]

{ #category : #api }
TreeNodeModel >> mouseDownAction: aBlock [

	mouseDownAction value: aBlock
]

{ #category : #api }
TreeNodeModel >> parentNode [

	^ parentNode value
]

{ #category : #api }
TreeNodeModel >> parentNode: aNode [

	parentNode value: aNode
]

{ #category : #api }
TreeNodeModel >> selectAllChildren [

	self children value do: [ :e | 
		e selected: true.
		e selectAllChildren ].
]

{ #category : #api }
TreeNodeModel >> selected [
	
	^ selected value
]

{ #category : #api }
TreeNodeModel >> selected: aBoolean [

	selected value: aBoolean
]

{ #category : #api }
TreeNodeModel >> takeHighlight [

	self changed: #takeHighlight with: #()
]

{ #category : #api }
TreeNodeModel >> unselectAllChildren [

	self children value do: [ :e | 
		e selected: false.
		e unselectAllChildren ].	
]

{ #category : #filtering }
TreeNodeModel >> updateAccordingTo: aFilter [

	(aFilter keepTreeNode: self) 
		ifFalse: [
			self changed: #updateAccordingTo: with: { aFilter } ]
]

{ #category : #api-events }
TreeNodeModel >> whenContentChanged: aBlock [

	content whenChangedDo: aBlock

	
]

{ #category : #api-events }
TreeNodeModel >> whenIsExpandedChanged: aBlock [

	isExpanded whenChangedDo: aBlock

	
]

{ #category : #api-events }
TreeNodeModel >> whenSelectedChanged: aBlock [

	selected whenChangedDo: aBlock

	
]
