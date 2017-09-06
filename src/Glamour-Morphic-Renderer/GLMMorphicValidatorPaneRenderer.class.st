"

"
Class {
	#name : #GLMMorphicValidatorPaneRenderer,
	#superclass : #GLMMorphicWidgetRenderer,
	#instVars : [
		'container',
		'paneMorph',
		'buttons'
	],
	#category : #Glamour-Morphic-Renderer,
	#timestamp : ''
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicValidatorPaneRenderer>>actOnMatchingPresentationsChanged: anAnnouncement  [
	paneMorph	removeAllMorphs.
	self renderMorphFor: anAnnouncement pane.
	self renderer window fullBounds
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicValidatorPaneRenderer>>buttonRowFrom: aCollectionOfButtons [
	"Answer a new ok/cancel button row."

	|answer curentButtons e|
	curentButtons := aCollectionOfButtons.
	e := 0@0.
	curentButtons do: [:b | e := e max: b minExtent].
	curentButtons do: [:b | b extent: e].
	answer := Morph new
		color: Color transparent;
		changeTableLayout;
		cellInset: 8;
		listDirection: #leftToRight;
		listCentering: #bottomRight;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap.
	curentButtons do: [:b | answer addMorphBack: b].
	^answer

	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicValidatorPaneRenderer>>buttons [

	^ buttons
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicValidatorPaneRenderer>>buttons: aCollectionOfButtons [

	buttons := aCollectionOfButtons
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicValidatorPaneRenderer>>newColumnWith: aCollectionOfMorphElements [
	"use this method to create a new column in your block"
	<lint: 'Utility methods' rationale: 'defined here to facilate the use of the library' author: 'cyrille.delaunay'>
	
	|answer|
	answer := GLMPanelMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		fillStyle: Color transparent; "non pane color tracking"
		changeTableLayout;
		cellInset: 8; yourself.
	aCollectionOfMorphElements do: [:m | answer addMorphBack: m].
	^answer
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicValidatorPaneRenderer>>render: aPane [
	paneMorph := GLMMorphic containerMorph.
	aPane when: GLMMatchingPresentationsChanged send: #actOnMatchingPresentationsChanged: to: self.
	self renderMorphFor: aPane.
	^ paneMorph
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicValidatorPaneRenderer>>renderCompositiePresentation: aCompositePresentation [
	
	paneMorph := GLMMorphic containerMorph.
	paneMorph
		addMorph: 
			(self newColumnWith:  { (self renderObject: aCompositePresentation).  (self buttonRowFrom: self buttons) }) 
			fullFrame: (LayoutFrame identity);
		"addMorphBack: (self buttonRowFrom: self buttons)  ;  "
		"adoptPaneColor: paneMorph paneColor."
		yourself.
	
	^ paneMorph
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicValidatorPaneRenderer>>renderMorphFor: aPane [

	paneMorph
		addMorph: 
			("self newColumnWith:  {" (self renderObject: aPane presentations)".  (self buttonRowFrom: self buttons) }") 
			fullFrame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 0.90));
		addMorph:  (self buttonRowFrom: self buttons)
			fullFrame: (LayoutFrame fractions: (0 @ 0.93 corner: 1 @ 1));
		"adoptPaneColor: paneMorph paneColor"
		yourself
]
