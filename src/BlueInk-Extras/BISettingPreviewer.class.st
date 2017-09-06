"
Preview to see the effect of a setting on the behavior of the pretty printer.

self new openWithSpec 
"
Class {
	#name : #BISettingPreviewer,
	#superclass : #ComposableModel,
	#instVars : [
		'settingsTree',
		'classSearchField',
		'methodSearchField',
		'formattedCheckBox',
		'sourceCodePane'
	],
	#category : #BlueInk-Extras,
	#timestamp : 'FranckWarlouzet 7/27/2015 13:24'
}

{
	#category : #'build ui buttons',
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer class>>buildOpenBIInspectorButton [
	^ PluggableButtonMorph
		on: self
		getState: #openBIInspectorButtonState
		action: #openBIInspectorButtonAction
		label: #openBIInspectorButtonLabel
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer class>>defaultSpec [
	<spec: #default>
	^ SpecLayout composed
		newColumn:
				[ :col | 
			col
				newRow: [ :rowUp | rowUp add: #settingsTree ];
				newRow:
						[ :rowMiddle | 
					rowMiddle
						add: #classSearchField;
						add: #methodSearchField;
						add: #formattedCheckBox ]
					height: 30;
				newRow:
						[ :rowDown | rowDown newColumn: [ :methodSourceCode | methodSourceCode add: #sourceCodePane ] ] ];
		yourself
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer class>>dialogOpenBIPreviewer [
	^ Smalltalk ui theme
		newRowIn: World
		for:
			{(Smalltalk ui theme buttonLabelForText: 'Open Blue Ink Setting Previewer ').
			self buildOpenBIInspectorButton}
]

{
	#category : #'button behavior',
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer class>>openBIInspectorButtonAction [
	BISettingPreviewer new openWithSpec
]

{
	#category : #'button behavior',
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer class>>openBIInspectorButtonLabel [
	^ 'Open'
]

{
	#category : #'button behavior',
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer class>>openBIInspectorButtonState [
	^ true
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer class>>settingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #blueInkFormatterExtra)
		target: self;
		parent: #blueInkFormatter;
		label: 'BlueInk Formatting Editor';
		description: 'Open the BlueInk setting previewer to edit the formatting options';
		dialog: [ self dialogOpenBIPreviewer ]

	
]

{
	#category : #'item creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer>>buildClassSearchField [
	^ self newTextInput
		ghostText: 'Enter the class name...';
		autoAccept: true;
		yourself
]

{
	#category : #'item creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer>>buildFormattedCheckBox [
	^ self newCheckBox
		label: 'Formatted';
		state: true;
		whenActivatedDo:
				[ 
			formattedCheckBox toggleState.
			self selectorAndClassAreCorrect
				ifTrue: [ self formatSourceCode ] ];
		whenDeactivatedDo:
				[ 
			formattedCheckBox toggleState.
			self selectorAndClassAreCorrect 
				ifTrue: [ sourceCodePane text: self compiledMethodFromSearchFields sourceCode ] ];
		yourself
]

{
	#category : #'item creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer>>buildMethodSearchField [
	^ self newTextInput
		ghostText: 'Enter the method selector...';
		whenTextIsAccepted: [ self whenSelectorAccepted ];
		yourself.
]

{
	#category : #'item creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer>>buildSettingsTreeModel [
	| settingsTreeModel |
	settingsTreeModel := self newTree.
	settingsTreeModel
		roots:
			((SettingTree acceptableKeywords: #(#systemsettings)) nodeList
				select: [ :node | node parentName = #blueInkFormatter ]).
	settingsTreeModel displayBlock: [ :node | self displayNodeFor: node ].
	^ settingsTreeModel
]

{
	#category : #'item creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer>>buildSourceCodePane [
	^ self newText
		aboutToStyle: true;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer>>classSearchField [
	^ classSearchField
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer>>compiledMethodFromSearchFields [
	"precondition text represent class and selector"
	
	^ (self class environment at: classSearchField text asSymbol)
			>> methodSearchField text asSymbol 
]

{
	#category : #'item creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer>>displayNodeFor: aNode [
	| nodeMorphLeft nodeMorphRight |
	nodeMorphLeft := StringMorph contents: aNode item label.
	nodeMorphRight := (self theme newRowIn: World for: {aNode settingDeclaration inputWidget})
		clipSubmorphs: true;
		cellInset: 0;
		width: 570;
		left: 400;
		yourself.
	^ PanelMorph new
		addAllMorphs:
			{nodeMorphLeft.
			nodeMorphRight}; 
		color: Smalltalk ui theme lightBackgroundColor;
		hResizing: #shrinkWrap;
		yourself
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer>>formatSourceCode [
	| source tree formatted |
	source := self compiledMethodFromSearchFields sourceCode.
	tree := RBParser parseMethod: source onError: [ :msg :pos | ^ self ].
	formatted := tree
		formattedCodeWithMaxLineLength: (self window value window value width / 9) integerPart asInteger.	"It is a bit tricky but I get the width of the sourceCodePane like this..."
	sourceCodePane text: formatted
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer>>formattedCheckBox [
	^ formattedCheckBox
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer>>initialExtent [
	^ 1000 @ 700
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer>>initializeWidgets [
	sourceCodePane := self buildSourceCodePane.
	classSearchField := self buildClassSearchField.
	methodSearchField := self buildMethodSearchField.
	settingsTree := self buildSettingsTreeModel.
	formattedCheckBox := self buildFormattedCheckBox.
	SystemAnnouncer uniqueInstance weak when: BISettingsChanged send: #whenASettingChanged to: self.
	self focusOrder
		add: settingsTree;
		add: classSearchField;
		add: methodSearchField;
		add: formattedCheckBox;
		add: sourceCodePane
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer>>methodSearchField [
	^ methodSearchField
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer>>selectorAndClassAreCorrect [
	| class |
	methodSearchField text
		ifNotNil:
			[ :method | 
			classSearchField text
				ifNotNil:
					[ 
					class := self class environment at: classSearchField text asSymbol ifAbsent: [ ^ false].
					(class includesSelector: method asSymbol)
								ifTrue: [ ^ true ]]].
	^ false 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer>>settingsTree [
	^ settingsTree
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer>>sourceCodePane [
	^ sourceCodePane
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer>>title [
	^ 'Blue Ink Setting Previewer'
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer>>whenASettingChanged [
	(self formattedCheckBox state and: [ self selectorAndClassAreCorrect ])
		ifTrue: [ self formatSourceCode ] 
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:21'
}
BISettingPreviewer>>whenSelectorAccepted [
	| compiledMethod |
	self selectorAndClassAreCorrect
		ifTrue:
			[ 
			compiledMethod := self compiledMethodFromSearchFields.
			sourceCodePane behavior: compiledMethod methodClass.
			self formattedCheckBox state
				ifTrue: [ self formatSourceCode ]
				ifFalse: [ sourceCodePane text: compiledMethod sourceCode ] ]
		ifFalse: [ 
			sourceCodePane behavior: nil.
			sourceCodePane text: ' ' ]
]
