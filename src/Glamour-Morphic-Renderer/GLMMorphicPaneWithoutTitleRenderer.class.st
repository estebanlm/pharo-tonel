"

"
Class {
	#name : #GLMMorphicPaneWithoutTitleRenderer,
	#superclass : #GLMMorphicWidgetRenderer,
	#instVars : [
		'container',
		'paneMorph'
	],
	#category : #Glamour-Morphic-Renderer,
	#timestamp : ''
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicPaneWithoutTitleRenderer>>actOnMatchingPresentationsChanged: anAnnouncement  [
	paneMorph	removeAllMorphs.
	self renderMorphFor: anAnnouncement pane.
	self renderer window fullBounds
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicPaneWithoutTitleRenderer>>render: aPane [
	paneMorph := GLMMorphic containerMorph.
	aPane when: GLMMatchingPresentationsChanged send: #actOnMatchingPresentationsChanged: to: self.
	self renderMorphFor: aPane.
	^ paneMorph
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicPaneWithoutTitleRenderer>>renderMorphFor: aPane [
	paneMorph
		addMorph: (self renderObject: aPane presentations) fullFrame: (LayoutFrame identity);
		"adoptPaneColor: paneMorph paneColor"
		yourself
]
