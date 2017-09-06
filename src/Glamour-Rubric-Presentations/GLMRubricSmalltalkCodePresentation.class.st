"
I extend the simple Rubric text presentation with basic support for dealing with Smalltalk code.
"
Class {
	#name : #GLMRubricSmalltalkCodePresentation,
	#superclass : #GLMRubricTextPresentation,
	#instVars : [
		'highlightSmalltalkContext',
		'variableBindingsBlock'
	],
	#category : #Glamour-Rubric-Presentations,
	#timestamp : 'AndreiChis 10/1/2014 13:48'
}

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricSmalltalkCodePresentation>>browseIt [

	self announce: (GLMTextEditorRequest for: #browseIt)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricSmalltalkCodePresentation>>browsingSelectionActions [

	^ { (GLMGenericAction new) 
				title: 'Browse it';
				action: [ :aPresentation |
					aPresentation browseIt  ]; 
				shortcut: $b; 
				category: 'Code search...';
				yourself.
		(GLMGenericAction new) 
				title: 'Senders of it';
				action: [ :aPresentation |
					aPresentation sendersOfIt ]; 
				shortcut: $n; 
				category: 'Code search...';
				yourself.
		(GLMGenericAction new) 
				title: 'Implementors of it';
				action: [ :aPresentation |
					aPresentation implementorsOfIt ]; 
				shortcut: $m; 
				category: 'Code search...';
				yourself.
		(GLMGenericAction new) 
				title: 'References to it';
				action: [ :aPresentation |
					aPresentation referencesToIt ]; 
				"shortcut: $N; "
				category: 'Code search...';
				withSeparatorAfter;
				yourself.
		(GLMGenericAction new) 
				title: 'Extended string search'; 
				action: [ :aPresentation |
					aPresentation selectLine.
					self systemNavigation 
						browseMethodsWithString: aPresentation selectedText
						matchCase: false ]; 
				shortcut: $E;
				category: 'Code search...';
				yourself.
		(GLMGenericAction new) 
				title: 'Method source with it';
				action: [ :aPresentation |
					aPresentation selectLine.
					self systemNavigation 
						browseMethodsWithSourceString: aPresentation selectedText
						matchCase: false.]; 
				category: 'Code search...';
				withSeparatorAfter;
				yourself. }
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricSmalltalkCodePresentation>>compileTextIn: aContext from:  aSession andDo: aBlock [

	self announce: (GLMCompileText new
		presentation: self;
		context: aContext;
		session: aSession;
		action: aBlock)
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricSmalltalkCodePresentation>>debugSelection [

	self announce: GLMDebugSelection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricSmalltalkCodePresentation>>defaultSelectionActions [

	^ self executionSelectionActions, 
		self browsingSelectionActions,
		self codeEditingSelectionActions
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricSmalltalkCodePresentation>>evaluateSelection [

	self announce: (GLMEvaluateSelection new 
		action: [ :result | result ];
		makeSyncronous)
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricSmalltalkCodePresentation>>evaluateSelectionAndDo: aBlock [

	self announce: (GLMEvaluateSelection new action: aBlock)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricSmalltalkCodePresentation>>executionSelectionActions [

	^ { 
		(GLMGenericAction new) 
				title: 'Do it';
				action: [ :aPresentation |
					aPresentation highlightEvaluateAndDo: [ :result | ] ]; 
				keymap: PharoShortcuts current doItShortcut; 
				icon: GLMUIThemeExtraIcons glamorousSpawn;
				yourself.
		(GLMGenericAction new) 
				title: 'Print it';
				action: [ :aPresentation |
					aPresentation printSelection ]; 
				keymap: PharoShortcuts current printItShortcut; 
				yourself.
		(GLMGenericAction new) 
				title: 'Inspect it'; 
				action: [ :aPresentation |
					aPresentation highlightEvaluateAndDo: [ :result | result inspect ] ]; 
				keymap: PharoShortcuts current inspectItShortcut; 
				icon: GLMUIThemeExtraIcons glamorousInspect;
				yourself.
		(GLMGenericAction new) 
				title: 'Basic Inspect it'; 
				action: [ :aPresentation |
					aPresentation highlightEvaluateAndDo: [ :result | result basicInspect ] ]; 
				shortcut: $I; 
				icon: GLMUIThemeExtraIcons glamorousInspect;
				yourself.
		(GLMGenericAction new) 
				title: 'Debug it'; 
				action: [ :aPresentation |
					aPresentation debugSelection ]; 
				shortcut: $D;
				yourself.
		(GLMGenericAction new) 
				title: 'Profile it'; 
				action: [ :aPresentation |
					aPresentation profileSelection ]; 
				withSeparatorAfter;
				yourself.
		 }
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricSmalltalkCodePresentation>>highlightEvaluateAndDo: aBlock [

	self announce: (GLMHighlightAndEvaluate new action: aBlock)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricSmalltalkCodePresentation>>highlightSmalltalkContext [
	^ highlightSmalltalkContext isNil 
		ifTrue: [nil] 
		ifFalse: [highlightSmalltalkContext glamourValue: self entity]
]

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricSmalltalkCodePresentation>>implementorsOfIt [

	self announce: (GLMTextEditorRequest for: #implementorsOfIt)
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricSmalltalkCodePresentation>>installDefaultSelectionActions [

	self defaultSelectionActions do: [ :anAction |
		self addSelectionAction: anAction ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricSmalltalkCodePresentation>>printSelection [

	self announce: GLMPrintSelection
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricSmalltalkCodePresentation>>profileSelection [

	self announce: GLMProfileSelection
]

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricSmalltalkCodePresentation>>referencesToIt [

	self announce: (GLMTextEditorRequest for: #referencesToIt)
]

{
	#category : #'actions browsing',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricSmalltalkCodePresentation>>sendersOfIt [

	self announce: (GLMTextEditorRequest for: #sendersOfIt)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricSmalltalkCodePresentation>>smalltalkClass: aBlock [
	"aBlock takes as parameters the entity objects and 
	its evaluation is expected to produce a Smalltalk class"
	highlightSmalltalkContext := aBlock.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricSmalltalkCodePresentation>>variableBindings [
	^ (variableBindingsBlock glamourValue: self entity) ifNil: [OrderedCollection new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMRubricSmalltalkCodePresentation>>variableBindings: aBlock [
	^ variableBindingsBlock := aBlock
]
