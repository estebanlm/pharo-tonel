"

"
Class {
	#name : #GLMMorphicTreeRenderer,
	#superclass : #GLMMorphicListingRenderer,
	#category : #Glamour-Morphic-Renderer,
	#timestamp : ''
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicTreeRenderer>>render: aPresentation [
	| container |
	container := super render: aPresentation.
	aPresentation shouldAllExpand ifTrue: [treeMorph expandAll ].
	aPresentation shouldRootsExpand ifTrue: [treeMorph expandRoots ].
	aPresentation shouldExpandToLevel ifTrue: [ treeMorph expandAllTo: aPresentation expandLevel ].
	^ container
]
