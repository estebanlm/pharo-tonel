"

"
Class {
	#name : #GLMMorphicPharoCodeRendererTest,
	#superclass : #GLMMorphicTest,
	#category : #Glamour-Tests-Morphic,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicPharoCodeRendererTest>>testCodeExecutionWithBindings [
	| composite textMorph result |
	composite := GLMCompositePresentation new.
	composite pharoScript.
	window := composite openOn: 'a:=1'.

	result := nil.
	textMorph := self find: RubScrolledTextMorph in: window.
	textMorph textArea editor evaluateSelectionAndDo: [ :r | result := r ].
	self assert: result equals: 1
]
