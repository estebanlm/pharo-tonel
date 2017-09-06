"
A pluggable tree morph.
"
Class {
	#name : #PluggableTreeMorph,
	#superclass : #SimpleHierarchicalListMorph,
	#instVars : [
		'roots',
		'selectedWrapper',
		'getRootsSelector',
		'getChildrenSelector',
		'hasChildrenSelector',
		'getLabelSelector',
		'getIconSelector',
		'getSelectedPathSelector',
		'getHelpSelector',
		'dropItemSelector',
		'wantsDropSelector',
		'dragItemSelector'
	],
	#category : #Morphic-Widgets-Pluggable,
	#timestamp : 'ar 2/12/2005 04:38'
}

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>acceptDroppingMorph: aMorph event: evt [
	| item dropTarget |

	dropItemSelector 
		ifNil:[
			model 
				acceptDroppingMorph: aMorph 
				event: evt 
				inMorph: self ]
		ifNotNil: [
			item := aMorph passenger.
			dropTarget := (self itemFromPoint: evt position) withoutListWrapper.
			model perform: dropItemSelector with: item with: dropTarget ].
		
	evt hand releaseMouseFocus: self.
	Cursor normal show.

]

{
	#category : #'node access',
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>balloonTextForNode: node [
	getHelpSelector ifNil:[^nil].
	^model perform: getHelpSelector with: node item
]

{
	#category : #'node access',
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>contentsOfNode: node [
	| children |
	getChildrenSelector ifNil:[^#()].
	children := model perform: getChildrenSelector with: node item.
	^children collect:[:item| PluggableTreeItemNode with: item model: self]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>dragItemSelector [
	^dragItemSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>dragItemSelector: aSymbol [
	dragItemSelector := aSymbol.
	aSymbol ifNotNil:[self dragEnabled: true].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>dropItemSelector [
	^dropItemSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>dropItemSelector: aSymbol [
	dropItemSelector := aSymbol.
	aSymbol ifNotNil:[self dropEnabled: true].
]

{
	#category : #'node access',
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>dropNode: srcNode on: dstNode [
	dropItemSelector ifNil:[^nil].
	model perform: dropItemSelector with: srcNode item with: dstNode item
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>getChildrenSelector [
	^getChildrenSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>getChildrenSelector: aSymbol [
	getChildrenSelector := aSymbol.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>getHelpSelector [
	^getHelpSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>getHelpSelector: aSymbol [
	getHelpSelector := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>getIconSelector [
	^getIconSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>getIconSelector: aSymbol [
	getIconSelector := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>getLabelSelector [
	^getLabelSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>getLabelSelector: aSymbol [
	getLabelSelector := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>getRootsSelector [
	^getRootsSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>getRootsSelector: aSelector [
	getRootsSelector := aSelector.
	self update: getRootsSelector.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>getSelectedPathSelector [
	^getSelectedPathSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>getSelectedPathSelector: aSymbol [
	getSelectedPathSelector := aSymbol.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>hasChildrenSelector [
	^hasChildrenSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>hasChildrenSelector: aSymbol [
	hasChildrenSelector := aSymbol
]

{
	#category : #'node access',
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>hasNodeContents: node [
	hasChildrenSelector ifNil: [ ^ node contents isNotEmpty ].
	^ model perform: hasChildrenSelector with: node item
]

{
	#category : #'node access',
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>iconOfNode: node [
	getIconSelector ifNil:[^nil].
	^model perform: getIconSelector with: node item
]

{
	#category : #'node access',
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>isDraggableNode: node [
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>keystrokeActionSelector [
	^keystrokeActionSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>keystrokeActionSelector: aSymbol [
	keystrokeActionSelector := aSymbol
]

{
	#category : #'node access',
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>printNode: node [
	getLabelSelector ifNil:[^node item printString].
	^model perform: getLabelSelector with: node item
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>roots [
	^roots
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>roots: anArray [
	roots := anArray collect:[:item| PluggableTreeItemNode with: item model: self].
	self list: roots.
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>selectPath: path in: listItem [
	path isEmpty ifTrue: [^self setSelectedMorph: nil].
	listItem withSiblingsDo: [:each | 
		(each complexContents item = path first) ifTrue: [
			each isExpanded ifFalse: [
				each toggleExpandedState.
				self adjustSubmorphPositions.
			].
			each changed.
			path size = 1 ifTrue: [
				^self setSelectedMorph: each
			].
			each firstChild ifNil: [^self setSelectedMorph: nil].
			^self selectPath: path allButFirst in: each firstChild
		].
	].
	^self setSelectedMorph: nil


]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>setSelectedMorph: aMorph [
	selectedWrapper := aMorph complexContents.
	self selection: selectedWrapper.
	setSelectionSelector ifNotNil:[
		model 
			perform: setSelectionSelector 
			with: (selectedWrapper ifNotNil:[selectedWrapper item]).
	].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>setSelectedSelector [
	^setSelectionSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>setSelectedSelector: aSymbol [
	setSelectionSelector := aSymbol
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>startDrag: anEvent  [
	| aTransferMorph itemMorph passenger |
	
	self dragEnabled
		ifTrue: [itemMorph := scroller submorphs
						detect: [:any | any highlightedForMouseDown]
						ifNone: []].
	(itemMorph isNil
			or: [anEvent hand hasSubmorphs])
		ifTrue: [^ self].
	itemMorph highlightForMouseDown: false.
	itemMorph ~= self selectedMorph
		ifTrue: [self setSelectedMorph: itemMorph].
		
	passenger := dragItemSelector
		ifNil: [ self model
			dragPassengerFor: itemMorph withoutListWrapper 
			inMorph: self ]
		ifNotNil: [
			self model 
				perform: dragItemSelector 
				withEnoughArguments: { itemMorph withoutListWrapper. self } ].
			
	passenger
		ifNotNil: [aTransferMorph := self model transferFor: passenger from: self.
			aTransferMorph dragTransferType: #dragTransfer.
			aTransferMorph align: aTransferMorph draggedMorph center with: anEvent position.
			anEvent hand grabMorph: aTransferMorph].
	anEvent hand releaseMouseFocus: self
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>update: what [
	what ifNil:[^self].
	what == getRootsSelector ifTrue:[
		self roots: (model perform: getRootsSelector)
	].
	what == getSelectedPathSelector ifTrue:[
		^self selectPath: (model perform: getSelectedPathSelector)
			in: (scroller submorphs at: 1 ifAbsent: [^self]) 
	].
	^super update: what
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>wantsDropSelector [
	^wantsDropSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>wantsDropSelector: aSymbol [
	wantsDropSelector := aSymbol
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>wantsDroppedMorph: aMorph event: anEvent [
	
	aMorph dragTransferType == #dragTransfer ifFalse: [ ^ false ].
	
	^ wantsDropSelector 
		ifNil: [ model
			wantsDroppedMorph: aMorph 
			event: anEvent 
			inMorph: self ]
		ifNotNil: [
			model 
				perform: wantsDropSelector 
				with: aMorph passenger ]
]

{
	#category : #'node access',
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableTreeMorph>>wantsDroppedNode: srcNode on: dstNode [
	dropItemSelector ifNil:[^false].
	wantsDropSelector ifNil:[^true].
	^(model perform: wantsDropSelector with: srcNode with: dstNode) == true
]
