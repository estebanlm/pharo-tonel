"

"
Class {
	#name : #GLMMorphicSmalltalkCodeRenderer,
	#superclass : #GLMMorphicTextRenderer,
	#category : #Glamour-Morphic-Renderer,
	#timestamp : ''
}

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSmalltalkCodeRenderer>>actOnCompileText: ann  [
	
	"The current compiler wants to notify a text morph object in case of errors. 
	The compilation is delagated to the renderer, as the renderer has access
	to the text morph object."
(ann session 
		recompileMethodTo: ann presentation text 
		inContext: ann context 
		notifying: textMorph) ifTrue: [ ann action ifNotNil: [ :action | action value ] ]
	
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSmalltalkCodeRenderer>>actOnEvaluateSelection: ann  [

	"We get here as a result of an announcement.
	If we do not defer the execution and an exception is triggered by the execution of the code
	then resuming the execution in the debugger will trigger an error when unwinding the stack."
	UIManager default defer: [ 
		textMorph evaluateSelectionAndDo: ann action ]
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSmalltalkCodeRenderer>>actOnVariableBindingsUpdated: ann  [

	textModel variableBindings: nil.
	self addVariableBindingsOn: textModel from: ann presentation.
	textModel changed: #text. self flag: 'update just the style here'
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSmalltalkCodeRenderer>>addVariableBindingsOn: aTextModel from: aPresentation [

	aPresentation variableBindings do: [ :each | aTextModel addVariableBinding: each ].
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSmalltalkCodeRenderer>>debugSelection [

	textMorph debugIt
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSmalltalkCodeRenderer>>evaluateAndPrintSelection [

	UIManager default defer: [ textMorph printIt ]
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSmalltalkCodeRenderer>>profileSelection [

	textMorph tallyIt
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSmalltalkCodeRenderer>>registerEventsForPresentation: aPresentation [
	super registerEventsForPresentation: aPresentation.
	aPresentation when: GLMVariableBindingsChanged send: #actOnVariableBindingsUpdated: to: self.
	aPresentation when: GLMEvaluateSelection send: #actOnEvaluateSelection: to: self.
	aPresentation when: GLMCompileText send: #actOnCompileText: to: self.
	aPresentation when: GLMDebugSelection send: #debugSelection to: self.
	aPresentation when: GLMProfileSelection send: #profileSelection to: self.
	aPresentation when: GLMPrintSelection send: #evaluateAndPrintSelection to: self
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSmalltalkCodeRenderer>>textModelFor: aPresentation [
	| tm |
	tm := GLMSmalltalkCodeModel new
		text: aPresentation formatedDisplayValue;
		glamourPresentation: aPresentation;
		highlightSmalltalk: true;
		highlightSmalltalkContext: aPresentation highlightSmalltalkContext.
	self addVariableBindingsOn: tm from: aPresentation.
	aPresentation isForScripting ifTrue: [ 
		tm bindingsStrategy: self workspaceBindingsStrategy ].
	^ tm
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSmalltalkCodeRenderer>>textMorphForModel: aTextModel [
	| morph  |
	morph := GLMPluggableTextMorph new.
	morph styler workspace: aTextModel.
	morph
		on: aTextModel
			text: #text
			accept: #accept:notifying:
			readSelection: #selection
			menu: #menu:shifted:;
		changedAction: [:aText| 
			aText asString trimBoth ifNotEmpty:  [aTextModel text: aText] ];
		onKeyStrokeSend: #keystroke:from: to: aTextModel;
		layoutFrame: (LayoutFrame identity);
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		color: Smalltalk ui theme backgroundColor;
		font: StandardFonts codeFont;
		yourself.
	^ morph
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicSmalltalkCodeRenderer>>workspaceBindingsStrategy [

	^ [ :currentBindings :aString |
		(currentBindings includesKey: aString)
			ifFalse: [currentBindings add: (WorkspaceVariable key: aString asSymbol) ].
		currentBindings associationAt: aString]
]
