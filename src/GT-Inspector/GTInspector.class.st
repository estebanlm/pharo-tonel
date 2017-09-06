"
This is meant to be used for inspecting objects. It offers multiple views and it uses a finder as a navigation. One particular feature is that you can use the evaluator tab to enter code, and evaluating it results in opening another pane to the right.

The object finder asks dynamically the object for the actual presentations that are displayed in each pane.

Example:
self openOn: Smalltalk.

Register it as a replacement for explorer:
self registerToolsOn: Smalltalk tools.
"
Class {
	#name : #GTInspector,
	#superclass : #GLMCompositePresentation,
	#instVars : [
		'presentationFilter'
	],
	#classVars : [
		'EnabledStepRefreshStatus',
		'GTInspectorEnabledStatus',
		'GTNumberOfInspectorPanes',
		'IndexableDisplayLimit',
		'PreferredExtent',
		'RememberPreferredExtent',
		'StepRefreshRate'
	],
	#category : #GT-Inspector,
	#timestamp : 'TudorGirba 8/21/2011 16:57'
}

{
	#category : #'utilities api',
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>closeAllInspectors [
	<script>
	"self closeAllInspectors"
	(SystemWindow allSubInstances select: [:w | 
		 w model isKindOf: self])
			do: [:w | w delete ].

]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>disableStepRefresh [
	self setEnabledStepRefreshStatus: false
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>enableStepRefresh [
	self setEnabledStepRefreshStatus: true
]

{
	#category : #openning,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>explore: anObject  [
	self openOn: anObject.
	^ anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>extensionsPragma [
	^ #gtInspectorPresentationOrder:
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>extentSettingsOn: aBuilder  [
	<systemsettings>
	
	(aBuilder setting: #GTInspectorPreferredWidth)
		target: self;
		parent: #gt;
		getSelector: #preferredWidth;
		setSelector: #preferredWidth:; 
		label: 'Inspector width';
		description: 'The preferred width of new Inspector windows'.
	(aBuilder setting: #GTInspectorPreferredHeight)
		target: self;
		parent: #gt;
		getSelector: #preferredHeight;
		setSelector: #preferredHeight:; 
		label: 'Inspector height';
		description: 'The preferred height of new Inspector windows'.
	(aBuilder setting: #GTInspectorRememberPreferredExtent)
		target: self;
		parent: #gt;
		getSelector: #rememberPreferredExtent;
		setSelector: #rememberPreferredExtent:; 
		label: 'Remember extent of Inspector';
		description: 'Enable or disable remembering of the extent of Inspector windows on resize. When the preference is true, resizing a Inspector window will affect the preferred width and height of future Inspector windows'

]

{
	#category : #inspecting,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>gtInspectorExtensionsIn: composite [
	<gtInspectorPresentationOrder: 40>
	composite list
		title: 'Extensions';
		display: [ self inspectorExtendingMethods ];
		showOnly: 50;
		format: [ :each | each gtDisplayString ];
		filterOn: [ :text :each | each gtDisplayString includesSubstring: text caseSensitive: false ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>indexableDisplayLimit [
	^ IndexableDisplayLimit ifNil: [ 5000 ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>indexableDisplayLimit: anInteger [
	IndexableDisplayLimit := anInteger
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>initialize  [
	self numberOfInspectorPanes: 2
]

{
	#category : #openning,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>inspect: anObject  [
	self openOn: anObject.
	^ anObject
]

{
	#category : #openning,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>inspect: anObject label: aString [
	self new 
		title: aString;
		openOn: anObject.
	^ anObject

]

{
	#category : #openning,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>inspector: anObject [

	^ self openOn: anObject
]

{
	#category : #inspecting,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>inspectorExtendingMethods [
	^ (SystemNavigation default allBehaviors flatCollect: [ :each | 
			(Pragma allNamed: self extensionsPragma in: each) 
				collect: [ :p | p method asRingDefinition ] ])
		sorted
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>isGTInspectorEnabled [

	^ GTInspectorEnabledStatus ifNil: [ GTInspectorEnabledStatus := Smalltalk tools inspector = self ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>isStepRefreshEnabled [

	^ EnabledStepRefreshStatus ifNil: [ false ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>numberOfInspectorPanes [
	^ GTNumberOfInspectorPanes 
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>numberOfInspectorPanes: anInteger [
	GTNumberOfInspectorPanes := anInteger 
]

{
	#category : #openning,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>openOn: anObject  [
	^ self new openOn: anObject
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>preferredExtent [
	^ PreferredExtent ifNil: [ PreferredExtent := 600@400 ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>preferredExtent: aPoint [
	PreferredExtent := aPoint
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>preferredHeight [
	^ self preferredExtent y
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>preferredHeight: aHeight [
	self preferredExtent setX: self preferredExtent x setY: aHeight
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>preferredWidth [
	^ self preferredExtent x
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>preferredWidth: aWidth [
	self preferredExtent setX: aWidth setY: self preferredExtent y
]

{
	#category : #'tools registry',
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>register [

	self registerToolsOn: Smalltalk tools

]

{
	#category : #'tools registry',
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>registerToolsOn: registry [
	"self registerToolsOn: Smalltalk tools " 
	registry register: self as: #inspector

]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>rememberPreferredExtent [
	^ RememberPreferredExtent ifNil: [ RememberPreferredExtent := true ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>rememberPreferredExtent: aBoolean [
	^ RememberPreferredExtent := aBoolean
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>setEnabledStepRefreshStatus: aBoolean [
	EnabledStepRefreshStatus := aBoolean
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>setGTInspectorEnabledStatus: aBoolean [
	| oldStatus |
	
	oldStatus := self isGTInspectorEnabled.
	GTInspectorEnabledStatus := aBoolean.
	oldStatus ~= GTInspectorEnabledStatus ifTrue: [ 
		GTInspectorEnabledStatus 
			ifTrue: [ self register ]
			ifFalse: [ EyeInspector registerToolsOn: Smalltalk tools ] ]
	
	
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>setPreferredExtentIfWanted: anExtent [
	self rememberPreferredExtent ifTrue: [ 
		self preferredExtent: anExtent ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>settingsOn: aBuilder  [
	<systemsettings>
	
	(aBuilder group: #gt)
		parent: #tools;
		label: 'Glamorous Toolkit';
		with: [
			(aBuilder setting: #numberOfInspectorPanes)
				target: self; 
				label: 'Number of inspector panes';
		 		description: 'Specifies the maximum number of panes that are visible at every moment in a Glamorous Inspector.'.
			(aBuilder setting: #GTInspectorStatus)
				target: self;
				getSelector: #isGTInspectorEnabled;
				setSelector: #setGTInspectorEnabledStatus:; 
				label: 'GTInspector';
		 		description: 'Enable or disable the GTInspector.'.
			(aBuilder setting: #EnabledStepRefreshStatus)
				target: self;
				getSelector: #isStepRefreshEnabled;
				setSelector: #setEnabledStepRefreshStatus:; 
				label: 'GTInspector Step Refresh';
		 		description: 'Enable or disable the automatic refresh in GTInspector that uses a busy update loop (based on the stepping mechanism from Morphic).']
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>stepRefreshRate [
	^ StepRefreshRate ifNil: [ 1500 ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector class>>stepRefreshRate: anInteger [
	StepRefreshRate := anInteger
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>actOnPaneAdded: anAnnouncement [
	
	"Update toolbar of a pane before the last (added) pane if there is one"
	(self panes atLast: 2 ifAbsent: [ ^ self ])
		updateToolbar
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>actOnPaneRemoved: anAnnouncement [

	"Update toolbar of a pane before the removed pane (now it is last one)"
	self panes last updateToolbar
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>browser [
	^ self first
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>closeActionFor: aPresentation [

	^ GLMGenericAction new
			action: [ self removeLastPane ];
			icon: GLMUIThemeExtraIcons glamorousClose;
			condition: [ :currentPresentation |
				self panes size > 1 and: [ self panes last presentations = currentPresentation ] ];
			title: 'Close this inspector column'
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>compose [
	self title: [:anObject | 'Inspector on ', (self printObjectAsAnItem: anObject)].
	self act: [:b | b update] icon: GLMUIThemeExtraIcons glamorousRefresh entitled: 'Update'.
	self act: [:b | 
		HelpBrowser open selectTopicSatisfying: [:each |
			each owner notNil and:  [
			(each owner key = GTInspectorHelp key) and: [
				each title = 'Overview' ] ] ] ] 
		icon: GLMUIThemeExtraIcons glamorousHelp 
		entitled: 'Help'.
	self act: [:b | b presentationFilter changeFilterRequestFor: b ] entitled: 'Filter presentations'.
	self pager with: [ :browser | 
		browser fixedSizePanes: self class numberOfInspectorPanes.
		browser show: [ :a :each |
			a title: [ self printObjectAsAnItem: each ].
			a dynamicActions: [ :aPresentation | 
				each gtInspectorActions asOrderedCollection ].
			a titleAction: [ :aPresentation | self closeActionFor: aPresentation ].
			a dynamic 
				display: [ :x | 
					(GLMCompositePresentation new with: [:d | 
						each 
							gtInspectorPresentationsIn: d 
							inContext: self ])
							startOn: x ] ] ].
			
	self browser when: GLMPaneAdded send: #actOnPaneAdded: to: self.
	self browser when: GLMPaneRemoved send: #actOnPaneRemoved: to: self.
	
	self class isStepRefreshEnabled ifTrue: [ 
		self wantsAutomaticRefresh: true.
		self wantsSteps: true.
		self stepTime: self class stepRefreshRate ].
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>entities [
	"returns the list of objects from the #entity port of each pane of the finder"
	^ self panes collect: [ :each | (each port: #entity) value ]
]

{
	#category : #context,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>filterByMethods: aCollection [
	| filter |
	
	filter := GTInspectorMethodListFilter new.
	aCollection do: [ :aMethod |
		filter addAndSelectSignatureFor: aMethod ].
	self presentationFilter: filter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>firstPresentation [

	^ self panes first presentations first
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>initialize [
	super initialize.
	
	self presentationFilter: (GTInspectorTagFilter new
			defaultTag: #custom;
			addAndSelectTag: #basic;
			addAndSelectTag: #custom;
			addAndSelectTag: #examples)
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>openExplorerFor: anObject [
	"this method is needed for compatibility with ObjectExplorer"
	self openOn: anObject
]

{
	#category : #'scripting opening',
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>openOn: aPage [
	| window |
	window := super openOn: aPage.
	window extent: self class preferredExtent.
	window when: WindowResizing do: [ 
		(window isMinimized or: [ window isMaximized ]) ifFalse: [ 
			"we only wnat to react to real resizing,
			not to minization or maximization"
			self class setPreferredExtentIfWanted: window extent ] ].
	^ window
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>panes [
	^ self browser panes
]

{
	#category : #context,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>presentationFilter [
	"Return a filter for limiting the number of visible presentations.
	Filter can not be nil"
	<return: #GTInspectorPresentationFilter>

	^ presentationFilter
]

{
	#category : #context,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>presentationFilter: aPresentationFilter [
	"Set a filter for limiting the number of visible presentations.
	Presentation filter must not be nil. If you don't need any filter use GTInspectorNoneFilter instead"
	
	self
		assert: [ aPresentationFilter isNotNil ]
		description: [ 'Presentation filter must not be nil' ].
	
	presentationFilter := aPresentationFilter
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>printObjectAsAnItem: anObject [
	| header printString |
	header := (anObject class name first isVowel
		ifTrue: [ 'an ' ]
		ifFalse: [ 'a ' ]) , anObject class name.
	printString := (GTObjectPrinter asTruncatedTextFrom: anObject) asString.
	^ (printString beginsWith: header)
		ifTrue: [ printString ]
		ifFalse: [ 
			String streamContents: [ :out | 
				out << header; << ' ('; << printString; << ')' ] ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>refreshPanes [
	self panes do: [ :aPane | 
		aPane updateToolbar.
		aPane presentations presentations first withAllPresentations do: [ :aPresentation |
			aPresentation wantsAutomaticRefresh ifTrue: [ 
				aPresentation requestRefresh ] ]  ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>removeLastPane [
	| lastPane |
	
	lastPane := self panes last.
	self browser removeLastPane.
	self browser announce: (GLMPaneRemoved pane: lastPane fromBrowser: self browser)
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>requestRefresh [
	self updateToolbar.
	self refreshPanes
]

{
	#category : #context,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>shouldDisplayPresentationCreatedBy: aMethod [
	"Verify whether or not the presentation created by the given method should be displayed.
	If no filter is given display all presentations."

	^ self presentationFilter shouldDisplayPresentationCreatedBy: aMethod
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>showFirst: aBlock [

	self browser showFirst: aBlock
]

{
	#category : #stepping,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTInspector>>step [
	self window ifNil: [ ^ self ].
	self window isActive ifFalse: [ ^ self ].
	
	self wantsAutomaticRefresh ifTrue: [
		self requestRefresh ]
]
