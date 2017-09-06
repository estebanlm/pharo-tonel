"
This is a framework class that can be used by clients that create custom browsers containing text presentations with custom highlighters.

Usage example:

GLMRubricHighlightedTextPresentation new
	editingMode: [ 
		GLMHighlighterTextRubEditingMode withStylerDecorator: 
			GLMHighlighterTextStylerDecorator new ].
"
Class {
	#name : #GLMHighlighterTextRubEditingMode,
	#superclass : #RubEditingMode,
	#instVars : [
		'stylerDecorator'
	],
	#category : #Glamour-Rubric-Presentations,
	#timestamp : 'TudorGirba 1/23/2017 14:41'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMHighlighterTextRubEditingMode class>>withParserStyler: aParser [

	^ self new stylerDecorator: (GLMHighlighterTextStylerDecorator
			withParserStyler: aParser)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMHighlighterTextRubEditingMode class>>withStylerDecorator: aDecorator [

	^ self new stylerDecorator: aDecorator
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMHighlighterTextRubEditingMode>>stylerDecorator [
	
	^ stylerDecorator
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMHighlighterTextRubEditingMode>>stylerDecorator: anObject [
	
	stylerDecorator := anObject
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMHighlighterTextRubEditingMode>>updateTextAreaWhenPlugged [
	self withStyler.
	super updateTextAreaWhenPlugged
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMHighlighterTextRubEditingMode>>updateTextAreaWhenUnplugged [
	self withoutStyler.
	super updateTextAreaWhenUnplugged


]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMHighlighterTextRubEditingMode>>withStyler [
	self textArea withDecorator: self stylerDecorator
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMHighlighterTextRubEditingMode>>withoutStyler [
	self textArea withoutDecorator: self stylerDecorator
]
