"

"
Class {
	#name : #GLMMorphicFixedPanesFinderRenderer,
	#superclass : #GLMMorphicFinderRenderer,
	#category : #Glamour-Morphic-Renderer,
	#timestamp : ''
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicFixedPanesFinderRenderer>>actOnPaneAdded: ann [
	container pushPane: (self renderObject: ann pane)
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicFixedPanesFinderRenderer>>actOnPaneRemoved: ann [
	container popPane
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicFixedPanesFinderRenderer>>actOnPaneReplaced: ann [
	container popAndReplacePane: (self renderObject: ann newPane)
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicFixedPanesFinderRenderer>>render: aBrowser [
	container := GLMPaneScroller new
		name: 'scroller';
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		yourself.
	container maxPanes: aBrowser fixedSizePanes.
	self registerAnnouncementsFor: aBrowser.  
	aBrowser panes
		do: [ :each | container pushPane: (self renderObject: each) ].
	^ container
]
