"
I am a bar gathering tabs. I am the one managing the selected tab and related bahavior (unselecting the last one, updating the layout to make the selected tab on top of the other)
"
Class {
	#name : #TabBarMorph,
	#superclass : #PanelMorph,
	#instVars : [
		'tabs',
		'selectionHistory',
		'menuButton',
		'numberOfSelectedTabs'
	],
	#category : #Morphic-Widgets-Tabs,
	#timestamp : '<historical>'
}

{
	#category : #private-constants,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>actionOffset [
	^ 4
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>actionsChanged: aTab [

	self selectedTab = aTab ifFalse: [ ^ self ].
	self adjustLayout.
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>addActionsFor: aTab [
	| rightOffset |
	
	rightOffset := self actionOffset.
	
	aTab hasMenu
		ifTrue: [ 
			rightOffset := 2 * rightOffset + self menuButtonWidth.
			self addMenuButton ].
		
	aTab actions reverseDo: [ :each || topOffset |
		topOffset := self height - each icon height // 2.
		self 
			addMorph: (self createActionButtonFor: each)
			fullFrame: (LayoutFrame identity
				bottomFraction: 0;
				leftFraction: 1;
				topOffset: topOffset;
				bottomOffset: topOffset + each icon height;
				rightOffset: rightOffset negated ;
				leftOffset: rightOffset negated - each icon width ).
				
		rightOffset := rightOffset + each icon width + self actionOffset]
]

{
	#category : #private-history,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>addFirstInHistory: aTab [

	self removeFromHistory: aTab.
	selectionHistory addFirst: aTab
]

{
	#category : #private-history,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>addInHistory: aTab [

	self removeFromHistory: aTab.
	selectionHistory addLast: aTab
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>addMenuButton [
	| topOffset rightOffset |
	
	rightOffset := self actionOffset.
	topOffset := (self height - 16) // 2.
	self
		addMorph: menuButton
		fullFrame:
			(LayoutFrame identity
				bottomFraction: 0;
				leftFraction: 1;
				rightOffset: rightOffset negated;
				leftOffset: rightOffset negated - self menuButtonWidth;
				topOffset: topOffset;
				bottomOffset: topOffset + self menuButtonHeight)
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>addTab: aTab [
	
	(tabs includes: aTab) ifTrue: [ ^ self ].

	tabs add: aTab.

	self registerActionsFor: aTab.
	self selectedTab ifNil: [ aTab selected: true ].
	self addFirstInHistory: aTab.
	self adjustLayout.
	self changed.
	self triggerEvent: #tabAdded with: aTab
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>adjustLayout [
	| length overlap |
	
	length := self computeLength.
	self removeAllMorphs.
	length isZero ifTrue: [ ^ self ].
	overlap := self overlap.	
	
	selectionHistory do: [ :tab || index |
		index := (tabs indexOf: tab) - 1.
		self 
			addMorph: tab
			fullFrame: (LayoutFrame identity
				rightFraction: 0;
				leftOffset: (index*(length-overlap));
				rightOffset: (index*(length-overlap)) + length;
				bottomOffset: -1;
				yourself ).
		tab updateShowIcon ].
	
	self addActionsFor: self selectedTab.
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>borderColor [
	"I do not use #borderColor because I want a light border"
	^ Smalltalk ui theme lightBackgroundColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>bounds: b [

	super bounds: b.
	self adjustLayout
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>canBeClosed [

	^ tabs allSatisfy: [ :tab | tab closeable ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>closeAllTabs [

	tabs copy do: [ :tab | tab close ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>computeLength [
	| width size length |

	size := tabs size.
	size isZero ifTrue: [ ^ 0 ].
	width := self width - self extraSpace + ((size-1) * self overlap).
	
	length := width / size.
	length := length min: 150.
	length := length max: 33.

	^ length
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>createActionButtonFor: anAction [

	^ TabActionButtonMorph forAction: anAction
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>createMenuButton [
	"Answer a button for the window menu."
	| form msb |
	
	form := Smalltalk ui theme windowMenuForm.
	msb := MultistateButtonMorph new extent: form extent.
	msb activeEnabledNotOverUpFillStyle: (ImageFillStyle form: form).
	
	form := Smalltalk ui theme windowMenuPassiveForm.
	msb extent: form extent.
	msb activeDisabledNotOverUpFillStyle: (ImageFillStyle form: form).
	msb passiveEnabledNotOverUpFillStyle: (ImageFillStyle form: form).
	msb passiveDisabledNotOverUpFillStyle: (ImageFillStyle form: form).
	
	form := Smalltalk ui theme windowMenuForm.
	msb extent: form extent.
	msb
		activeEnabledOverUpFillStyle: (ImageFillStyle form: form);
		passiveEnabledOverUpFillStyle: (ImageFillStyle form: form).
	
	form := Smalltalk ui theme windowMenuPassiveForm.
	msb
		extent: form extent;
		activeEnabledOverDownFillStyle: (ImageFillStyle form: form);
		passiveEnabledOverDownFillStyle: (ImageFillStyle form: form);
		addUpAction: [ self popUpMenu ];
		setBalloonText: 'tab menu' translated;
		extent: 16@16.
		
	^ msb
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>delete [

	super delete.
	self triggerEvent: #barDeleted with: self
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>deleteSelectedTabs [
	
	self selectedTabs do: [:e | e close ].
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>drawLinesOn: canvas [
	"This method draws the line below the tab-label, to make it look as 'behind' (when there is one 
	 selected, it draws that line except on the corresponding selected tab."
	self selectedTab 
		ifNotNil: [ self drawWithSelectionOn: canvas ]	
		ifNil: [ self drawWithoutSelectedOn: canvas ]

]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>drawSubmorphsOn: canvas [
	super drawSubmorphsOn: canvas.
	self drawLinesOn: canvas
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>drawWithSelectionOn: canvas [
	canvas
		line: self bottomLeft + (0 @ -1)
		to: self selectedTab bottomLeft
		width: 1
		color: self borderColor.
	canvas
		line: self selectedTab bottomLeft
		to: self selectedTab  bottomRight
		width: 1
		color: self selectedColor.
	canvas
		line: self selectedTab  bottomRight
		to: self bottomRight + (0 @ -1)
		width: 1
		color: self borderColor
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>drawWithoutSelectedOn: canvas [
	canvas
		line: self bottomLeft + (0 @ -1)
		to: self bottomRight + (0 @ -1)
		width: 1
		color: self borderColor
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>extraSpace [

	^ tabs max: [ :each | each extraSpaceForActions ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>initialize [

	super initialize.

	tabs := OrderedCollection new.
	selectionHistory := OrderedCollection new.
	menuButton := self createMenuButton.
	numberOfSelectedTabs := 1.
	
	self changeProportionalLayout.
	self addMenuButton.
	
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>isMultiSelection [

	^ numberOfSelectedTabs > 1
]

{
	#category : #private-constants,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>menuButtonHeight [
	^ 16
]

{
	#category : #private-constants,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>menuButtonWidth [
	^ 16
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>needSpaceForActions  [
	| tab |
	
	tab := self selectedTab.
	tab ifNil: [ ^ false ].

	^ self selectedTab hasMenu or: [ self selectedTab hasActions ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>orderedSelectedTabs [
	
	^ tabs select: [ :e | e selected ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>overlap [

	^ 8
]

{
	#category : #'change reporting',
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>ownerChanged [

	super ownerChanged.
	self adjustLayout
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>popUpMenu [
	| menu |
	
	menu := self selectedTab menu.
	menu popUpAt: menuButton bottomRight forHand: ActiveHand in: World
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>registerActionsFor: aTab [

	aTab 
		when: #tabSelected send: #tabSelected: to: self;
		when: #tabDeleted send: #tabDeleted: to: self;
		when: #rightKeyPressed send: #rightKeyPressed: to: self;
		when: #leftKeyPressed send: #leftKeyPressed: to: self;
		when: #tabRefreshed send: #tabRefreshed: to: self;
		when: #actionsChanged send: #actionsChanged: to: self;
		when: #tabResetSelection send: #tabResetSelection: to: self;
		when: #tabAddedToSelection send: #tabAddedToSelection: to: self;
		when: #tabRemovedFromSelection send: #tabRemovedFromSelection: to: self;
		when: #tabSelectTo send: #tabSelectTo: to: self;
		when: #tabEmptyContents send: #tabEmptyContents: to: self
]

{
	#category : #private-history,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>removeFromHistory: aTab [

	selectionHistory remove: aTab ifAbsent: [  ].
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>removeTab: aTab [
	| nextSelection |

	(aTab selected and: [selectionHistory size > 1])
		ifTrue: [ 
			nextSelection := selectionHistory at: selectionHistory size - 1.
			nextSelection selected: true ].
		
	self removeFromHistory: aTab.
	tabs remove: aTab.

	self adjustLayout
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>reversedSelectedTabs [

	^ selectionHistory last: numberOfSelectedTabs
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>selectLastTab [
	
	tabs ifEmpty: [ ^self ].
	tabs last selected: true
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>selectNext [
	| index nextSelection |
	
	index := tabs indexOf: self selectedTab.
	nextSelection := tabs at: index + 1 ifAbsent: [ ^ self ].

	nextSelection selected: true.
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>selectPrevious [
	| index nextSelection |
	
	index := tabs indexOf: self selectedTab.
	nextSelection := tabs at: index - 1 ifAbsent: [ ^ self ].

	nextSelection selected: true.
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>selectTabAt: index ifAbsent: aBlock [
	| tab |
	
	tab := tabs at: index ifAbsent: [ ^ aBlock value ].
	tab selected: true
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>selectedColor [
	^ Smalltalk ui theme selectionColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>selectedTab [

	  ^selectionHistory ifEmpty: [ nil ] ifNotEmpty: [ selectionHistory last ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>selectedTabs [

	^ (selectionHistory last: numberOfSelectedTabs) reversed
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>tabAddedToSelection: aTab [

	aTab selected ifTrue: [ ^ self ].
	numberOfSelectedTabs := numberOfSelectedTabs + 1.
	self addInHistory: aTab.
	aTab silentlySelected: true.
	self adjustLayout.
	
	self triggerEvent: #tabAddedToSelection with: aTab
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>tabDeleted: aTab [

	self removeTab: aTab
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>tabEmptyContents: aTab [

	self selectedTab = aTab ifFalse: [ ^ self ].

	(selectionHistory last: numberOfSelectedTabs) do: [ :each | each == aTab ifFalse: [ each silentlySelected: false ] ].	
	numberOfSelectedTabs := 1.
	self adjustLayout.
	
	self triggerEvent: #tabEmptyContents with: aTab
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>tabRefreshed: aTab [

	self selectedTab = aTab ifFalse: [ ^ self ].

	self triggerEvent: #tabRefreshed with: aTab
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>tabRemovedFromSelection: aTab [

	numberOfSelectedTabs == 1 ifTrue: [ ^ self ].
	numberOfSelectedTabs := numberOfSelectedTabs - 1.

	"Insert the remove tab just before the selected ones to preserve order"
	selectionHistory remove: aTab.
	selectionHistory add: aTab afterIndex: (selectionHistory size - numberOfSelectedTabs).
	
	aTab silentlySelected: false.
	self adjustLayout.
	
	self triggerEvent: #tabRemovedFromSelection with: aTab
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>tabResetSelection: aTab [
	"Clicked on an already clicked tab, since it can happened after a multi selection, I have to clear the selection except for this tab"
	
	selectionHistory ifNotEmpty: [
		(selectionHistory last: numberOfSelectedTabs) do: [ :each | each == aTab ifFalse: [ each silentlySelected: false ] ] ].
	
	numberOfSelectedTabs := 1.
	
	self addInHistory: aTab.
	self adjustLayout.
	
	self triggerEvent: #tabResetSelection with: aTab
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>tabSelectTo: aTab [
	| index selectedIndex |
	
	index := tabs indexOf: aTab. "If absent, then the system must be in a curious shape"
	selectedIndex := tabs indexOf: self selectedTab ifAbsent: [ ^ self ]. "No currently selected tab"
	
	index compareWith: selectedIndex
		ifLesser: [ 
			selectedIndex to: index by: -1 do: [ :i | 
				(tabs at: i) addToSelection	] ]
		ifEqual: [  ]
		ifGreater: [ 
			selectedIndex to: index do: [ :i | 
				(tabs at: i) addToSelection	] ].
			
	self addInHistory: aTab.
	self adjustLayout.
]

{
	#category : #private-actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>tabSelected: aTab [

	self isMultiSelection
		ifTrue: [ self tabResetSelection: aTab ]
		ifFalse: [ 
			self selectedTab ifNotNil: [ self selectedTab selected: false ].
			self addInHistory: aTab.	
			self adjustLayout.
			self triggerEvent: #tabSelected with: aTab ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>tabs [
	^ tabs
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>tabs: aCollection [

	tabs do: [ :e | e silentlySelected: false ].
	tabs := aCollection.
	selectionHistory removeAll.
	
	aCollection do: [ :aTab |
		self registerActionsFor: aTab.
		self selectedTab ifNil: [ aTab selected: true ].
		self addFirstInHistory: aTab ].
	
	self adjustLayout.
	self changed.
	self triggerEvent: #tabsChanged
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>themeChanged [
	super themeChanged.
	tabs do:#themeChanged.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabBarMorph>>useSortedTabsBy: sortBlock [
	tabs := SortedCollection sortBlock: sortBlock
]
