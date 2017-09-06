"
I am the entry point for tabs.

I am composed of a TabBar and a Morph used as a canvas to render the morph represented by the selected tab.

I am very stupid (as you can see only four methods). I just listen to selected tab, and render it
"
Class {
	#name : #TabManagerMorph,
	#superclass : #PanelMorph,
	#instVars : [
		'toolbar',
		'container',
		'contentsWrapper',
		'processes',
		'model'
	],
	#category : #Morphic-Widgets-Tabs,
	#timestamp : '<historical>'
}

{
	#category : #private-contents,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>addLastTabContents: aTab among: size delta: delta [
	| process |
	
	process := aTab retrieveMorph: [ :contents | 
		contents ifNil: [ TabWithNoContents signalTab: aTab ].
		contentsWrapper
			addMorph: contents
			fullFrame:
				(LayoutFrame identity
					leftFraction: (size - 1) * delta;
					leftOffset: 2;
					rightFraction: 1).
		"contents takeKeyboardFocus" "it should be managed better and not stale focus from another active windows/widgets. It should only forse focus on content when user focused on tabs but it is not clean how to detect it"].
	
	process ifNotNil: [ processes add: process ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>addMorphs [

	self 
		addMorph: toolbar
		fullFrame: (LayoutFrame identity
			bottomFraction: 0;
			bottomOffset: TabMorph defaultHeight + 2;
			yourself).
			
	self 
		addMorph: container
		fullFrame: (LayoutFrame identity
			topOffset: TabMorph defaultHeight + 2;
			yourself).
			
	container
		addMorph: contentsWrapper
		fullFrame:
			(LayoutFrame identity
				topOffset: 2;
				rightOffset: -1;
				bottomOffset: -1;
				leftOffset: 2;
				yourself).
]

{
	#category : #private-contents,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>addSplitterOn: tabs delta: delta [
	| leftProcess rightProcess |
	tabs overlappingPairsWithIndexDo: [ :left :right :index | 
		leftProcess := left retrieveMorph: [ :leftContents | 
			leftContents ifNil: [ TabWithNoContents signalTab: left ].
			rightProcess := right retrieveMorph: [ :rightContents || splitter |
				rightContents ifNil: [ TabWithNoContents signalTab: right ].
				
				splitter := ProportionalSplitterMorph new
					addLeftOrTop: leftContents;
					addRightOrBottom: rightContents;
					yourself.

				contentsWrapper
					addMorph: splitter
					fullFrame:
						(LayoutFrame identity
							leftFraction: index * delta;
							rightFraction: index * delta;
							leftOffset: -2;
							rightOffset: 2) ] ] ].
				
	leftProcess ifNotNil: [ processes add: leftProcess ].
	rightProcess ifNotNil: [ processes add: rightProcess ].
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>addTab: aTab [
	toolbar addTab: aTab
	
]

{
	#category : #private-contents,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>addTabContents: tab at: index delta: delta [
	| process |
	process := tab
		retrieveMorph:
			[ :contents | 
			| leftOffset |
			contents ifNil: [ TabWithNoContents signalTab: tab ].
			leftOffset := index = 1
				ifTrue: [ 0 ]
				ifFalse: [ 2 ].
			contentsWrapper
				addMorph: contents
				fullFrame:
					(LayoutFrame identity
						leftFraction: (index - 1) * delta;
						leftOffset: leftOffset;
						rightOffset: -2;
						rightFraction: index * delta) ].
	process ifNotNil: [ processes add: process ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>adoptPaneColor: aColor [
	"Prevent submorphs to be polluted by window color"
	
	self color: aColor
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>barDeleted: aBar [

	self close
]

{
	#category : #private-drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>borderColor [
	^ Smalltalk ui theme borderColor
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>canBeClosed [
	^ toolbar canBeClosed
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>cleanProcesses [
	
	processes do: [ :each | each terminate ].
	processes removeAll.
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>close [

	self canBeClosed ifFalse: [ ^ self ].
	self delete.
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>closeAllTabs [
	toolbar closeAllTabs
]

{
	#category : #private-drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>containerColor [
	^ Smalltalk ui theme lightBaseColor
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>delete [
	
	super delete.
	self triggerEvent: #tabManagerDeleted with: self
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>deleteSelectedTabs [
	toolbar selectedTab 
		ifNotNil: [ toolbar deleteSelectedTabs ] 
		ifNil: [ self owner takeKeyboardFocus ]
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>drawLinesOn: aCanvas [
	self flag: #TODO. "this method, I don't know what's is for."
	"aCanvas
		line: self topLeft
		to: self bottomLeft
		width: 1
		color: self borderColor.
	aCanvas
		line: self bottomLeft
		to: self bottomRight
		width: 1
		color: self borderColor.
	aCanvas
		line: self topRight
		to: self bottomRight
		width: 1
		color: self borderColor"
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>drawSubmorphsOn: aCanvas [
	super drawSubmorphsOn: aCanvas.
	self drawLinesOn: aCanvas
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>emptyTabColor: aColor [

	contentsWrapper color: aColor
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>initialize [

	super initialize.

	toolbar := TabBarMorph new.
	processes := OrderedCollection new.
	self registerBarActions.
	self registerShortcuts.
	
	container := Morph new
		color: self containerColor;
		changeProportionalLayout;
		yourself.
		
	contentsWrapper := Morph new
		color: self containerColor;
		changeProportionalLayout;
		yourself.
		
	self changeProportionalLayout.
	self addMorphs
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>minExtent [

	^ 100@50
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>model [

	^ model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>model: aModel [

	model := aModel
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>registerBarActions [
	
	toolbar 
		when: #tabSelected send: #tabSelected: to: self;
		when: #barDeleted send: #barDeleted: to: self;
		when: #tabsChanged send: #tabsChanged to: self;
		when: #tabRefreshed send: #tabRefreshed: to: self;
		when: #tabAddedToSelection send: #tabAddedToSelection: to: self;
		when: #tabRemovedFromSelection send: #tabRemovedFromSelection: to: self;
		when: #tabResetSelection send: #tabResetSelection: to: self;
		when: #tabEmptyContents send: #tabEmptyContents: to: self
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>registerShortcuts [

	self 
		bindKeyCombination: $] meta shift toAction: [ self selectNext ];
		bindKeyCombination: $[ meta shift toAction: [ self selectPrevious ];
		bindKeyCombination: $w command toAction: [ self deleteSelectedTabs ];
		bindKeyCombination: $w command shift toAction: [ self closeAllTabs ].
		
	1 to: 9 do: [ :index |
		self bindKeyCombination: index asString first meta toAction: [ self selectTabAt: index ] ].
	
	self bindKeyCombination: $0 meta toAction: [ self selectLastTab ]
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>selectLastTab [

	toolbar selectLastTab
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>selectNext [

	toolbar selectNext
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>selectPrevious [

	toolbar selectPrevious
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>selectTabAt: index [

	toolbar selectTabAt: index ifAbsent: [].
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>selectedTab [

	^ toolbar selectedTab
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>setMultipleContents [
	| tabs size delta |

	contentsWrapper removeAllMorphs.
	self cleanProcesses.
	
	tabs := toolbar orderedSelectedTabs.
	size := tabs size.
	delta := 1 / size.
	
	tabs allButLast keysAndValuesDo: [ :index :tab | self addTabContents: tab at: index delta: delta ].
	self addLastTabContents: tabs last among: size delta: delta.
	self addSplitterOn: tabs delta: delta
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>setTabContentFrom: aTab [
	| process |
	
	contentsWrapper removeAllMorphs.
	self cleanProcesses.

	process := aTab retrieveMorph: [ :contents |
		contents ifNil: [ TabWithNoContents signalTab: aTab ].
		contentsWrapper addMorph: contents fullFrame: LayoutFrame identity.
		"contents takeKeyboardFocus" "it should be managed better and not stale focus from another active windows/widgets. It should only forse focus on content when user focused on tabs but it is not clean how to detect it"
	].
	process ifNotNil: [ processes add: process ].
]

{
	#category : #compatbility,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>setTabs: aBlock [
	self tabs: aBlock value
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>tabAddedToSelection: aTab [

	self setMultipleContents
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>tabEmptyContents: aTab [
	"My bar already filtered the tab, so here I am sure the tab is the selected tab"
	
	contentsWrapper removeAllMorphs
	
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>tabRefreshed: aTab [
	"Here we know that aTab is the selected tab"

	self setMultipleContents
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>tabRemovedFromSelection: aTab [

	self setMultipleContents
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>tabResetSelection: aTab [

	self setTabContentFrom: aTab
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>tabSelected: aTab [

	self setTabContentFrom: aTab.
	self triggerEvent: #tabSelected with: aTab
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>tabs: aCollection [

	toolbar tabs: aCollection
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>tabsChanged [
	"Nothing to do"
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>themeChanged [
	super themeChanged.
	toolbar themeChanged.
	
	container
		color: Smalltalk ui theme lightBaseColor;
		changed.
	contentsWrapper
		color: Smalltalk ui theme lightBaseColor;
		changed
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabManagerMorph>>useSortedTabsBy: sortBlock [
	toolbar useSortedTabsBy: sortBlock
]
