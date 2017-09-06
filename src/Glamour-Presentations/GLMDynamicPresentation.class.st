"
A GLMDynamicPresentation is a presentation that takes the actual presentation from the display value. Like this, we can have the block of display return a presentation depending on the input.

A usage for this behavior is the Glamorous Editor, which takes the text as input and based on this it displays the browser.
"
Class {
	#name : #GLMDynamicPresentation,
	#superclass : #GLMPresentation,
	#instVars : [
		'presentationTransformation',
		'cachedPresentation'
	],
	#category : #Glamour-Presentations,
	#timestamp : 'tg 9/20/2009 14:25'
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDynamicPresentation>>cachedPresentation [
	"currentPresentation applies the transformation dynamically.
	This means that calling it twice, will retrieve two different objects.
	To solve the problem, cachedPresentation stores the last currentPresentation, and 
	it can be used for further inspection"
	^ cachedPresentation
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDynamicPresentation>>currentPresentation  [
	| composite |
	composite := GLMCompositePresentation new.
	self presentationTransformation glamourValue: (
			composite asGlamorousMultiValue, 
			self displayValue asGlamorousMultiValue).
	composite pane: self pane.
	composite initializePresentation.
	cachedPresentation := composite.
	^ composite
"	^ self displayValue pane: self pane"
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDynamicPresentation>>initialize  [
	super initialize.
	presentationTransformation := [ :aComposite :each | aComposite custom: each ]
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDynamicPresentation>>outerPortEvent: aPortEvent [
	
	super outerPortEvent: aPortEvent.
	"Propage the event to cached presentations"
	self cachedPresentation ifNotNil: [ 
		self cachedPresentation outerPortEvent: aPortEvent ] 
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDynamicPresentation>>presentation: aBlock [
	self presentationTransformation: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDynamicPresentation>>presentationTransformation [
	^ presentationTransformation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDynamicPresentation>>presentationTransformation: anObject [
	presentationTransformation := anObject
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDynamicPresentation>>renderGlamorouslyOn: aRenderer  [
	self registerAnnouncements.
	^ aRenderer renderDynamicPresentation: self
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDynamicPresentation>>updateToolbar [
	super updateToolbar.
	cachedPresentation ifNotNil: [ 
		cachedPresentation updateToolbar.
		cachedPresentation presentations do: #updateToolbar ]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDynamicPresentation>>with: aBlock [
	self presentationTransformation: aBlock
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDynamicPresentation>>withAllPanesAndPresentationsDo: aBlock [
	super withAllPanesAndPresentationsDo: aBlock.
	self cachedPresentation ifNotNil: [ :presentation | presentation withAllPanesAndPresentationsDo: aBlock ]
]
