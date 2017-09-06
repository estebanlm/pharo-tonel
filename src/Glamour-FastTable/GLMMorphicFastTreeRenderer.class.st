"
I am a Morphic renderer for a GLMFastTreePresentation.

Description
--------------------

I use a GLMFastTreeDataSource to manage the data of the tree.

"
Class {
	#name : #GLMMorphicFastTreeRenderer,
	#superclass : #GLMMorphicFTRenderer,
	#category : #Glamour-FastTable-Morphic-Renderer,
	#timestamp : 'CyrilFerlicot 11/10/2015 11:40'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicFastTreeRenderer>>createDataSourceFrom: aPresentation [
	^ GLMFastTreeDataSource new
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicFastTreeRenderer>>specificDataSourceInitializiation [
	| presentation |
	super specificDataSourceInitializiation.
	presentation := tableModel glamourPresentation.
	tableModel
		childrenBlock: presentation children;
		maxDepth: presentation maxDepth;
		searchStrategy: presentation strategy
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicFastTreeRenderer>>specificTableMorphInitializiation [
	| presentation |
	super specificTableMorphInitializiation.
	presentation := tableModel glamourPresentation.
	"If needed I extant the tree"
	presentation shouldAllExpand
		ifTrue: [ tableModel expandAll ].
	presentation shouldRootsExpand
		ifTrue: [ tableModel expandRoots ].
	presentation shouldExpandToLevel
		ifTrue: [ tableModel expandAllTo: presentation expandLevel ]
]
