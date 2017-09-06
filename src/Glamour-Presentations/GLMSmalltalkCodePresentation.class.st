"
A GLMSmalltalkCodePresentation can display Smalltalk code. It offers support for syntax highlighting and can also deal with undeclared bindings, if used as an workspace.

Instance Variables
	highlightSmalltalkContext:		<Object>
	isForScripting:		<Object>
	variableBindingsBlock:		<Object>

highlightSmalltalkContext
	- xxxxx

isForScripting
	- xxxxx

variableBindingsBlock
	- xxxxx

"
Class {
	#name : #GLMSmalltalkCodePresentation,
	#superclass : #GLMTextualPresentation,
	#instVars : [
		'highlightSmalltalkContext',
		'variableBindingsBlock',
		'isForScripting'
	],
	#category : #Glamour-Presentations,
	#timestamp : 'AndreiChis 10/3/2014 18:37'
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSmalltalkCodePresentation>>beForScripting [

	isForScripting := true
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSmalltalkCodePresentation>>compileTextIn: aContext from:  aSession andDo: aBlock [

	self announce: (GLMCompileText new
		presentation: self;
		context: aContext;
		session: aSession;
		action: aBlock)
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSmalltalkCodePresentation>>debugSelection [

	self announce: GLMDebugSelection
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSmalltalkCodePresentation>>defaultSelectionActions [

	^ { 
		(GLMGenericAction new) 
				title: 'Print it';
				action: [ :aPresentation |
					aPresentation printSelection ]; 
				shortcut: $p; 
				yourself.
		(GLMGenericAction new) 
				title: 'Do it';
				action: [ :aPresentation |
					aPresentation evaluateSelection ]; 
				shortcut: $d; 
				icon: GLMUIThemeExtraIcons glamorousSpawn;
				yourself.
		(GLMGenericAction new) 
				title: 'Inspect it'; 
				action: [ :aPresentation |
					aPresentation evaluateSelectionAndDo: [ :result | result inspect ] ]; 
				shortcut: $i; 
				icon: GLMUIThemeExtraIcons glamorousInspect;
				yourself.
		(GLMGenericAction new) 
				title: 'Debug it'; 
				action: [ :aPresentation |
					aPresentation debugSelection ]; 
				"shortcut: $D; "
				yourself.
		(GLMGenericAction new) 
				title: 'Profile it'; 
				action: [ :aPresentation |
					aPresentation profileSelection ]; 
				yourself
		 }
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSmalltalkCodePresentation>>evaluateSelection [

	self evaluateSelectionAndDo: [ :result | result ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSmalltalkCodePresentation>>evaluateSelectionAndDo: aBlock [

	self announce: (GLMEvaluateSelection new action: aBlock)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSmalltalkCodePresentation>>highlightSmalltalkContext [
	^ highlightSmalltalkContext isNil 
		ifTrue: [nil] 
		ifFalse: [highlightSmalltalkContext glamourValue: self entity]
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSmalltalkCodePresentation>>installDefaultSelectionActions [

	self defaultSelectionActions do: [ :anAction |
		self addSelectionAction: anAction ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSmalltalkCodePresentation>>isForScripting [

	^ isForScripting ifNil: [ false ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSmalltalkCodePresentation>>printSelection [

	self announce: GLMPrintSelection
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSmalltalkCodePresentation>>profileSelection [

	self announce: GLMProfileSelection
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSmalltalkCodePresentation>>renderGlamorouslyOn: aRenderer  [
	self deprecated:  'Use GLMPharoMethodPresentation GLMPharoScriptPresentation instead.'.
	self registerAnnouncements.
	^ aRenderer renderSmalltalkCodePresentation: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSmalltalkCodePresentation>>smalltalkClass: aBlock [
	"aBlock takes as parameters the entity objects and 
	its evaluation is expected to produce a Smalltalk class"
	highlightSmalltalkContext := aBlock.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSmalltalkCodePresentation>>updateVariableBindings [

	self announce: (GLMVariableBindingsChanged new presentation: self).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSmalltalkCodePresentation>>variableBindings [
	^ (variableBindingsBlock glamourValue: self entity) ifNil: [OrderedCollection new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSmalltalkCodePresentation>>variableBindings: aBlock [
	^ variableBindingsBlock := aBlock
]
