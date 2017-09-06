"
NautilusPluginManager is a manger of plugins used to set up plugin for Nautilus UI
"
Class {
	#name : #NautilusPluginManager,
	#superclass : #DialogWindow,
	#instVars : [
		'pluginClassesSelectedIndex',
		'pluginClassesSelected',
		'pluginsSelected',
		'pluginsList',
		'tree',
		'textModel'
	],
	#category : #NautilusCommon-Plugin-Manager,
	#timestamp : '<historical>'
}

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>addButtonAction [
	
	self selectedPluginClasses do: [:each | 
		self pluginsList addLast: { each. each defaultPosition } ].
	tree update: #rootNodes
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>addButtonLabel [
	
	^ 'Add'
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>addButtonState [
	^ self selectedPluginClasses isNotEmpty
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>applyChanges [
	
	Nautilus pluginClasses: self pluginsList
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>buildAddButton [

	^  (PluggableButtonMorph
			on: self 
			getState: #addButtonState
			action: #addButtonAction
			label: #addButtonLabel) hResizing: #spaceFill; vResizing: #shrinkWrap
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>buildButtonsColumn [

	| column |
	column := PanelMorph new.
	column 
		changeTableLayout;
		listDirection: #topToBottom.
		
		{
			self buildFullUpButton.
			self buildUpButton.
			self buildDownButton.
			self buildFullDownButton} reverse do: [:each | column addMorph: each ].
	
	column 
		vResizing: #spaceFill;
		width: 24;
		hResizing: #rigid.
	
	^ column
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>buildDescriptionTextArea [
	^ self textModel newScrolledText
		beForPlainText;
		beWrapped;
		beReadOnly;
		enabled: false;
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		yourself
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>buildDownButton [
	^ IconicButton new
		target: self;
		actionSelector: #down;
		labelGraphic: (self iconNamed: #downIcon);
		color: Color transparent;
		extent: 24 @ 24;
		borderWidth: 0
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>buildFullDownButton [
	^ IconicButton new
		target: self;
		actionSelector: #fullDown;
		labelGraphic: (self iconNamed: #bottomIcon);
		color: Color transparent;
		extent: 24 @ 24;
		borderWidth: 0
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>buildFullUpButton [
	^ IconicButton new
		target: self;
		actionSelector: #fullUp;
		labelGraphic: (self iconNamed: #topIcon);
		color: Color transparent;
		extent: 24 @ 24;
		borderWidth: 0
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>buildPluginClassesBox [

	^ GroupboxMorph new
			addContentMorph: self buildPluginClassesList;
			addContentMorph: self buildAddButton;
			label: 'Available plugin classes:';
			hResizing: #spaceFill;
			vResizing: #spaceFill.
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>buildPluginClassesList [

	| list |
	list := PluggableListMorph
		on: self
		list: #getPluginClassesList
		primarySelection: #pluginClassesSelectedIndex
		changePrimarySelection: #pluginClassesSelectedIndex:
		listSelection: #pluginClassesSelectedAt:
		changeListSelection: #pluginClassesSelectedAt:put:
		menu: nil
		keystroke: nil.
		
	list wrapSelector: #pluginName.
		
	list resetListSelector: #resetPluginClassesListSelection.
	list autoDeselect: true.
	
	list
		vResizing: #spaceFill;
		hResizing: #spaceFill.
	^ list
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>buildPluginsBox [

	^ GroupboxMorph new
			addContentMorph: self buildPluginsList;
			addContentMorph: self buildRemoveButton;
			label: 'Selected plugins:';
			hResizing: #spaceFill;
			vResizing: #spaceFill.
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>buildPluginsList [
	
	tree := (self treeClass model: self) buildPluginsTree.
	tree
		vResizing: #spaceFill;
		hResizing: #spaceFill.
	
	
	^ tree buildContents
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>buildRemoveButton [

	^  (PluggableButtonMorph
			on: self 
			getState: #removeButtonState
			action: #removeButtonAction
			label: #removeButtonLabel) hResizing: #spaceFill; vResizing: #shrinkWrap
]

{
	#category : #'items creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>buildUpButton [
	^ IconicButton new
		target: self;
		actionSelector: #up;
		labelGraphic: (self iconNamed: #upIcon);
		color: Color transparent;
		extent: 24 @ 24;
		borderWidth: 0
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>centering [
	self left: ((World width / 2) - (self width /2)).
	self top: ((World height / 2) - (self height /2))
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>down [

	| list selection firstIndex maxSize |
	list := pluginsList copy.
	maxSize := pluginsList size.
	firstIndex := maxSize.
	selection := self selectedPlugins.
	selection reverse do: [:index || each newIndex |
		each := list at: index.
		firstIndex := index+1 min: firstIndex.
		newIndex := index+1 min: maxSize.
		pluginsList removeAt: index.
		pluginsList add: each beforeIndex: newIndex .
		"set selection"
		].
	self pluginsSelectedIndex: firstIndex.
	
	self changed: #getPluginsList.
	self changed: #allSelections.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>fullDown [

	| list selection |
	list := pluginsList copy.
	selection := self selectedPlugins.
	selection doWithIndex: [:idx :count || each |
		each := list at: idx.
		pluginsList removeAt: idx-count+1.
		pluginsList addLast: each].

	self changed: #getPluginsList.
	self changed: #allSelections.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>fullUp [

	| list selection |
	list := pluginsList copy.
	selection := self selectedPlugins.
	selection reverse doWithIndex: [:idx :count || each |
		each := list at: idx.
		pluginsList removeAt: (idx+count-1).
		pluginsList addFirst: each].
	
	self changed: #getPluginsList.
	self changed: #allSelections.
]

{
	#category : #'lists behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>getPluginClassesList [

	^ AbstractNautilusPlugin allSubclasses sort: [:a :b | a pluginName <= b pluginName ]
]

{
	#category : #'lists behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>getPluginsList [

	^ pluginsList ifNil: [ pluginsList := Nautilus pluginClasses copy ].
]

{
	#category : #'text area behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>getText [
	| item | 
	
	item := self getPluginClassesList at: self pluginClassesSelectedIndex ifAbsent: [ ^ nil ].
	^ item 
		ifNil: [ '' ]
		ifNotNil: [ item description ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>initialize [

	super initialize.
	pluginClassesSelected := Dictionary new.
	pluginsSelected := Dictionary new.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>isResizeable [
	^true
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>newContentMorph [

	| row column |
	row := PanelMorph new
				layoutPolicy: TableLayout new;
				listDirection: #leftToRight;
				vResizing: #spaceFill;	
				hResizing: #spaceFill;
				spaceFillWeight: 3;
				addMorph: self buildButtonsColumn;
				addMorph: self buildPluginsBox;
				addMorph: self buildPluginClassesBox.
	column := PanelMorph new
					layoutPolicy: TableLayout new;
					listDirection: #topToBottom;
					vResizing: #spaceFill;	
					hResizing: #spaceFill;
					addMorph: self buildDescriptionTextArea;
					addMorph: row.
	^ column
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>openInWorld [

	super openInWorld.
	self width: 500.
	self height: 400.
	self centering
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>pluginClassesSelected [

		^ pluginClassesSelected
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>pluginClassesSelected: anObject [
	
		pluginClassesSelected := anObject
]

{
	#category : #'lists behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>pluginClassesSelectedAt: anIndex [

	| object |
	object := self getPluginClassesList at: anIndex ifAbsent: [ ^ false ].
	^ pluginClassesSelected at: object ifAbsent: [ false ]
]

{
	#category : #'lists behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>pluginClassesSelectedAt: anIndex put: aBoolean [

	| object |
	object := self getPluginClassesList at: anIndex ifAbsent: [ ^ self ].
	^ pluginClassesSelected at: object put: aBoolean
]

{
	#category : #'lists behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>pluginClassesSelectedIndex [

	^ pluginClassesSelectedIndex ifNil: [ pluginClassesSelectedIndex := 0 ]
]

{
	#category : #'lists behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>pluginClassesSelectedIndex: anInteger [

	pluginClassesSelectedIndex := anInteger.
	self changed: #pluginClassesSelectedIndex.
	self textModel setText: (anInteger = 0 ifTrue: ['']
													 ifFalse: [ self getText ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>pluginsList [

		^ pluginsList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>pluginsList: anObject [
	
		pluginsList := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>pluginsSelected [

		^ pluginsSelected
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>pluginsSelected: anObject [
	
		pluginsSelected := anObject
]

{
	#category : #tree,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>pluginsSelectedIndex: anIndex [

]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>removeButtonAction [
	
	self selectedPlugins reverse do: [:item | self pluginsList remove: item ].
	self resetPluginsListSelection.
	tree deselectAll.
	tree model setSelection: nil.
	tree update: #rootNodes
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>removeButtonLabel [
	
	^ 'Remove'
]

{
	#category : #'buttons behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>removeButtonState [
	^ self selectedPlugins isNotEmpty
]

{
	#category : #'lists behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>resetPluginClassesListSelection [

	pluginClassesSelected removeAll
]

{
	#category : #'lists behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>resetPluginsListSelection [

	pluginsSelected removeAll
]

{
	#category : #'lists behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>selectedPluginClasses [

	| associations list |
	list := self getPluginClassesList.
	pluginClassesSelected ifNil: [ ^ {} ].
	associations := pluginClassesSelected associations select: [:assoc | assoc value ].
	associations := associations collect: [:assoc | assoc key ].
	associations := associations sort: [:a : b | (list indexOf: a ifAbsent: [ 0 ]) <= (list indexOf: b ifAbsent: [ 0 ])].
	^ associations select: [:each | each notNil ]
]

{
	#category : #'lists behavior',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>selectedPlugins [

	^ tree selectedMorphList collect:[:each | each complexContents item ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>textModel [
	^ textModel ifNil: [ textModel := RubScrolledTextModel new interactionModel: self ]
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>title [

	^ 'Nautilus Plugins Manager'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>treeClass [

	^ NautilusPluginManagerTree
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusPluginManager>>up [

	| list selection firstIndex |
	list := pluginsList copy.
	firstIndex := pluginsList size.
	selection := self selectedPlugins.
	selection do: [:index || each newIndex |
		each := list at: index.
		firstIndex := index-1 min: firstIndex.
		newIndex := index-1 max: 1.
		pluginsList removeAt: index.
		pluginsList add: each beforeIndex: newIndex .
		].
	
	self pluginsSelectedIndex: firstIndex.
	
	self changed: #getPluginsList.
	self changed: #allSelections.
]
