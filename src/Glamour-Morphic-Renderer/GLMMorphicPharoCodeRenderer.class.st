"

"
Class {
	#name : #GLMMorphicPharoCodeRenderer,
	#superclass : #GLMMorphicRubricTextRenderer,
	#category : #Glamour-Morphic-Renderer,
	#timestamp : ''
}

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicPharoCodeRenderer>>actOnCompileText: ann  [
	
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
GLMMorphicPharoCodeRenderer>>actOnEvaluateSelection: ann  [

	"We get here as a result of an announcement.
	If we do not defer the execution and an exception is triggered by the execution of the code
	then resuming the execution in the debugger will trigger an error when unwinding the stack."
	ann isSyncronous ifTrue: [ 
		textMorph textArea editor evaluateSelectionAndDo: ann action.
		^ self ]. 
	UIManager default defer: [ 
		textMorph textArea editor evaluateSelectionAndDo: ann action ]
	
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicPharoCodeRenderer>>actOnHighlightAndEvaluate: ann  [

	"We get here as a result of an announcement.
	If we do not defer the execution and an exception is triggered by the execution of the code
	then resuming the execution in the debugger will trigger an error when unwinding the stack."
	UIManager default defer: [ 
		textMorph textArea handleEdit: [
			textMorph textArea editor highlightEvaluateAndDo: ann action .
			textMorph shoutStyler style: textMorph text. ] ]
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicPharoCodeRenderer>>debugHighlightedText [

	UIManager default defer: [ 
		textMorph textArea editor debugHighlight.
		textMorph shoutStyler style: textMorph text. ]
	
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicPharoCodeRenderer>>evaluateAndPopPrintHighlight [

	GLMPrintPopper
		installAlarm: #popupPrint
		for: self
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicPharoCodeRenderer>>evaluateAndPrintSelection [

	UIManager default defer: [ 
		textMorph textArea editor printIt ]
	
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicPharoCodeRenderer>>modelFor: aPresentation [
	| highlightContext |
	highlightContext := aPresentation highlightSmalltalkContext. 
	^ GLMRubricSmalltalkTextModel new
		glamourPresentation: aPresentation;
		highlightSmalltalk: highlightContext notNil;
		highlightSmalltalkContext: highlightContext;
		yourself
]

{
	#category : #events-alarms,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicPharoCodeRenderer>>popupPrint [
	"Evaluates selected code and prints it in a popper"
	textMorph textArea editor highlightEvaluateAndDo: [ :result | 
		textMorph shoutStyler style: textMorph text.
		GLMPrintPopper new 
			openFromRubric: textMorph textArea withResult: result ]
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicPharoCodeRenderer>>profileHighlightedText [

	textMorph textArea editor tallyHighlight.
	textMorph shoutStyler style: textMorph text.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicPharoCodeRenderer>>registerEventsForPresentation: aPresentation [
	super registerEventsForPresentation: aPresentation.
	aPresentation when: GLMSelectCurrentLine send: #selectLine to: self.
	aPresentation when: GLMEvaluateSelection send: #actOnEvaluateSelection: to: self.
	aPresentation when: GLMHighlightAndEvaluate send: #actOnHighlightAndEvaluate: to: self.
	aPresentation when: GLMCompileText send: #actOnCompileText: to: self.
	aPresentation when: GLMDebugSelection send: #debugHighlightedText to: self.
	aPresentation when: GLMProfileSelection send: #profileHighlightedText to: self.
	aPresentation when: GLMPrintSelection send: #evaluateAndPopPrintHighlight to: self
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicPharoCodeRenderer>>selectLine [
	
	textMorph textArea editor lineSelectAndEmptyCheck: [^ nil]
]
