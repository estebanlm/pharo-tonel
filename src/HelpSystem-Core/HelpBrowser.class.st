"
A HelpBrowser is used to display a hierarchy of help topics and their contents.

Instance Variables
	rootTopic: 		<HelpTopic>
	window:			<StandardWindow>	 
	treeMorph:		<PluggableTreeMorph>
	contentMorph:		<Morph>			

rootTopic
	- xxxxx

window
	- xxxxx

treeMorph 
	- xxxxx

contentMorph 
	- xxxxx


"
Class {
	#name : #HelpBrowser,
	#superclass : #Model,
	#instVars : [
		'rootTopic',
		'window',
		'treeMorph',
		'helpTopicCache',
		'sourceTextModel'
	],
	#classVars : [
		'DefaultHelpBrowser'
	],
	#category : #HelpSystem-Core-UI,
	#timestamp : 'tbn 3/8/2010 09:33'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser class>>defaultHelpBrowser [
	^ DefaultHelpBrowser ifNil: [DefaultHelpBrowser := self]
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser class>>defaultHelpBrowser: aClass [
	"Use a new help browser implementation"
	
	DefaultHelpBrowser := aClass
	
]

{
	#category : #'world menu',
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser class>>menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'Help Browser')
		parent: #Help;
		order: 1.0;
		action: [ self open ];
		iconName: #smallHelpIcon;
		withSeparatorAfter 
]

{
	#category : #ui,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser class>>menuOn: aBuilder [
	<HelpBrowserContextMenu>
	
	(aBuilder item: #'Do it' translated)
		keyText: 'd';
		selector: #doIt;
		help: nil;
		iconName: #smallDoIt.
	(aBuilder item: #'Print it' translated)
		keyText: 'p';
		selector: #printIt;
		help: nil;
		iconName: #smallPrintIt.
	(aBuilder item: #'Inspect it' translated)
		keyText: 'i';
		selector: #inspectIt;
		help: nil;
		iconName: #smallInspectIt.

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser class>>open [
	^self openOn: SystemHelp
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser class>>openOn: aHelpTopic [
	"Open the receiver on the given help topic or any other object that can be transformed into
	 a help topic by sending #asHelpTopic."
	
	^(self defaultHelpBrowser new)
		rootTopic: aHelpTopic;
		open;
		yourself
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser class>>taskbarIconName [
	"Answer the icon for the receiver in a task bar."

	^ #bookIcon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser class>>theme [
	^ Smalltalk ui theme 
]

{
	#category : #ui,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>close [
	window notNil ifTrue: [window delete]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>doItContext [
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>doItReceiver [
	^ nil
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>helpTopic [
	^ helpTopicCache ifNil: [ helpTopicCache := rootTopic asHelpTopic ]
]

{
	#category : #ui,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>initWindow [
	| toolbar dock contentMorph |
	window := StandardWindow new.
	window model: self.
	window title: 'Help Browser'.
	toolbar := window
		newToolbar:
			{(window
				newButtonFor: self
				getState: nil
				action: #refresh
				arguments: nil
				getEnabled: nil
				labelForm: (self iconNamed: #refreshIcon)
				help: 'Refresh' translated)}.
	dock := window newToolDockingBar.
	dock addMorphBack: toolbar.
	window
		addMorph: dock
		fullFrame: ((0 @ 0 corner: 1 @ 0) asLayoutFrame bottomOffset: dock minExtent y).	"Tree"
	treeMorph := PluggableTreeMorph new.
	treeMorph
		model: self;
		setSelectedSelector: #onItemClicked:.
	window
		addMorph: treeMorph
		fullFrame: ((0 @ 0 corner: 0.3 @ 1) asLayoutFrame topOffset: dock minExtent y).	"Text"
	contentMorph := self sourceTextModel newScrolledText
		beForSmalltalkScriptingWithDefaultFont;
		beWrapped;
		yourself.
	contentMorph menuProvider: self selector: #shoutMorphFillMenu:.
	window
		addMorph: contentMorph
		fullFrame: ((0.3 @ 0 corner: 1 @ 1) asLayoutFrame topOffset: dock minExtent y)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>initialize  [
	super initialize. 
	self initWindow.
 
]

{
	#category : #ui,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>menu [
	^ (PragmaMenuBuilder pragmaKeyword: #HelpBrowserContextMenu model: self) menu.

]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>next [
	treeMorph setSelectionIndex: treeMorph getSelectionIndex + 1
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>onItemClicked: anItem [
	anItem ifNil: [ ^ self sourceTextModel setText: rootTopic asHelpTopic contents ].
	self sourceTextModel setText: anItem contents
]

{
	#category : #ui,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>open	 [
 	"Open the receivers window" 

	self refresh.	
	window openInWorld.
	 
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>previous [
	treeMorph setSelectionIndex: (treeMorph getSelectionIndex - 1 max: 1)
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>refresh [
	| helpTopic items |
	helpTopic := self helpTopic.
	window setLabel: helpTopic title.
	items := helpTopic subtopics collect: [ :each | HelpTopicListItemWrapper with: each ].
	treeMorph list: items.
	self sourceTextModel setText: helpTopic contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>rootTopic [
	^rootTopic
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>rootTopic: aHelpTopic [

	rootTopic := aHelpTopic. 
	self refresh 
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>selectARootTopic: aHelpClass [
	"Used to unfold a particular topic"
	
	| item |
	item := treeMorph allItems detect: [:each | 
            each complexContents item key = aHelpClass name ].
   treeMorph selection: item
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>selectTopicSatisfying: aBlock [
	"I select the first topic that satisfies the given block.
	If the topic has subtopics it is expanded. If the topic is not visible 
	the entire path to that topic is expanded."
	
	(self helpTopic pathToTopicSatisfying: aBlock) ifNotEmpty: [ :aCollection |
		treeMorph 
			selectPath: aCollection allButFirst
			in: (treeMorph scroller submorphs at: 1 ifAbsent: [^treeMorph]) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>selectedClassOrMetaClass [
	^ nil
]

{
	#category : #ui,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>shoutMorphFillMenu: aMenu [
	^ aMenu addAllFrom: self menu
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>sourceTextModel [
	^ sourceTextModel ifNil: [ sourceTextModel := RubScrolledTextModel new interactionModel: self ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
HelpBrowser>>window [

	^ window
]
