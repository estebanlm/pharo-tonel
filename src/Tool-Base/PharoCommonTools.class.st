"
A PharoCommonTools is a ToolRegistry that knows about common tools that may be replaced by other packages. It manages a list of the recently registered tools and provides settings for reregistering to a former registered tool.

"
Class {
	#name : #PharoCommonTools,
	#superclass : #ToolRegistry,
	#instVars : [
		'recentTools'
	],
	#category : #Tool-Base,
	#timestamp : 'NicolaiHess 12/18/2014 09:15'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools class>>initialize [
	SessionManager default
		registerToolClassNamed: self name
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools class>>settingsOn: aBuilder [
	<systemsettings>
	Smalltalk tools class == self
		ifFalse: [ ^ self ].
	(aBuilder group: #pharoTools)
		parent: #pharoSystem;
		label: 'Recent Tools';
		description: 'Recently registered Tools';
		with: [ 
					(aBuilder pickOne: #browserTool)
						target: Smalltalk;
						targetSelector: #tools;
						getSelector: #browserTool;
						setSelector: #browserTool:;
						label: 'Systembrowser';
						domainValues: Smalltalk tools recentBrowserTools ];
		with: [ 
					(aBuilder pickOne: #inspectorTool)
						target: Smalltalk;
						targetSelector: #tools;
						getSelector: #inspectorTool;
						setSelector: #inspectorTool:;
						label: 'Inspector';
						domainValues: Smalltalk tools recentInspectorTools ];
		with: [ 
					(aBuilder pickOne: #workspaceTool)
						target: Smalltalk;
						targetSelector: #tools;
						getSelector: #workspaceTool;
						setSelector: #workspaceTool:;
						label: 'Workspace';
						domainValues: Smalltalk tools recentWorkspaceTools ];
		with: [ 
					(aBuilder pickOne: #debuggerTool)
						target: Smalltalk;
						targetSelector: #tools;
						label: 'Debugger';
						domainValues: Smalltalk tools recentDebuggerTools ];
		with: [ 
					(aBuilder pickOne: #messageListTool)
						target: Smalltalk;
						targetSelector: #tools;
						label: 'Messagelist';
						domainValues: Smalltalk tools recentMessageListTools ];
		with: [ 
					(aBuilder pickOne: #versionBrowserTool)
						target: Smalltalk;
						targetSelector: #tools;
						label: 'Versionbrowser';
						domainValues: Smalltalk tools recentVersionBrowserTools ];
		with: [ 
					(aBuilder pickOne: #fileListTool)
						target: Smalltalk;
						targetSelector: #tools;
						label: 'Filelist';
						domainValues: Smalltalk tools recentFileListTools];
		with: [ 
					(aBuilder pickOne: #changeSorterTool)
						target: Smalltalk;
						targetSelector: #tools;
						label: 'Changesorter';
						domainValues: Smalltalk tools recentChangeSorterTools]
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools class>>shutDown: aboutToQuit [
	self allInstancesDo: #cleanUp
]

{
	#category : #'registry access',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>basicInspector [

	^ self toolNamed: #basicInspector
]

{
	#category : #'registry access',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>browser [

	^ self toolNamed: #browser
]

{
	#category : #tools,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>browserTool [
	^ self browser
]

{
	#category : #tools,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>browserTool: aTool [
	^ self register: aTool as: #browser
]

{
	#category : #'registry access',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>changeList [

	^ self toolNamed: #changeList
]

{
	#category : #'registry access',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>changeSorter [

	^ self toolNamed: #changeSorter
]

{
	#category : #tools,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>changeSorterTool [
	^ self changeSorter
]

{
	#category : #tools,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>changeSorterTool: aTool [
	^ self register: aTool as: #changeSorter
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>cleanUp [
	recentTools keysAndValuesDo:[:name :toolSet|
		toolSet copy do:[:tool | tool isObsolete ifTrue:[ toolSet remove: tool]]]
]

{
	#category : #'registry access',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>codeCompletion [

	^ self toolNamed: #codeCompletion
]

{
	#category : #'registry access',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>debugger [

	^ self toolNamed: #debugger
]

{
	#category : #tools,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>debuggerTool [
	^ self debugger
]

{
	#category : #tools,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>debuggerTool: aTool [
	^ self register: aTool as: #debugger
]

{
	#category : #'registry access',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>debuggers [

	^ self toolNamed: #debuggers
]

{
	#category : #'registry access',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>fileList [

	^ self toolNamed: #fileList
]

{
	#category : #tools,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>fileListTool [
	^ self fileList
]

{
	#category : #tools,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>fileListTool: aTool [
	^ self register: aTool as: #fileList
]

{
	#category : #'registry access',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>finder [

	^ self toolNamed: #finder
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>initialize [
	recentTools := Dictionary new.
	super initialize.
	
]

{
	#category : #'registry access',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>inspector [

	^ self toolNamed: #inspector
]

{
	#category : #tools,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>inspectorTool [
	^ self inspector
]

{
	#category : #tools,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>inspectorTool: aTool [
	^ self register: aTool as: #inspector
]

{
	#category : #'registry access',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>messageList [

	^ self toolNamed: #messageList
]

{
	#category : #tools,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>messageListTool [
	^ self messageList
]

{
	#category : #tools,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>messageListTool: aTool [
	^ self register: aTool as: #messageList
]

{
	#category : #'registry access',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>monticelloBrowser [

	^ self toolNamed: #monticelloBrowser
]

{
	#category : #'registry access',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>pointerExplorer [

	^ self toolNamed: #pointerExplorer
]

{
	#category : #'registry access',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>processBrowser [

	^ self toolNamed: #processBrowser
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>recentBrowserTools [
	^ self recentToolsFor: #browser
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>recentChangeSorterTools [
	^ self recentToolsFor: #changeSorter
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>recentDebuggerTools [
	^ self recentToolsFor: #debugger
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>recentFileListTools [
	^ self recentToolsFor: #fileList
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>recentInspectorTools [
	^ self recentToolsFor: #inspector
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>recentMessageListTools [
	^ self recentToolsFor: #messageList
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>recentToolsFor: aName [
	^ (recentTools at: aName ifAbsent: [ {} ]) reject: [ :tool | tool isObsolete ]
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>recentVersionBrowserTools [
	^ self recentToolsFor: #versionBrowser
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>recentWorkspaceTools [
	^ self recentToolsFor: #workspace
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>register: anTool as: aNameSelector [
	| usedToolSet |
	anTool ifNil:[ ^ self].
	super register: anTool as: aNameSelector.
	usedToolSet := recentTools at: aNameSelector ifAbsentPut: [ Set new ].
	usedToolSet add: anTool
]

{
	#category : #'registry access',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>syntaxErrorDebugger [

	^ self toolNamed: #syntaxErrorDebugger
]

{
	#category : #'registry access',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>testRunner [

	^ self toolNamed: #testRunner
]

{
	#category : #'registry access',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>timeProfiler [

	^ self toolNamed: #timeProfiler
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>toolNamed: aSymbol [

	tools at: aSymbol ifPresent: [ :tool | ^ tool ].
	
	aSymbol = #debugger ifTrue: [ 
		Smalltalk 
			logError: 'No debugger installed to handle debug request.' 
			inContext: thisContext.
		
			^ nil. "Smalltalk snapshot: false andQuit: true."
	].

	self error: 'No tool named: "' , aSymbol , '" present in the registry'.
]

{
	#category : #'registry access',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>versionBrowser [

	^ self toolNamed: #versionBrowser
]

{
	#category : #tools,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>versionBrowserTool [
	^ self versionBrowser
]

{
	#category : #tools,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>versionBrowserTool: aTool [
	^ self register: aTool as: #versionBrowser
]

{
	#category : #'registry access',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>workspace [

	^ self toolNamed: #workspace
]

{
	#category : #tools,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>workspaceTool [
	^ self workspace
]

{
	#category : #tools,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoCommonTools>>workspaceTool: aTool [
	^ self register: aTool as: #workspace
]
