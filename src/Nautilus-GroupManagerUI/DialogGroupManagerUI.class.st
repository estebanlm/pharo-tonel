"
Dialog UI for the group manager
"
Class {
	#name : #DialogGroupManagerUI,
	#superclass : #DialogWindow,
	#instVars : [
		'groupManager',
		'textModel',
		'groupTreeModel',
		'groupTree'
	],
	#category : #Nautilus-GroupManagerUI,
	#timestamp : 'TorstenBergmann 2/4/2014 21:12'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI class>>on: aModel [

	^ self basicNew 
		groupManager: aModel;
		initialize.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>addAGroup [

	| group |
	group := self groupManager groups createAnEmptyStaticGroup.
	groupTree updateList.
	groupTreeModel hardlySelectItem: group.
	GroupAnnouncer uniqueInstance announce: (AGroupHasBeenAdded group: group into: self)
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>addAction [

	self addAGroup
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>addLabel [
	
	^ 'Create'
]

{
	#category : #'button behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>addSelectedPackageInSelectedGroup [
	| selection |
	selection := self groupTreeModel selection selectedNodePath.
	selection ifNil: [ ^ self ].
	selection last isGroup 
		ifTrue: [ 
			self selectedGroup
				ifNotNil: [ :group | 
					self groupManager add: self selectedElements into: group.
					groupTree updateList.
					groupTreeModel hardlySelectItem: group ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>applyChanges [

	self valid
]

{
	#category : #'item creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>buildAddButton [
	^ IconicButton new
		target: self;
		actionSelector: #addAction;
		labelGraphic: (self iconNamed: #add);
		color: Color transparent;
		helpText: 'Add a new group';
		borderWidth: 0;
		yourself
]

{
	#category : #'item creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>buildAddSelectedPackageInSelectedGroupButton [
	^ IconicButton new
		target: self;
		actionSelector: #addSelectedPackageInSelectedGroup;
		labelGraphic: (self iconNamed: #down);
		color: Color transparent;
		helpText: 'Add the selected package into the selected group';
		borderWidth: 0;
		yourself
]

{
	#category : #'item creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>buildEmptyGroupButton [
	^ IconicButton new
		target: self;
		actionSelector: #emptySelectedGroup;
		labelGraphic: (self iconNamed: #delete);
		color: Color transparent;
		helpText: 'Empty the selected group';
		borderWidth: 0;
		yourself
]

{
	#category : #tree,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>buildGroupsTree [

	groupTree := (MorphTreeMorph on: self groupTreeModel)
		beSingle;
		autoDeselection: true;
		rowInset: 4;
		columnInset: 4;
		getMenuSelector: #menu:shifted:;
		nodeStringGetter: #name;
		vResizing: #spaceFill;
		hResizing: #spaceFill.
		
	^groupTree buildContents.
]

{
	#category : #'item creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>buildPackageTree [
	| morph |
	self groupManager announcer when: MorphTreeSelectionChanged send: #itemSelected: to: self.
	self groupManager ghostString: 'Search ...'.
	self groupManager rootItems: RPackageOrganizer default packages sorted.
	morph := self groupManager defaultMorphIn: World.
	^ morph
]

{
	#category : #'item creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>buildRemoveButton [
	^ IconicButton new
		target: self;
		actionSelector: #removeAction;
		labelGraphic: (self iconNamed: #removeIcon);
		color: Color transparent;
		helpText: 'Remove the selected group';
		borderWidth: 0;
		yourself
]

{
	#category : #'item creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>buildRemoveSelectedPackageFromSelectedGroupButton [
	^ IconicButton new
		target: self;
		actionSelector: #removeSelectedPackageFromSelectedGroup;
		labelGraphic: (self iconNamed: #up);
		color: Color transparent;
		helpText: 'Remove the selected package from its group';
		borderWidth: 0;
		yourself
]

{
	#category : #'item creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>buildRenameButton [
	^ IconicButton new
		target: self;
		actionSelector: #renameAction;
		labelGraphic: (self iconNamed: #edit);
		color: Color transparent;
		helpText: 'Rename the selected group';
		borderWidth: 0;
		yourself
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>buildTextMorph [
	| textMorph |
	textMorph := self textModel newScrolledText
		beForPlainText;
		beReadOnly;
		hResizing: #spaceFill;
		yourself.
	self textModel setInitialText: self text.
	^ textMorph
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>centering [
	self left: ((World width / 2) - (self width /2)).
	self top: ((World height / 2) - (self height /2))
]

{
	#category : #'button behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>emptySelectedGroup [
	| groupToRemove confirmation |
	self removeState
		ifFalse: [ ^ self ].
	groupToRemove := self groupTreeModel selection selectedNodePath last.
	groupToRemove isGroup
		ifTrue: [ 
			self selectedGroup
				ifNotNil: [ :group | 
					confirmation := UIManager default confirm: 'Do you really want to empty the group named ' , group name , ' ?'.
					confirmation
						ifFalse: [ ^ self ].
					group removeAllPackages.
					groupTree updateList.
					groupTreeModel hardlySelectItem: group ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>groupManager [

	^ groupManager
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>groupManager: aModel [

	groupManager := aModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>groupTree [
	^ groupTree
]

{
	#category : #'item creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>groupTreeBox [
	^ GroupboxMorph new
		addContentMorph: self buildGroupsTree;
		addContentMorph:
			(self
				newRow:
					{self buildAddButton.
					self buildRenameButton.
					self buildEmptyGroupButton.
					self buildRemoveButton});
		label: 'Choose a group:';
		hResizing: #spaceFill;
		vResizing: #spaceFill.
]

{
	#category : #tree,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>groupTreeModel [
	^ groupTreeModel ifNil: [ groupTreeModel := self groupTreeModelClass new model: self ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>groupTreeModelClass [
	^ GroupCreatorTreeModel
]

{
	#category : #tree,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>groups [
	^ self groupManager groups groups select: [ :group | group isFillable and: [ group isReadOnly not ] ]
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>initialExtent [
	^ 500 @ 600
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>isResizeable [
	^true
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>itemSelected: anAnnouncement [
	self groupManager selectedElements: anAnnouncement selection selectedItems
]

{
	#category : #'item creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>newContentMorph [
	^ self
		newColumn:
			{self packageTreeBox.
			self
				newRow:
					{self buildAddSelectedPackageInSelectedGroupButton.
					self newColumn: {self buildRemoveSelectedPackageFromSelectedGroupButton}}.
			(self newRow: {self groupTreeBox})
				hResizing: #spaceFill;
				vResizing: #spaceFill}
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>openInWorld [
	super openInWorld.
	self centering
]

{
	#category : #'item creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>packageTreeBox [
	^ GroupboxMorph new
		addContentMorph: self buildPackageTree;
		label: 'Select an item:';
		hResizing: #spaceFill;
		vResizing: #spaceFill
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>removeAGroup [
	self groupManager groups removeAGroup: self selectedGroup.
	groupTree updateList.
	groupTreeModel selection: nil.
	groupTreeModel changed: #selection
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>removeAction [
	self removeState
		ifTrue: [ self removeAGroup ]
]

{
	#category : #'button behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>removeSelectedPackageFromSelectedGroup [
	| packageToRemove selection |
	selection := self groupTreeModel selection selectedNodePath.
	selection ifNil: [ ^ self ].
	packageToRemove := selection last. 
	packageToRemove isGroup
		ifFalse: [ 
			self selectedGroup
				ifNotNil: [ :group | 
					self groupManager remove: {packageToRemove item} from: group.
					groupTree updateList.
					groupTreeModel hardlySelectItem: group ] ]
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>removeState [

	^ self selectedGroup notNil
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>renameAction [
self renameState ifTrue: [  
	self renameGroup ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>renameGroup [

	self groupManager groups renameAGroup: self selectedGroup.	
	groupTree updateList.
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>renameState [

	^ self selectedGroup notNil
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>selectedElements [
	^ self groupManager selectedElements
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>selectedGroup [
	
	^ self selectedNode 
		ifNil: [ nil ]
		ifNotNil: [:node |
			node isGroup
				ifTrue: [ node item ]
				ifFalse: [ node parentNode item ]]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>selectedNode [

	^ self groupTreeModel selectedNode
]

{
	#category : #tree,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>setSelectedNodeItem: anItem [
	| node |
	node := groupTree listManager nodeMorphsWithAllNodeItems: {anItem}.
	groupTree listManager selectedItems: node.
	^ node
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>textModel [
	^ textModel ifNil: [ textModel := RubScrolledTextModel new interactionModel: self ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>updateSelectedNode [

	self changed: #removeState
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
DialogGroupManagerUI>>valid [

]
