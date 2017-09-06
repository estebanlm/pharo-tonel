"
I am a Glamour renderer that uses morphic in a external window.
"
Class {
	#name : #GLMOSWindowMorphWorldRenderer,
	#superclass : #GLMMorphicWidgetRenderer,
	#instVars : [
		'window'
	],
	#category : #OSWindow-Core-Morphic,
	#timestamp : 'RonieSalgado 9/9/2016 18:04'
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
GLMOSWindowMorphWorldRenderer>>actOnPresentationUpdated: ann [
		self setLabelOf: window for: ann presentation
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
GLMOSWindowMorphWorldRenderer>>handlePotentialStatusbarFor: aRenderable [
	| statusbarMorph bottomOffset |
	bottomOffset := 0.
	aRenderable hasStatusbar
		ifTrue: [ 
			statusbarMorph := GLMMorphicPaneWithoutTitleRenderer render: aRenderable statusbarPane from: self renderer.
			bottomOffset := (0 - (LabelMorph contents: 'XXX') minHeight) * 1.2.
			window
				addMorph: statusbarMorph
				fullFrame: (LayoutFrame fractions: (0 @ 1 corner: 1 @ 1) offsets: (2 @ bottomOffset corner: -2 @ 0)) ].
	^ bottomOffset
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
GLMOSWindowMorphWorldRenderer>>render: aRenderable [
	| dock offset bottomOffset |
	window := GLMOSWindowWorldMorph new model: aRenderable.
	self installActionsOnModel: window fromPresentation: aRenderable.
	self installKeystrokeActionsOnMorph: window fromPresentation: aRenderable.
	self setLabelOf: window for: aRenderable.
	offset := 4.
	bottomOffset := 0.
	dock := self renderToolbarForPresentation: aRenderable inMorph: window.
	dock hResizing: #shrinkWrap.
	window toolbarBox: dock.
	bottomOffset := self handlePotentialStatusbarFor: aRenderable.
	window
		addMorph: (self renderObject: aRenderable)
		fullFrame: ((0 @ 0 corner: 1 @ 1) asLayoutFrame 
						topLeftOffset: 0 @ offset ; 
						bottomRightOffset: 0@ bottomOffset).
	self setPotentialBackgroundColorFor: aRenderable.
	aRenderable when: GLMPresentationUpdated send: #actOnPresentationUpdated: to: self.
	aRenderable when: GLMWindowRequest send: #actOnWindowRequest: to: window.
	aRenderable watcherPane notNil
		ifTrue: [ GLMMorphicWatcherRenderer render: aRenderable watcherPane from: self renderer ].
	^ window
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
GLMOSWindowMorphWorldRenderer>>setLabelOf: aWindow for: aRenderable [
	"aWindow title: (self titleFor: aRenderable)."
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
GLMOSWindowMorphWorldRenderer>>setPotentialBackgroundColorFor: aRenderable [
	aRenderable colorValue ifNotNil: [ window borderColor: aRenderable colorValue ]
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:40'
}
GLMOSWindowMorphWorldRenderer>>titleFor: aRenderable [
	^ aRenderable titleValue ifNil: [ 'Glamorous Browser' ]
]
