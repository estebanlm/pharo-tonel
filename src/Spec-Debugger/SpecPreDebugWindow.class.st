"
I am the window that shows up when the debugger is launched.  
I show you the first lines of the stack trace that caused my apparition (or a text editor with a message), and a set of buttons created by loading all debugging actions annotated with the pragmas 'self preDebuggingActionsPragmas' (e.g. resume the execution, abandon the execution).

To see me, evaluate:
2/0.

Some details about my implementation.

- I hold a reference to the debugger than created my;
- changing the debuger retriggers the construction of this window;
- before doing this users should set the attribute 'message' as my structure depens on it;
- changing the debugger should be done only after this window was open. E.g.:

SpecPreDebugWindow new 
		setTitle: aTitle;
		message: aMessage;
		openWithSpec;
		debugger: aDebugger.
		
- an example of manually opening this window:

[ | context process  debugger |

context := [ 20 factorial ] asContext.

process := Process 
	forContext: context
	priority: Processor userInterruptPriority.

debugger := SpecDebugger new
	process: process 
	controller:  nil
	context: context.
	
SpecPreDebugWindow new 
		setTitle: 'A simulated error';
		message: nil;
		openWithSpec;
		debugger: debugger
 ] fork.
"
Class {
	#name : #SpecPreDebugWindow,
	#superclass : #DynamicComposableModel,
	#instVars : [
		'debugger',
		'title',
		'message'
	],
	#category : #Spec-Debugger,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow class>>debuggerClass [

	^ SpecDebugger
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow class>>spec [
	<spec: #default>
		^ SpecLayout composed
			yourself
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow class>>taskbarIconName [

	^ self debuggerClass taskbarIconName
]

{
	#category : #'actions lookup',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>actionsForPragmas: aSymbolsCollection [

	^ (self session class debuggingActionsForPragmas: aSymbolsCollection for: self debugger)
				
]

{
	#category : #'building widgets',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>buildButtonWidgetsSpecForActions: aCollection [

	^ aCollection
		inject: OrderedCollection new
		into: [ :specs :action |
			specs 
				add: action specId;
			 	add: action specModel;
				yourself ]
	
]

{
	#category : #'building widgets',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>buildNotifierPaneWidgetsSpec [
	
	^ self message 
		ifNil: [ {#stackPane. #MultiColumnListModel} ] 
		ifNotNil: [ {#codePane. #TextModel} ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>clear [

	self debugger ifNotNil: [ :aDebugger | aDebugger clear ]
]

{
	#category : #'building widgets',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>clearWidget [

	self widgets removeAll.
	
	self needFullRebuild: true.
	self needRebuild: false.
	
 	self buildWithSpecLayout: self emptyLayout	

]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>close [
	
	self window delete
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>columnsFor: anEntry [
	
	^ self debugger stack columnsFor: anEntry
]

{
	#category : #'building widgets',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>createButtonWidgetsForActions: aCollection [

	self instantiateModels: (self buildButtonWidgetsSpecForActions: aCollection).
	aCollection do: [ :action | 
		self initializeButtonWidget: (self widgets at: action specId) forAction: action ]
]

{
	#category : #'building widgets',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>createNotifierPaneWidgets [

	self instantiateModels: self buildNotifierPaneWidgetsSpec.
	(self widgets keys includes: #codePane) ifTrue: [ 
		(self widgets at: #codePane) beForText.
	].
	self widgets keysDo: [ :key | 
		(self perform: ('initialize', key asString capitalized) asSymbol) ]
]

{
	#category : #'building widgets',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>createWidgetsForActions: aCollection [

	self createNotifierPaneWidgets.
	self createButtonWidgetsForActions: aCollection.

	self setFocusOrderForActions: aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>debugger [

	^ debugger value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>debugger: anOnject [

	debugger value: anOnject
]

{
	#category : #'building widgets',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>dynamicLayoutForActions: aCollection [
	"Create a two column layout for the subwidgets."

	^ SpecLayout composed
		newColumn: [ :c | 
			c newRow: [ :row |
				aCollection do: [ :anAction | row add: anAction specId ] ] height: self class toolbarHeight.
	  		c newRow: [ :row | row add: self notifierPaneWidgetId] ]
]

{
	#category : #'building widgets',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>emptyLayout [
	
	^ SpecLayout composed

]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>initialExtent [

	^ 700 @ 156
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>initialize [

	debugger := nil asValueHolder.
	super initialize.
	
	self whenWindowChanged: [:w | w whenClosedDo: [ self clear ] ].
	self bindKeyCombination: Character escape asKeyCombination toAction: [ self delete ]
]

{
	#category : #'initialization widgets',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>initializeButtonWidget: aButtonModel forAction: aDebuggingAction [

	aButtonModel 
		debugAction: aDebuggingAction
]

{
	#category : #'initialization widgets',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>initializeCodePane [
		
	self codePane
		text: self message
		
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>initializePresenter [

	super initializePresenter.
	
	debugger whenChangedDo: [ :aDebugger |
		aDebugger 
			ifNil: [ self clearWidget ] 
			ifNotNil:  [ self rebuildWidget ]	 ]

]

{
	#category : #'initialization widgets',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>initializeStackPane [
	
	self stackPane
		displayBlock: [ :aContext | self columnsFor: aContext ];
		items: (self debugger stack filteredStackOfSize: self debugger stack class defaultStackSize) ;
		whenSelectedItemChanged: [ :aContext | 
			"Set the selection before, as debugAction removes the link with the debugger. "
			self debugger stack setSelectedItem: aContext.
			self openFullDebugger ]
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>message [

	^ message
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>message: aString [
	"Set a message in the pre debug window. 
	If this is nil the notifier pane will display a text editor showing the message (Warning signal: 'Display this text'),
	otherwise the stack will be displayed."
	
	message := aString
]

{
	#category : #'building widgets',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>notifierPaneWidgetId [
	"Return the id of the notifier widget. Assume there is just one widget that is not a button,
	which represents the notifier."
	
	self buildNotifierPaneWidgetsSpec pairsDo: [ :key :value |
		(self widgets keys includes: key) ifTrue: [ ^ key ] ].
	^ nil
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>openFullDebugger [
	| currentDebugger |
	
	currentDebugger := self debugger.
	self debugger: nil.
	self close.
	currentDebugger 
		openWithSpec;
		updateToolbar;
		updateCodeFromContext;
		label: title
]

{
	#category : #'actions lookup',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>preDebuggingActions [
	"Return a collection of debug actions constructed based on the pragmas 'self preDebuggingActionsPragmas'. 
	These actions should understand the message #preDebugWindow:"
	
	^ (self actionsForPragmas: self preDebuggingActionsPragmas) 
		do: [ :each | 
			each preDebugWindow: self ]
]

{
	#category : #'actions lookup',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>preDebuggingActionsPragmas [

	^ { #preDebuggingAction }
]

{
	#category : #'building widgets',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>rebuildWidget [
	| debuggingActions |
	
	debuggingActions := self preDebuggingActions.
	self widgets removeAll.
	self createWidgetsForActions: debuggingActions.
	 
	self needFullRebuild: true.
	self needRebuild: false.
	
 	self buildWithSpecLayout: (self dynamicLayoutForActions: debuggingActions).
	
	self takeKeyboardFocus. 

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>session [

	^ self debugger session
]

{
	#category : #'building widgets',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>setFocusOrderForActions: aCollection [

	self focusOrder removeAll.
	aCollection do: [ :action | 
		self focusOrder add: (self perform: action specId) ].	
	self focusOrder add: (self perform: self notifierPaneWidgetId)
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>setTitle: aString [

	title := aString.
	self updateTitle 
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecPreDebugWindow>>title [

	^ title 
]
