"

"
Class {
	#name : #GLMMorphicVerticallyStackedRenderer,
	#superclass : #GLMMorphicCompositeRenderer,
	#category : #Glamour-Morphic-Renderer,
	#timestamp : ''
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicVerticallyStackedRenderer>>render: aPresentation [
	| presentations container |
	presentations := aPresentation matchingPresentations.
	presentations isEmpty ifTrue: [ ^ GLMMorphic emptyMorph ].	
	container := GLMMorphic containerMorph.
	container changeTableLayout.
	presentations do: [ :each | 
		container addMorphBack: (self renderWithTitle: each) ].
	^ container
]
