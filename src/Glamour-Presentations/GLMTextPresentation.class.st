"
A presentation displaying text.

Instance Variables:
	selectedTextBlock	<ProtoObject>
	highlightSmalltalk	<Boolean>
	highlightSmalltalkContext	<Object>
	textBlock	<ProtoObject | PseudoContext>
"
Class {
	#name : #GLMTextPresentation,
	#superclass : #GLMTextualPresentation,
	#instVars : [
		'highlightSmalltalk',
		'highlightSmalltalkContext'
	],
	#category : #Glamour-Presentations,
	#timestamp : 'TudorGirba 3/5/2011 21:22'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextPresentation>>forSmalltalk [
	highlightSmalltalk := true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextPresentation>>forSmalltalk: aBlock [
	"aBlock takes as parameters the entity objects and 
	its evaluation is expected to produce a Smalltalk class"
	highlightSmalltalk := true.
	highlightSmalltalkContext := aBlock.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextPresentation>>highlightSmalltalk [
	^ highlightSmalltalk ifNil: [highlightSmalltalk := false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextPresentation>>highlightSmalltalkContext [
	^ highlightSmalltalkContext isNil 
		ifTrue: [nil] 
		ifFalse: [highlightSmalltalkContext glamourValue: self entity]
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTextPresentation>>renderGlamorouslyOn: aRenderer  [
	self deprecated:  'Use GLMRubricTextPresentation instead.'.
	self registerAnnouncements.
	^ aRenderer renderTextPresentation: self
]
