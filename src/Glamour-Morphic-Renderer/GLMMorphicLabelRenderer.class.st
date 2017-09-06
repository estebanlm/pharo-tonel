"

"
Class {
	#name : #GLMMorphicLabelRenderer,
	#superclass : #GLMMorphicWidgetRenderer,
	#instVars : [
		'labelMorph'
	],
	#category : #Glamour-Morphic-Renderer,
	#timestamp : ''
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicLabelRenderer>>actOnPresentationUpdated: anAnnouncement [
	labelMorph contents: anAnnouncement presentation formatedDisplayValue
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicLabelRenderer>>render: aLabelPresentation [
	labelMorph := (LabelMorph contents: aLabelPresentation formatedDisplayValue)
		layoutFrame: (LayoutFrame identity);
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		font: StandardFonts haloFont;
		yourself.
	aLabelPresentation when: GLMPresentationUpdated send: #actOnPresentationUpdated: to: self.
	^ labelMorph
]
