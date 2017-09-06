"
TimeProfiler is a graphical front end of MessageTally. It gives nice facilities to navigate and browse a profile.

Use examples:
TimeProfiler new open
TimeProfiler new openOnBlock: [SimpleGridExample new open]
TimeProfiler new openOnBlock: [ClassTreeExample new openOn: Object]
 MessageTally spyAllOn: [ClassTreeExample new openOn: Object]
"
Class {
	#name : #TimeProfiler,
	#superclass : #MorphTreeModel,
	#instVars : [
		'win',
		'rootMessageTally',
		'threshold',
		'minPercentageToExpand',
		'treeMorph',
		'block',
		'blockCodePane',
		'withBlockCodePane',
		'blockSource',
		'reportOtherProcesses',
		'showLeavesOnly',
		'codeTabPane',
		'resultPane',
		'result',
		'withToolBar'
	],
	#category : #Tool-Profilers,
	#timestamp : '<historical>'
}

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler class>>fullReportMenuOn: aBuilder [
	"Specify the menu with a specific pragma. Try it with:
	(PragmaMenuBuilder 
		pragmaKeyword: 'TimeProfilerFullReportMenu'
		model: nil) menu popUpInWorld"

	<contextMenu>
	<TimeProfilerFullReportMenu>
	(aBuilder item: #'Find...' translated)
		keyText: 'f';
		selector: #find;
		iconName: #smallFindIcon.
	(aBuilder item: #'Find again' translated)
		keyText: 'g';
		selector: #findAgain;
		iconNamed: #smallFindIcon.
	(aBuilder item: #'Set search string' translated)
		keyText: 'h';
		selector: #setSearchString.
	(aBuilder item: #Copy translated)
		keyText: 'c';
		selector: #copySelection;
		iconName: #smallCopyIcon
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler class>>menuCommandOn: aBuilder  [
	<worldMenu>
	(aBuilder item: #'Time Profiler')
		parent: #Tools;  
		order: 0.40;
		icon: self taskbarIcon;
		action: [TimeProfiler new open]
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler class>>onBlock: block [
	"Open a profile browser on the given block, thereby running the block and 
	 collecting the message tally."
	"TimeProfiler onBlock: [ 20 timesRepeat: [Transcript show: 100 factorial printString]]"

	| inst result |
	inst := self new.
	result := inst runBlock: block.
	inst open.
	inst showResult: result.
	^ result
]

{
	#category : #tools-registry,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler class>>registerToolsOn: registry [
	"Add ourselves to registry. See [Smalltalk tools]" 
	registry register: self as: #timeProfiler
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler class>>spyAllOn: aBlock [
	"Spy on all the processes in the system
	
	[1000 timesRepeat: [3.14159 printString. Processor yield]] fork.
	[1000 timesRepeat: [20 factorial. Processor yield]] fork.
	[1000 timesRepeat: [20 factorial. Processor yield]] fork.
	self spyAllOn: [ (Delay forMilliseconds: 100) wait]
	
	"
	| inst result |
	inst := self new.
	result := inst spyAllOn: aBlock.
	inst open.
	inst showResult: result.
	^ result
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler class>>spyFor: seconds [
	"Run the system profiler for the specified number of seconds"
	"self spyFor: 2"
	^self spyOn: [ (Delay forSeconds: seconds) wait ].
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler class>>spyOn: aBlock  [
	^ (self new withBlockCodePane: false; withToolBar: false; yourself)
		openOnBlock: aBlock 
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler class>>spyOnProcess: aProcess forMilliseconds: msecDuration  [
	"Run aProcess for msecDuration milliseconds, then open a TimeProfiler on the results."

	| inst |
	inst := self new.
	inst withBlockCodePane: false.
	inst runProcess: aProcess forMilliseconds: msecDuration pollingEvery: MessageTally defaultPollPeriod.
	inst open.
	^ inst
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler class>>taskbarIconName [
	^#smallProfileIcon
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>blockCode [
	^ block
		ifNil: ['']
		ifNotNil: [ blockSource ifNil: [ blockSource := block asString ]]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>blockCode: aString notifying: aRequestor [
	"Treat the current selection as an expression; evaluate and tally it."
	|  compiledMethod |
	aString ifNil: [^ self].

	blockSource := aString.
	compiledMethod := self compile: aString for: nil in: self doItContext.
	compiledMethod ifNil: [^ self].
	self showResult: ( compiledMethod valueWithReceiver: self arguments: #()).
	self changed: #blockCode.
	self changed: #summaryText.
	self changed: #fullReport.
	self selection: nil.
	self updateList.
	self startState.
	

	
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>browseItem [
	self selectedNode ifNotNil: [:current | current browseItem ].

]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>codePaneMenu: aMenu shifted: shifted  [
	"Note that unless we override perform:orSendTo:, 
	PluggableTextController will respond to all menu items in a 
	text pane"
	| donorMenu |
	donorMenu := shifted
				ifTrue: [SmalltalkEditor shiftedYellowButtonMenu]
				ifFalse: [SmalltalkEditor yellowButtonMenu].
	^ aMenu addAllFrom: donorMenu
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>compile: codeString for: anObject in: evalContext [

	| methodNode |
	methodNode := Smalltalk compiler
		source: ('self runBlock: [', codeString, ']');
		class: anObject class;
		context: evalContext;
		requestor: self;
		noPattern: true;
		failBlock: [^nil];
		translate.
		
	^ methodNode generateWithSource.
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>contentsSelection [
	"Return the interval of text in the code pane to select when I set the pane's contents"

	^ 1 to: 0		"null selection"
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>correctFrom: start to: stop with: aString [
	^ blockCodePane correctFrom: start to: stop with: aString
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>deselect [
	blockCodePane deselect
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>doItContext [
	"Answer the context in which a text selection can be evaluated."

	^nil
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>doItReceiver [
	"This class's classPool has been jimmied to be the classPool of the class 
	being browsed. A doIt in the code pane will let the user see the value of 
	the class variables."

	^ self selectedClass
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>expandAll [
	treeMorph expandAllSuchThat: [:node | node percentage > self minPercentageToExpand]
]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>fullReport [
	"Return the full report of the tally "
	^ String streamContents: [:strm |
		rootMessageTally 
			ifNotNil: [ rootMessageTally report: strm ] ]
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>fullReportMenu: aMenuMorph shift: aBoolean [
	^ (PragmaMenuBuilder 
		pragmaKeyword: 'TimeProfilerFullReportMenu'
		model: self) menu 
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>helpMessage [

^'You can edit some code in the top editor and accept to profile it.
The result consists in a tree of method calls shown in the middle panel.
Select a method call to see or change its implementation in the bottom editor.

Tallies building:
The tallies are built according to the time threshold value that you can change at the top right (Treshold input field).

Tree expanding:
A tree node is expanded only if its duration percentage is greater that the minimum value that you can change at the top left (Min duration percentage input field). 
'
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>initialExtent [
	^ 750 @ 700
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>keyStroke: anEvent from: aTreeMorph  [
	self selectedNode ifNotNil: [:current | current keyStroke: anEvent from: aTreeMorph ].

]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>leaveItems [
	| res  |
	res := OrderedCollection new.
	rootMessageTally
		ifNotNil: [ 
			| dict |
			dict := IdentityDictionary new: 100.
			rootMessageTally leavesInto: dict fromSender: nil.
			res addAll: (dict asOrderedCollection select: [ :node | node tally > self threshold ]) ].
	^ res
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>menu: menu shifted: b  [
	"Set up the menu to apply to the receiver's, honoring the #shifted boolean"
	
	self selectedNode 
		ifNotNil: [ :current | 
			current menu: menu shifted: b.
			menu addLine.
			menu
				add: 'Expand all from here'
				target: self
				selector: #expandAllFromNode:
				argument: current ].
	^ menu
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>minPercentageToExpand [
	^ minPercentageToExpand ifNil: [minPercentageToExpand := 3]
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>minPercentageToExpand: aPercentage [
	minPercentageToExpand := aPercentage.
	self changed: #minPercentageToExpand.

]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>notify: aString at: anInteger in: aStream [
	blockCodePane notify: aString at: anInteger - 'self runBlock: [' size in: aStream 
]

{
	#category : #'public opening',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>open [
	"Public method. This method simply open a time profiler"

	| toolBar codePane vgap summaryPane blkPaneGap treeTopFraction treeTabPane fullReportPane |
	win := StandardWindow new model: self.
	win setLabel: self toolName.
	toolBar := self toolBarOn: win.
	treeMorph := self treeMorph
		buildContents;
		yourself.
	summaryPane := win
		newTextEditorFor: self
		getText: #summaryText
		setText: nil
		getEnabled: nil.
	fullReportPane := win
		newTextEditorFor: self
		getText: #fullReport
		setText: nil
		getEnabled: nil.
	fullReportPane getMenuSelector: #fullReportMenu:shift:.
	codePane := win
		newTextEditorFor: self
		getText: #selectedMethodCode
		setText: #selectedMethodCode:notifying:
		getEnabled: nil.
	codePane getMenuSelector: #codePaneMenu:shifted:.
	codePane font: StandardFonts codeFont.
	self withToolBar
		ifTrue: [ 
			vgap := toolBar minExtent y.
			win addMorph: toolBar fullFrame: ((0 @ 0 corner: 1 @ 0) asLayoutFrame bottomOffset: vgap) ]
		ifFalse: [ vgap := 0 ].
	blkPaneGap := 0.
	treeTopFraction := 0.0.
	self withBlockCodePane
		ifTrue: [ 
			blkPaneGap := 10.
			treeTopFraction := 0.15.
			blockCodePane := win
				newTextEditorFor: self
				getText: #blockCode
				setText: #blockCode:notifying:
				getEnabled: nil.
			blockCodePane getMenuSelector: #codePaneMenu:shifted:.
			blockCodePane font: StandardFonts codeFont.
			blockCodePane alwaysAccept: true.
			win
				addMorph: blockCodePane
				fullFrame:
					((0 @ 0 corner: 1 @ treeTopFraction) asLayoutFrame
						topOffset: vgap;
						bottomOffset: vgap + blkPaneGap) ].
	treeTabPane := win
		newTabGroup:
			{('Tallies Tree' -> treeMorph).
			('Full report' -> fullReportPane)}.
	win addMorph: treeTabPane fullFrame: ((0 @ treeTopFraction corner: 1 @ 0.6) asLayoutFrame topOffset: vgap + blkPaneGap).
	win
		addMorph:
			(codeTabPane := win
				newTabGroup:
					{('Code' -> codePane).
					('Statistics' -> summaryPane)})
		fullFrame: (0 @ 0.6 corner: 1 @ 1) asLayoutFrame.
	win openInWorld.
	self startState
]

{
	#category : #'public opening',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>openOnBlock: aBlock  [
	self runBlock: aBlock pollingEvery: MessageTally defaultPollPeriod.
	self open.
	^ self
]

{
	#category : #'public opening',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>openPathFrom: aNode [
	self expandNodePath: aNode path
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>profileIt [
	blockCodePane accept.
	
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>reportOtherProcesses [
	^ reportOtherProcesses ifNil: [reportOtherProcesses := true]

]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>reportOtherProcesses: aBoolean [
	self reportOtherProcesses ~= aBoolean
		ifFalse: [ ^ self ].
	reportOtherProcesses := aBoolean.
	self changed: #reportOtherProcesses.
	self updateList
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>result: anObject [
	result := anObject

]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>resultText [
	^ result printString

]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>rootItems [
	^ rootMessageTally
		ifNil: [#()]
		ifNotNil: [
			self showLeavesOnly 
				ifTrue: [ self leaveItems ]
				ifFalse: [ self rootTallyItems]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>rootNodeClassFromItem: anItem [
	^ TimeProfilerNode 
]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>rootTallyItems [
	| res sons groups |
	res := OrderedCollection new.
	rootMessageTally
		ifNotNil: [ 
			sons := rootMessageTally sonsOver: self threshold.
			groups := sons groupedBy: [ :aTally | aTally process ] having: [ :g | true ].
			groups
				do: [ :g | 
					self reportOtherProcesses
						ifTrue: [ res addAll: g ]
						ifFalse: [ res addAll: (g asSortedCollection reject: [ :gg | gg process isNil ]) ] ] ].
	^ res
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>runBlock: aBlock  [
	^ self runBlock: aBlock pollingEvery: MessageTally defaultPollPeriod
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>runBlock: aBlock pollingEvery: pollPeriod  [
	block := aBlock.
	rootMessageTally := MessageTally new.
	rootMessageTally
		reportOtherProcesses: true;
		maxClassNameSize: 1000;
		maxClassPlusSelectorSize: 1000;
		maxTabs: 100.
	result := rootMessageTally spyEvery: pollPeriod on: aBlock.
	self result: result.
	^ result

]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>runProcess: aProcess forMilliseconds: msecDuration pollingEvery: pollPeriod  [
	block := MessageSend 
				receiver: self
				selector: #runProcess:forMilliseconds:pollingEvery: 
				arguments: { 
						aProcess.
						msecDuration.
						pollPeriod}.	"so we can re-run it"
	rootMessageTally := MessageTally new.
	rootMessageTally
		reportOtherProcesses: false;
		maxClassNameSize: 1000;
		maxClassPlusSelectorSize: 1000;
		maxTabs: 100.
	result := rootMessageTally 
				spyEvery: pollPeriod
				onProcess: aProcess
				forMilliseconds: msecDuration.
	^result
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>select [
	blockCodePane select
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>selectFrom: start to: stop [
	blockCodePane  selectFrom: start to: stop
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>selectInvisiblyFrom:  first to:  last [
	blockCodePane selectInvisiblyFrom: first to: last.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>selectedClass [
	^ self selectedNode 
		ifNotNil: [ :currNode | currNode methodClass ]
]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>selectedMethodCode [
	^ self selectedNode 
		ifNil: [ self helpMessage ]
		ifNotNil: [ :currNode | 
			| class selector |
			class := currNode methodClass.
			selector := currNode selector.
			(class ultimateSourceCodeAt: selector ifAbsent: [ 'error' ])]
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>selectedMethodCode: aString notifying: aController [
	"Compile the code in aString. Notify aController of any syntax errors. 
	Answer false if the compilation fails. Otherwise answer true."

	self selectedNode
		ifNil: [ ^ false ]
		ifNotNil: [ :currNode | 
			| class oldSelector category newSelector |
			class := currNode methodClass.
			oldSelector := currNode selector.
			class ifNil: [ ^ false ].	"Normal method accept"
			category := class organization categoryOfElement: oldSelector.
			newSelector := class compile: aString classified: category notifying: aController.
			newSelector isNil
				ifTrue: [ ^ false ].
			self changed: #selectedMethodCode.
			^ true ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>selection: aSelection [
	super selection: aSelection.
	self changed: #selectedMethodCode

]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>selectionInterval [
	^ 1 to: 0
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>showLeavesOnly  [
	^ showLeavesOnly ifNil: [showLeavesOnly := false]
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>showLeavesOnly: aBoolean [
	self showLeavesOnly ~= aBoolean
		ifFalse: [ ^ self ].
	treeMorph
		treeLineWidth:
			(aBoolean
				ifTrue: [ 0 ]
				ifFalse: [ 1 ]).
	showLeavesOnly := aBoolean.
	self changed: #showLeavesOnly.
	self updateList
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>showResult: anObject [
	self result: anObject.
	resultPane
		ifNil: [resultPane := win
			newTextEditorFor: self
			getText: #resultText
			setText: nil
			getEnabled: nil.
			codeTabPane addPage: resultPane label: 'Result']
		ifNotNil: [self changed: #resultText]

	
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>spyAllOn: aBlock  [
	block := aBlock.
	rootMessageTally := MessageTally new.
	rootMessageTally
		reportOtherProcesses: true;
		maxClassNameSize: 1000;
		maxClassPlusSelectorSize: 1000;
		maxTabs: 100.
	result := rootMessageTally spyAllEvery: MessageTally defaultPollPeriod on: aBlock.
	self result: result.
	^ result

]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>startMinPercentageToExpand [
	^ 20
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>startState [
	treeMorph expandAllSuchThat: [:node | node percentage > self startMinPercentageToExpand]
	
]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>summaryText [
	^ String streamContents: [:strm | rootMessageTally 
		ifNotNil: [rootMessageTally time > 0 
			ifTrue: [strm nextPutAll: ' - '; print: rootMessageTally tally; nextPutAll: ' tallies, ', rootMessageTally time printString, ' msec.'; cr.
				rootMessageTally reportGCStatsOn: strm]]]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>tally [
	^ rootMessageTally tally
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>text [
	^ blockSource
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>threshold [
	^ threshold ifNil: [threshold := 0]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>threshold: aTreshold [
	(aTreshold ~= threshold and: [aTreshold between: 0 and: 1000])
		ifTrue: [
			threshold := aTreshold.
			self updateList].
	self changed: #threshold
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>time [
	^ rootMessageTally time
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>toolBarOn: aWindow [
	| uiTheme toolBar |
	uiTheme := Smalltalk ui theme.
	toolBar := toolBar := aWindow
		newToolbar:
			{((uiTheme
				newButtonIn: World
				for: self
				getState: nil
				action: #profileIt
				arguments: {}
				getEnabled: nil
				getLabel: nil
				help: nil)
				label:
					(uiTheme
						newRowIn: World
						for:
							{(AlphaImageMorph new
								image: (self iconNamed: #smallDoItIcon)).
							(uiTheme buttonLabelForText: 'Profile it' translated)});
				yourself).
			aWindow newToolSpacer.
			aWindow newToolSpacer.
			(aWindow newLabel: 'Min time % ' translated).
			(uiTheme
				newTextEntryIn: aWindow
				for: self
				get: #minPercentageToExpand
				set: #minPercentageToExpand:
				class: Float
				getEnabled: nil
				help: nil).
			aWindow newToolSpacer.
			aWindow newToolSpacer.
			(aWindow newLabel: 'Threshold: ' translated).
			(uiTheme
				newTextEntryIn: aWindow
				for: self
				get: #threshold
				set: #threshold:
				class: Integer
				getEnabled: nil
				help: nil).
			aWindow newToolSpacer.
			aWindow newToolSpacer.
			(aWindow
				newDropListFor: self
				list: #whatToShowList
				getSelected: #whatToShow
				setSelected: #whatToShow:
				getEnabled: nil
				useIndex: false
				help: 'Which kind of result').
			aWindow newToolSpacer.
			aWindow newToolSpacer.
			(uiTheme
				newCheckboxIn: World
				for: self
				getSelected: #reportOtherProcesses
				setSelected: #reportOtherProcesses:
				getEnabled: nil
				label: 'All processes'
				help: nil).
			aWindow newToolSpacer}.
	^ toolBar
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>toolName [
	^ 'Time profiler'
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>treeMorph [
	^ (self treeMorphClass on: self)
		rowInset: 2;
		columnInset: 4;
		autoDeselection: true;
		getMenuSelector:#menu:shifted:;
		keystrokeActionSelector: #keyStroke:from:;
		treeLineWidth: 1;
		treeLineDashes: {5. 1};
		lineColorBlock: [:node | {Color gray. Color orange. Color brown. Color magenta. Color blue} at: ((node level \\ 5) + 1)];
		doubleClickSelector: #browseItem;
		rowColorForEven: Smalltalk ui theme lightBackgroundColor;
		yourself

]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>whatToShow [
	^ self showLeavesOnly ifTrue: [#'Leaves'] ifFalse: [#'Full tree']
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>whatToShow: aSymbol [
	self showLeavesOnly: aSymbol = #'Leaves'
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>whatToShowList [
	^ #(#'Full tree' #'Leaves')
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>withBlockCodePane [
	^ withBlockCodePane ifNil: [withBlockCodePane := true]
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>withBlockCodePane: aBoolean [
	withBlockCodePane := aBoolean
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>withToolBar [
	^ withToolBar ifNil: [withToolBar := true]
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfiler>>withToolBar: aBoolean [
	withToolBar := aBoolean
]
