"
I provide support for displaying snippets of Smalltalk code  (e.g. dealing with variable binding)

"
Class {
	#name : #GLMPharoScriptPresentation,
	#superclass : #GLMRubricSmalltalkCodePresentation,
	#category : #Glamour-Rubric-Presentations,
	#timestamp : 'AndreiChis 10/30/2015 14:16'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPharoScriptPresentation class>>pharoScriptPresentationExample [
	"
	self pharoScriptPresentationExample
	"
	| browser |
	browser := GLMTabulator new.
	browser
		row: #r1;
		row: #r2.
	browser transmit
		to: #r1;
		andShow: [ :aComposite | 
					aComposite pharoScript
						selectionAct: [ :workspace :page | workspace evaluateSelection ] on: $d entitled: 'Do it';
						selectionAct: [ :workspace :page | workspace evaluateSelectionAndDo: [ :result | result inspect ] ]
							on: $i
							entitled: 'Inspect it';
						selectionAct: [ :workspace :page | workspace evaluateSelectionAndDo: [ :result | result explore ] ]
							on: $e
							entitled: 'Explore it' ].
	browser transmit
		to: #r2;
		andShow: [ :aComposite | 
					aComposite pharoScript
						variableBindings: [ 
							{(#browser -> browser).
							(#a -> 1)} ] ].
	browser
		openOn:
			'browser := GLMTabulator new.
browser row: #r1; row: #r2.

browser transmit to: #r1; andShow: [ :aComposite |
	aComposite pharoPlayground].
browser openOn:''self halt'' '
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPharoScriptPresentation>>currentBindings [

	self withBindingsDo: [ :bingings | ^ bingings copy ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPharoScriptPresentation>>defaultSelectionActions [

	^ {self goAction}, super defaultSelectionActions
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPharoScriptPresentation>>goAction [
	^ GLMGenericAction new
				title: 'Do it and go';
				action: [ :t :entity |
					t highlightEvaluateAndDo: [ :result | t selection: result ] ]; 
				shortcut: $g; 
				yourself.
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPharoScriptPresentation>>renderGlamorouslyOn: aRenderer  [
	self registerAnnouncements.
	^ aRenderer renderPharoScriptPresentation: self
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPharoScriptPresentation>>resetBindings [

	self withBindingsDo: [ :bindings | bindings removeAll ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPharoScriptPresentation>>updateVariableBindings [

	self announce: (GLMVariableBindingsChanged new presentation: self).
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPharoScriptPresentation>>withBindingsDo: aBlock [

	self announce: (GLMVariableBindingsAccessRequest new action: aBlock)
]
