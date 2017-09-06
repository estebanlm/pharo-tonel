"
Common superclass for Monticello tools

Placeholder for a MCVersionCache for MCLazyVersionInfo
"
Class {
	#name : #MCTool,
	#superclass : #Model,
	#instVars : [
		'morph',
		'label',
		'modal',
		'modalValue'
	],
	#classVars : [
		'MCVersionCache'
	],
	#category : #MonticelloGUI,
	#timestamp : '<historical>'
}

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool class>>flushMCVersionCache [
	MCVersionCache := nil.
	Smalltalk garbageCollect
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool class>>initMCVersionCache [
	MCVersionCache := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool class>>mcVersionCache [
	^ MCVersionCache
		ifNil: [ MCVersionCache := LRUCache new maximumWeight: 32 ]
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool class>>newRepository [
	"Create a new monticello repository"
	| types index |
	types := MCRepository allConcreteSubclasses asArray.
	index := UIManager default chooseFrom: (types collect: [:ea | ea description])
				title: 'Repository type:'.
	^ index = 0 ifFalse: [(types at: index) morphicConfigure]
]

{
	#category : #'window color',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool class>>theme [
	"Answer the ui theme that provides controls."

	^ Smalltalk ui theme 
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>accept [
	" do nothing by default"
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>allManagers [

	^ MCWorkingCopy allManagers 
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>answer: anObject [
	modalValue := anObject.
	self close.
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>arrowKey: aCharacter from: aPluggableListMorph  [
	"backstop"
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>buildWindow [
	| window |
	window := SystemWindow labelled: self label.
	window model: self.
	self widgetSpecs do: [:spec |
		| send fractions offsets |
		send := spec first.
		fractions := spec at: 2 ifAbsent: [#(0 0 1 1)].
		offsets := spec at: 3 ifAbsent: [#(0 0 0 0)].
		window
			addMorph: (self perform: send first withArguments: send allButFirst)
			fullFrame:
				(LayoutFrame new 
					leftFraction: fractions first; 
					topFraction: fractions second;
					rightFraction: fractions third ; 
					bottomFraction: fractions fourth; 
					leftOffset: offsets first;
					topOffset: offsets second;
					rightOffset: offsets third;
					bottomOffset: offsets fourth)].
	^ window
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>buttonEnabled [
	^ true
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>buttonRow [
	^ self buttonRow: self buttonSpecs
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>buttonRow: specArray [
	| aRow |
	aRow := PanelMorph new.
	aRow layoutPolicy: TableLayout new; listDirection: #leftToRight.
	aRow hResizing: #spaceFill; vResizing: #spaceFill; rubberBandCells: true.
	aRow clipSubmorphs: true; borderWidth: 0.
	aRow layoutInset: 2@2; cellInset: 1.
	aRow wrapCentering: #center; cellPositioning: #leftCenter.
	specArray do:
		[:triplet | | aButton state |
			state := triplet at: 5 ifAbsent: [#buttonState].
			aButton := PluggableButtonMorph
				on: self
				getState: state
				action: #performButtonAction:enabled:.
			aButton
				hResizing: #spaceFill;
				vResizing: #spaceFill;
				label: triplet first asString;
				getEnabledSelector: (triplet at: 4 ifAbsent: [#buttonEnabled]);
				arguments: (Array with: triplet second with: (triplet at: 4 ifAbsent: [#buttonEnabled])).
			aRow addMorphBack: aButton.
			aButton setBalloonText: triplet third].
	^ aRow
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>buttonSelected [
	^ false
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>buttonSpecs [
	^ #()
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>buttonState [
	^ false
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>close [
	self window delete
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>defaultAnnotationPaneHeight  [
	"Answer the receiver's preferred default height for new annotation panes."
	^ 25
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>fillMenu: aMenu fromSpecs: anArray [
	anArray do:
		[:pair |
		aMenu add: pair first target: self selector: pair second].
	^ aMenu
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>findListMorph: aSymbol [
	^ morph submorphs detect: [:ea | (ea respondsTo: #getListSelector) and: [ea getListSelector = aSymbol]] ifNone: []
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>findTextMorph: aSymbol [
	^ morph submorphs detect: [:ea | (ea respondsTo: #getTextSelector) and: [ea getTextSelector = aSymbol]] ifNone: []
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>getMenu: aMenu [
	^aMenu
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>initialExtent [
	^ 500@500
]

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>interactionModel [
	^ self
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>label [
	^ label ifNil: [self defaultLabel]
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>label: aString [
	label := aString
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>listMorph: listSymbol [
	^ self
		listMorph: (listSymbol, 'List') asSymbol
		selection: (listSymbol, 'Selection') asSymbol
		menu: (listSymbol, 'ListMenu:') asSymbol
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>listMorph: listSymbol keystroke: keystrokeSymbol [
	^ (self
		listMorph: (listSymbol, 'List') asSymbol
		selection: (listSymbol, 'Selection') asSymbol
		menu: (listSymbol, 'ListMenu:') asSymbol)
		keystrokeActionSelector: keystrokeSymbol;
		yourself
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>listMorph: listSymbol selection: selectionSymbol [
	^ PluggableListMorph
		on: self
		list: listSymbol
		selected: selectionSymbol
		changeSelected: (selectionSymbol, ':') asSymbol
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>listMorph: listSymbol selection: selectionSymbol menu: menuSymbol [
	^ PluggableListMorph
		on: self
		list: listSymbol
		selected: selectionSymbol
		changeSelected: (selectionSymbol, ':') asSymbol
		menu: menuSymbol
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>listMorph: listSymbol selection: selectionSymbol menu: menuSymbol icon: iconSelector [
	^ (PluggableIconListMorph
		on: self
		list: listSymbol
		selected: selectionSymbol
		changeSelected: (selectionSymbol, ':') asSymbol
		menu: menuSymbol)
			getIconSelector: iconSelector;
			yourself
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>listMorph: listSymbol selection: selectionSymbol menu: menuSymbol keystroke: keystrokeSymbol [
	^ (PluggableListMorph
		on: self
		list: listSymbol
		selected: selectionSymbol
		changeSelected: (selectionSymbol, ':') asSymbol
		menu: menuSymbol)
		keystrokeActionSelector: keystrokeSymbol;
		yourself
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>menu [
	" returns nil to let the editing mode offer the right menu"
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>minimumExtent [
	"Answer the minumum extent for the tool."
	
	^100@100
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>multiListMorph: listSymbol selection: selectionSymbol listSelection: listSelectionSymbol menu: menuSymbol [
	^ PluggableListMorph
		on: self
		list: listSymbol
		primarySelection: selectionSymbol
		changePrimarySelection: (selectionSymbol, ':') asSymbol
		listSelection: listSelectionSymbol
		changeListSelection: (listSelectionSymbol, 'put:') asSymbol
		menu: menuSymbol
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>performButtonAction: anActionSelector enabled: anEnabledSelector [
	(self perform: anEnabledSelector) 
		ifTrue: [ self perform: anActionSelector ]
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>preferredColor   [
	^ (Color r: 0.627 g: 0.69 b: 0.976)
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>setDefaultFocus [
	"set the default focus on the morph elements.
	specializ this in subclasses"
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>show [
	"Open the tool returning the window."

	modal := false.
	self window openInWorld.
	self setDefaultFocus.
	^ self window
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>showLabelled: labelString [
	
	modal := false.
	self label: labelString.
	self window openInWorld.
	self setDefaultFocus.
	^ self window.
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>showModally [
	modal := true.
	self window openInWorldExtent: 400 @ 400.
	self setDefaultFocus.
	[ self window world notNil ] whileTrue: [ self window outermostWorldMorph doOneCycle ].
	morph := nil.
	^ modalValue
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>summary: aString [
	" do nothing by default"
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>textMorph: aSymbol [
	| textMorph |
	textMorph := RubPluggableTextMorph new
		getTextSelector: aSymbol;
		setTextSelector: (aSymbol , ':') asSymbol;
		on: self;
		beWrapped;
		hScrollbarShowNever;
		beForSmalltalkScripting;
		yourself.
	textMorph announcer when: RubTextAcceptRequest send: #accept to: self.
	textMorph hasUnacceptedEdits: false.
	^ textMorph
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>treeMorph: listSymbol [
	^ self
		treeMorph: (listSymbol, 'Tree') asSymbol
		selection: (listSymbol, 'SelectionWrapper') asSymbol
		menu: (listSymbol, 'TreeMenu:') asSymbol
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>treeMorph: listSymbol selection: selectionSymbol menu: menuSymbol [
	^ SimpleHierarchicalListMorph
		on: self
		list: listSymbol
		selected: selectionSymbol
		changeSelected: (selectionSymbol, ':') asSymbol
		menu: menuSymbol
		keystroke: nil
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>widgetSpecs [
	^ #()
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCTool>>window [
	^ morph ifNil: [morph := self buildWindow]
]
