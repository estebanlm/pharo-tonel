"

"
Class {
	#name : #GLMPaginatedResizableMorphTreeMorph,
	#superclass : #GLMPaginatedMorphTreeMorph,
	#category : #Glamour-Morphic-Widgets,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPaginatedResizableMorphTreeMorph>>resizeColumns [
	| rowMorphsWidths |
	
	self columns size > 1 ifFalse: [ ^ self ].
	rowMorphsWidths := self rowMorphsWidths.
	self allNodeMorphs do: [ :node |
		node submorphs doWithIndex: [ :each :index | each hResizing: #rigid; width: (rowMorphsWidths at: index) ] ].
	self hHideScrollBar.
]

{
	#category : #events-processing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPaginatedResizableMorphTreeMorph>>toggleExpandedState: aMorph event: event [
	super toggleExpandedState: aMorph event: event.
	self resizeColumns.
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPaginatedResizableMorphTreeMorph>>updateColumnMorphs [
	super updateColumnMorphs.
	self resizeColumns.
		
	
]
