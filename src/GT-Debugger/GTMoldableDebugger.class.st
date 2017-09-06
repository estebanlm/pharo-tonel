"
I provide the basic functionality needed to create new debuggers. 
Subclasses should override the following methods:
	debuggerStructureIn: -> provides the structure of the debugger
	debuggerTransmissionsIn: -> creates transmissions between the widgets of a debuggers
	selectedContext 
"
Class {
	#name : #GTMoldableDebugger,
	#superclass : #GLMCompositePresentation,
	#traits : 'GTBrowsingActions',
	#classTraits : 'GTBrowsingActions classTrait',
	#classVars : [
		'EnableDebuggerWindowDistinctColor',
		'EnableStackColoring',
		'GTDebuggerEnabledStatus'
	],
	#category : #GT-Debugger-UI,
	#timestamp : 'AndreiChis 12/30/2015 11:06'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>availableAutomatically [
	"Should this debugger be taken into account when looking for a debugger to handle an exception."
	
	^ false
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>debugSession: aSession [

	<primitive: 19> "simulation guard"

	"WorldState addDeferredUIMessage: ["
		^ self openOn: aSession 
	"]"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>defaultTitle [
	self subclassResponsibility
]

{
	#category : #'settings api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>enableDebuggerWindowDistinctColor [
	^ EnableDebuggerWindowDistinctColor ifNil: [EnableDebuggerWindowDistinctColor := false]
]

{
	#category : #'settings api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>enableDebuggerWindowDistinctColor: aBoolean [
	EnableDebuggerWindowDistinctColor := aBoolean.
]

{
	#category : #'settings api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>enableStackColoring [
	^ EnableStackColoring ifNil: [EnableStackColoring := false]
]

{
	#category : #'settings api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>enableStackColoring: aBoolean [
	EnableStackColoring := aBoolean.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>handlesContext: aContext [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>helpClass [

	self subclassResponsibility
]

{
	#category : #'settings api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>isGTDebuggerEnabled [

	^ GTDebuggerEnabledStatus ifNil: [ GTDebuggerEnabledStatus := Smalltalk tools debugger = self ]
]

{
	#category : #'instance creation api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>on: aDebugSession [

	^ self new 	
			session: aDebugSession
]

{
	#category : #'opening api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>openOn: aDebugSession withFullView: aBool [
	
	self openOn: aDebugSession withFullView: aBool andNotification: nil
]

{
	#category : #'opening api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>openOn: aDebugSession withFullView: aBool andNotification: aString [
	
	| debugger |
	debugger := (Smalltalk tools 
		debuggerDispatcherFor: aDebugSession interruptedContext
		matching: [:aDebugger | aDebugger availableAutomatically ]) 
			ifNil: [ 
				"Use the current debugger"
				self on: aDebugSession ]
			ifNotNil: [ :aDebugger | 
				"Use a custom extension"
				aDebugger on: (aDebugger spanNewSessionFrom: aDebugSession) ].
	
	aBool | self alwaysOpenFullDebugger
		ifTrue: [ debugger openWithFullView ]
		ifFalse: [ debugger openWithNotification: aString]
]

{
	#category : #'window color api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>patchworkUIThemeColor [
	"Answer a default color for UI themes that make use of different colors for Browser, MessageList etc..."

	^ Color lightRed

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>sessionClass [
	self subclassResponsibility
]

{
	#category : #'settings api',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>setGTDebuggerEnabledStatus: aBoolean [
	| oldStatus |
	
	oldStatus := self isGTDebuggerEnabled.
	GTDebuggerEnabledStatus := aBoolean.
	oldStatus ~= GTDebuggerEnabledStatus ifTrue: [ 
		GTDebuggerEnabledStatus 
			ifTrue: [ self register ]
			ifFalse: [ SpecDebugger registerToolsOn: Smalltalk tools ] ]
	
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>spanNewSessionForContext: aContext fromProcess: aProcess [

	^ self sessionClass 
		named: 'temporary name' on: aProcess startedAt: aContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>spanNewSessionFrom: anotherSession [

	^ (self sessionClass 
		named: anotherSession name 
		on: anotherSession interruptedProcess 
		startedAt: anotherSession interruptedContext)
			errorWasInUIProcess: anotherSession errorWasInUIProcess;
			yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>spanNewSessionLabeled: aString forContext: aContext fromProcess: aProcess [

	^ self sessionClass 
		named: aString on: aProcess startedAt: aContext
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger class>>taskbarIconName [
	^ #smallDebugIcon
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>actOnBrowserClosing: ann [
	self session ifNotNil: [ :aSession | aSession terminate ]
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>actOnInspectorPaneRemoved: ann [

]

{
	#category : #'building actions',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>actionsForPragmas: aSymbolsCollection [

	self session interruptedContext ifNil: [ ^ #() ].
	^ (self allActionsForPragmas: aSymbolsCollection)
				collect: [ :aDebugAction | aDebugAction asGlamourAction ]

]

{
	#category : #'building actions',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>allActionsForPragmas: aSymbolsCollection [
	
	^ (self session class 
		debuggingActionsForPragmas: aSymbolsCollection 
		for: self)

	

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>browser  [

	^ self presentations first
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>close [

	self browser ifNotNil: [ :aBrowser | aBrowser close ]
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>compose [
	"give the window a dedicated reddish color to ensure it gets noticed"
	self class enableDebuggerWindowDistinctColor ifTrue: [ 
		self color: (Color r: 1.0 g: 0.3 b: 0.3) ].
	self installDebuggingActionsFor: self.
	self tabulator with: [:browser | 
		self debuggerStructureIn: browser.
		self debuggerTransmissionsIn: browser ].
	self registerActions
]

{
	#category : #'accessing context',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>contextToSelectFrom: aSession [
	^ aSession interruptedContext
]

{
	#category : #'accessing context',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>currentContext [

	^self selectedContext 
		ifNil: [ self interruptedContext ] 
		ifNotNil:  [ self selectedContext  ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>debug: aContext using: aDebuggerClass [
	| currentSession newDebugger |
	
	currentSession := self session.
	self detachSession.
	self browser close.
	currentSession updateContextTo: aContext.
	newDebugger := aDebuggerClass on: (aDebuggerClass spanNewSessionFrom: currentSession).
	^ self openAndInitialize: newDebugger 
		
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>debuggerStructureIn: browser [
	self subclassResponsibility
		
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>debuggerTransmissionsIn: browser [
	self subclassResponsibility 
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>detachSession [
	self flag: 'why silent value?'.
	(self browser pane port: #entity) silentValue: nil
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>initialExtent [
"This code was taken from the standard debugger to get the same behavior. Fell free to refactor"

	RealEstateAgent standardWindowExtent y < 400 "a tiny screen" 
		ifTrue: [^ 700@500].
	
	^ [ | w h |
		w := Display width.
		h := Display height.
		(w - (w // 3)) @ (h - (h // 5)) ]
		on: Error
		do: [ 850@600 ]
]

{
	#category : #'building actions',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>installActionsForRootPragmas: aSymbolsCollection in: aPresentation [

	aPresentation dynamicActions: [ :presentation |
		self actionsForPragmas: (aSymbolsCollection collect: [ :aSymbol | #gt, aSymbol capitalized ]) ] .
	
	aPresentation dynamicActionsOnSelection: [ :presentation |
		self actionsForPragmas: (aSymbolsCollection collect: [ :aSymbol | #gtContext, aSymbol capitalized ]) ] .
]

{
	#category : #'building actions',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>installDebuggingActionsFor: aPresentation [

	self subclassResponsibility
]

{
	#category : #'accessing context',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>interruptedContext [

	^ self session interruptedContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>interruptedProcess [

	^ self session interruptedProcess
]

{
	#category : #'scripting opening',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>open		 [
	| window |
	window := super open.
	
	self class environment at: #GTDebuggerEventCollector ifPresent: [ :eventCollector | 
		eventCollector new collectDataFrom: self ].
		
	^ window.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>openAndInitialize: aNewDebugger [
	
	aNewDebugger color: self color.
	aNewDebugger openWithFullView.
	aNewDebugger window window "Hack to get this working with SpecDebugger"
		position: self window position;
		extent: self window extent.
	^ aNewDebugger
]

{
	#category : #'scripting opening',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>openOn: anObject [
	
	^ (super openOn: anObject)
		extent: self initialExtent;
		title: self session name;
		yourself
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>registerActions [

	self when: GLMBrowserClosing send: #actOnBrowserClosing: to: self.
	self when: DebugActionExecuted send: #updateBrowserFrom: to: self.
	self when: GLMPaneRemoved send: #actOnInspectorPaneRemoved: to: self.

]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>removeSessionSilently [

	(self browser pane port: #entity) silentValue: nil
]

{
	#category : #'accessing context',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>selectedContext [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>session [
 
	^ (self browser pane port: #entity) value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>session: aSession [

	(self browser pane port: #entity) value: aSession.
	self title: aSession name
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>taskbarIcon [
	^ self iconNamed: #glamorousBug
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>title [
	
	^ super title 
		ifNil: [ self class defaultTitle ] 
		ifNotNil: [ :aString | aString ] 
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>updateBrowser [
	| browserPane session |
	
	session := self session.
	browserPane := self browser pane.
	(browserPane port: #entity) silentValue: nil.
	(browserPane port: #entity) value: session.
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>updateBrowserFrom: anAnnouncement [
	
	anAnnouncement action needsUpdate ifTrue: [
		self updateBrowser ].
	
	self announcer announce: ( GTDebuggerBrowserUpdateRequest from: anAnnouncement )
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTMoldableDebugger>>windowIsClosing  [
	self flag: 'bug here when an announcement is inspected?'.
	self announce: (GLMBrowserClosing new presentation: self)
]
