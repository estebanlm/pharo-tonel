"
A BrowseDebugAction is a debugging actions sending a unary message to the stack widget.

"
Class {
	#name : #BrowseDebugAction,
	#superclass : #MessageSendDebugAction,
	#category : #DebuggerActions,
	#timestamp : '<historical>'
}

{
	#category : #'actions creation',
	#timestamp : ' 8/31/2017 05:26:17'
}
BrowseDebugAction class>>debugActionsFor: aDebugger [
	<contextMenuDebuggingAction>
	| initilOrder |
	
	initilOrder := 60.
	^ { 
		self new
			id: #browseSendersOfMessages;
			order: initilOrder;
			keymap: PharoShortcuts current browseSendersShortcut;
			label: 'Senders of...'.
		self new
			id: #browseMessages;
			order: initilOrder + 5;
			keymap: PharoShortcuts current browseImplementorsShortcut;
			label: 'Implementors of...'.
		self new
			id: #methodHierarchy;
			order: initilOrder + 10;
			keymap: PharoShortcuts new browseMethodHierarchyShortcut;
			label: 'Inheritance'.
		self new
			id: #browseVersions;
			order: initilOrder + 15;
			keymap: PharoShortcuts current browseVersionsShortcut;
			label: 'Versions'.
		self new
			id: #browseInstVarRefs;
			order: initilOrder + 20;
			label: 'Inst var refs...'.
		self new
			id: #browseClassVarRefs;
			order: initilOrder + 25;
			label: 'Class var refs...'.
		self new
			id: #browseClassVariables;
			order: initilOrder + 30;
			label: 'Class variables';
			withSeparatorAfter.
			
		self new
			id: #browseClassRefs;
			order: initilOrder + 35;
			keymap: PharoShortcuts current browseClassReferencesShortcut;
			label: 'Class refs'.
		self new
			id: #browseMethodFull;
			order: initilOrder + 40;
			keymap: PharoShortcuts current browseShortcut;
			label: 'Browse full'.
		self new
			id: #fileOutMessage;
			order: initilOrder + 45;
			label: 'File out'.
		self new
			id: #inspectInstances;
			order: initilOrder + 50;
			label: 'Inspect instances'.
		self new
			id: #inspectSubInstances;
			order: initilOrder + 55;
			label: 'Inspect subinstances';
			withSeparatorAfter
	 }
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:17'
}
BrowseDebugAction>>initialize [

	super initialize.
	self needsUpdate: false.
	self needsValidation: false.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:17'
}
BrowseDebugAction>>receiver [

	^ self debugger stack
]
