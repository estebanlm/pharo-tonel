"
A SpecDebuggerStack is responsible for displaying and managing the stack. All actions from the context menu of the stack are loaded by using the pragmas 'self contextMenuDebuggingActions'.
"
Class {
	#name : #SpecDebuggerStack,
	#superclass : #ComposableModel,
	#instVars : [
		'sessionHolder',
		'listWidget',
		'actionsCache'
	],
	#classVars : [
		'DoItFilterEnabled',
		'FilterDictionary',
		'KCFilterEnabled',
		'LinkSelectorFilterEnabled',
		'NilSelectorsFilterEnabled'
	],
	#category : #Spec-Debugger,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack class>>defaultStackSize [

	^ 20
]

{
	#category : #'filters creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack class>>doItFilter [
	^ SelectorFilter forSelector: #doIt
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack class>>dynamicStackMenu: aBuilder [
	<contextMenu>
	<specDebuggerStackMenuNew>
	
	| target |
	target := aBuilder model.
	target currentContext ifNil: [ ^ target ].
	target currentContext class refactoringMethod: aBuilder.
	target currentContext class methodRefactoring: aBuilder.
		
	aBuilder model stack generateContextMenuDebuggingActions do: [ :anAction | 
		anAction asMenuRegistrationIn: aBuilder ].
	aBuilder
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack class>>enabledFilters [
	| enabledFilters |
	
	enabledFilters := OrderedCollection new.
	self filterDoItSelectors ifTrue: [ 
		enabledFilters addLast: self doItFilter ].
	self filterKernelClasses ifTrue: [ 
		enabledFilters addLast: self kernelClassesFilter ].
	self filterNilSelectors ifTrue: [ 
		enabledFilters addLast: self nilMsgsFilter ].
	self filterLinkSelectors ifTrue: [ 
	enabledFilters addLast: self linkMessagesFilter].	
	^ enabledFilters
 
]

{
	#category : #'settings filters',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack class>>filterDoItSelectors [
	^ DoItFilterEnabled ifNil:[ DoItFilterEnabled := false ]
]

{
	#category : #'settings filters',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack class>>filterDoItSelectors: aBoolean [
	DoItFilterEnabled := aBoolean
]

{
	#category : #'settings filters',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack class>>filterKernelClasses [
	^ KCFilterEnabled ifNil:[ KCFilterEnabled := false ]
]

{
	#category : #'settings filters',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack class>>filterKernelClasses: aBoolean [
	KCFilterEnabled := aBoolean
]

{
	#category : #'settings filters',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack class>>filterLinkSelectors [
  	^ LinkSelectorFilterEnabled ifNil:[ LinkSelectorFilterEnabled := false ]
]

{
	#category : #'settings filters',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack class>>filterLinkSelectors: aBoolean [
	LinkSelectorFilterEnabled := aBoolean
]

{
	#category : #'settings filters',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack class>>filterNilSelectors [
  	^ NilSelectorsFilterEnabled ifNil:[ NilSelectorsFilterEnabled := false ]
]

{
	#category : #'settings filters',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack class>>filterNilSelectors: aBoolean [
	NilSelectorsFilterEnabled := aBoolean
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack class>>initialize [

	FilterDictionary := Dictionary new.
]

{
	#category : #'filters creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack class>>kernelClassesFilter [
	^ KernelClassesFilter new.
	
]

{
	#category : #'filters creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack class>>linkMessagesFilter  [
	^ SelectorFilter forSelectors: (OrderedCollection with: #ctxtEnsure: with: #valueInContext:)
]

{
	#category : #'filters creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack class>>nilMsgsFilter  [
	^ SelectorFilter forSelectors: (OrderedCollection with: #isNil with: #ifNotNil: with: #ifNil)
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack class>>spec [
	<spec: #default>
	
	^ SpecLayout composed
		add: #list 
]

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>browseClassRefs [

	self currentContext ifNotNil: [ :aContext || class|
		class := aContext methodClass theNonMetaClass.
		class isTrait 
			ifTrue: [ self systemNavigation browseAllUsersOfTrait: class ]
			ifFalse: [ self systemNavigation browseAllCallsOnClass: class ] ]

]

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>browseClassVarRefs [
	"1/17/96 sw: devolve responsibility to the class, so that the code that does the real work can be shared"

	| cls |
	cls := self currentClass.
	(cls notNil and: [cls isTrait not])
		ifTrue: [self systemNavigation  browseClassVarRefs: cls]
]

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>browseClassVariables [
	"Browse the class variables of the selected class."
	| cls |
	cls := self currentClass.
	(cls notNil and: [cls isTrait not])
		ifTrue: [self systemNavigation  browseClassVariables: cls]

]

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>browseInstVarRefs [
	"1/26/96 sw: real work moved to class, so it can be shared"
	| cls |
	cls := self currentClassOrMetaClass.
	(cls notNil and: [cls isTrait not])
		ifTrue: [self systemNavigation browseInstVarRefs: cls]
]

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>browseMessages [
	"Present a menu of all messages sent by the current message. 
	Open a message set browser of all implementors of the message chosen."

	self currentMessageName ifNotNil: [   
		self systemNavigation browseAllImplementorsOf: self currentMessageName ]
]

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>browseMethodFull [
	"Create and schedule a full Browser and then select the current class and message."

	self currentClassOrMetaClass ifNotNil: [ 
		Smalltalk tools browser 
			openOnClass: self currentClassOrMetaClass
			selector: self currentMessageName ]
]

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>browseSendersOfMessages [
	"Present a menu of the current message, as well as all messages sent by it.  Open a message set browser of all senders of the selector chosen."

	self currentMessageName ifNotNil: [   
		self systemNavigation browseAllSendersOf: self currentMessageName ]
]

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>browseVersions [
	"Create and schedule a message set browser on all versions of the 
	currently selected message selector."

	Smalltalk tools versionBrowser
		browseVersionsForClass:  self currentClassOrMetaClass 
		selector: self currentMessageName
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>columnsFor: anEntry [
	"protocol: printing"

	"Answer the array of contexts."

	| method classLocation receiverClass |
	method := anEntry home method.
	classLocation := method methodClass.
	receiverClass := anEntry receiver class.

	"If the receiver is differen from the implementor, show the original method implementor"
	classLocation := classLocation = receiverClass
		ifTrue: [ classLocation name ]
		ifFalse: [ receiverClass name , '(' , classLocation name , ')' ].
	anEntry isBlockContext
		ifTrue: [ classLocation := '[...] in ' , classLocation ].
	^ {classLocation.
	method selector asString}
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>contextMenu: aMenu [
	"Create the context menu dynamically."
	
	self flag: 'Spec ignores the shortcuts set in the menu. Use another mechanism to load them'.
	"This method of constructing the menu is used as it allow one to reuse the MenuRegistration class for creating the actual menu morphs."							
	^ aMenu addAllFromPragma: 'specDebuggerStackMenuNew' target: self debugger.
]

{
	#category : #'actions lookup',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>contextMenuDebuggingActionsPragmas [

	^ { #contextMenuDebuggingAction }
]

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>currentClass [

	^ self currentContext methodClass
]

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>currentClassOrMetaClass [

	^ self currentContext methodClass
]

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>currentContext [
	
	^ self debugger currentContext
]

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>currentMessageName [

	^ self currentContext methodSelector
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>debugger [
	"Return the instance of the debugger containing this toolbar"
	
	^  owner
]

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>enabledFilters [

	^ self class enabledFilters
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>expand [
	"If the last element of the visible stack is selected, expand the stack,
	if more elements are available."
	
	self list selectedItem ifNil: [ ^ self ]. 
	
	self list listItems ifNotNil: [ :aList |
		(self list selectedIndex = self list listSize and: [
			self list selectedItem sender notNil ]) ifTrue: [ 
				self expandBy: self class defaultStackSize ] ]
	
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>expandBy: anInteger [
	| selectionIndex |
	
	selectionIndex := self list selectedIndex.
	self list items: (self filteredStackOfSize: anInteger + self list listSize).
	self list setSelectedIndex: selectionIndex
	
]

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>fileOutMessage [
	"Put a description of the selected message on a file"

	self currentMessageName ifNotNil: [
		Cursor write showWhile:
			[ self currentClassOrMetaClass fileOutMethod: self currentMessageName ] ]
]

{
	#category : #filtering,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>filteredStackOfSize: anInteger [

	^ self debugger class filterCommonMessageSends 
		ifTrue: [
			self session 
				stackOfSize: anInteger 
				usingFilters: self enabledFilters ]
		ifFalse: [ 
			self session stackOfSize: anInteger ]
		
	 
]

{
	#category : #'actions lookup',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>generateContextMenuDebuggingActions [

	actionsCache ifNotNil: [  ^ actionsCache ].
	"Cache the actions as this method is called multiple times: 
	two times when the menu is created and one time when the registering shortcuts."
	^ actionsCache := self session class 
		debuggingActionsForPragmas: self contextMenuDebuggingActionsPragmas 
		for: self debugger
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>initialize [

	sessionHolder := nil asValueHolder.
	actionsCache := nil.
	super initialize.
	
	"self setDefaultFilters."
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>initializePresenter [

	super initializePresenter.

	sessionHolder whenChangedDo: [ :aSession |
		self updateContentFromSession: aSession ] 

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>initializeWidgets [

	listWidget := self newMultiColumnList.
	
	self list displayBlock: [ :aContext | self columnsFor: aContext ].
	self list menu: [ :aMenu |
		self contextMenu: aMenu]
]

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>inspectInstances [
	"Inspect all instances of the selected class."

	self currentClassOrMetaClass ifNotNil: [ :aClass |
		aClass theNonMetaClass inspectAllInstances ]
]

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>inspectSubInstances [
	"Inspect all instances of the selected class and all its subclasses"

	self currentClassOrMetaClass ifNotNil: [ :aClass |
		aClass theNonMetaClass inspectSubInstances ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>list [

	^ listWidget
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>listItems [

	^ self list listItems
]

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>methodHierarchy [
	"Create and schedule a method browser on the hierarchy of implementors."

	self systemNavigation 
			methodHierarchyBrowserForClass: self currentClassOrMetaClass 
			selector: self currentMessageName

]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>selectedIndex [

	^ self list selectedIndex
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>selectedItem [

	^ self list selectedItem
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>session [

	^ sessionHolder value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>session: aSession [

	sessionHolder value: aSession
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>setSelectedItem: anItem [

	self list setSelectedItem: anItem
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>takeKeyboardFocus [

	self list takeKeyboardFocus
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>updateContentFromSession: aSession [
	
	self list items: (aSession 
		ifNil: [ OrderedCollection new ] 
		ifNotNil: [ self filteredStackOfSize: self class defaultStackSize ] )
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>updateDebuggingActions [

	actionsCache ifNotNil: [ 
		actionsCache do: [ :each |
			each keymap ifNotNil: [ :aShortcut |
				self list removeKeyCombination: aShortcut ] ] ].
	actionsCache := nil.
	self generateContextMenuDebuggingActions.
	
	actionsCache do: [ :each |
		each keymap ifNotNil: [ 
			self list bindKeyCombination: each keymap toAction:  [ each execute ] ] ].
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>updateForSelectionChanged [

	self
		expand;
		takeKeyboardFocus; "This is needed, as otherwise, the inspectors will take the focus"
		updateDebuggingActions 
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>whenListChanged: aBlock [

	self list whenListChanged: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecDebuggerStack>>whenSelectedItemChanged: aBlock [

	self list whenSelectedItemChanged: aBlock
]
