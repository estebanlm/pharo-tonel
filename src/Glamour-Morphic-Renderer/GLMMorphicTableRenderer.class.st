"

"
Class {
	#name : #GLMMorphicTableRenderer,
	#superclass : #GLMMorphicListingRenderer,
	#category : #Glamour-Morphic-Renderer,
	#timestamp : ''
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicTableRenderer>>render: aPresentation [
	| container |
	container := super render: aPresentation.
	"aPresentation shouldAllExpand ifTrue: [treeMorph expandAll ]."
	aPresentation shouldRootsExpand ifTrue: [treeMorph expandRoots . treeMorph makeLastColumnBounded ].
	"aPresentation shouldExpandToLevel ifTrue: [ treeMorph expandAllTo: aPresentation expandLevel ]."
	^ container
]
