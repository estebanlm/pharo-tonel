"
I'm a model datasource to add columns support to a tree presentation.

Description 
--------------------

My superclass models a tree. I override  #cellColumn:row: to return a row that contains multiple columns.

I work with a GLMFastTreeTablePresentation and a GLMMorphicFastTreeWithColumnsRenderer.  I rely on TGLMFastTableColumnsRenderer for the logic that actually builds the row morphs. 

Internal Representation and Key Implementation Points.
--------------------

- #rowMorphElementsForFirstColumn:item:in:    I configure the first column with the propper indentation and buttons for expanding collapsing the node.
- #dataFromPresentationItem:                                     I return the data from the given item

    Instance Variables
	columnToSortBy		This is the column to use for sorting the displayed elements


"
Class {
	#name : #GLMFastTreeTableDataSource,
	#superclass : #GLMFastTreeDataSource,
	#traits : 'TGLMFastTableColumnsRenderer',
	#classTraits : 'TGLMFastTableColumnsRenderer classTrait',
	#instVars : [
		'columnToSortBy'
	],
	#category : #Glamour-FastTable-Model,
	#timestamp : 'AndreiChis 2/6/2017 14:44'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeTableDataSource>>actionColumn: column [
	"If columns has actions associated, execute them"
	column execute.
	self tableRefresh
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeTableDataSource>>dataFromPresentationItem: anItem [
	^ anItem data
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeTableDataSource>>headerColumn: column [
	column id ifNil: [ ^ nil ].
	^ SimpleButtonMorph new
		layoutPolicy: RowLayout new; 
		listDirection: #leftToRight; 
		wrapCentering: #center;
		cellInset: 5@0;
		layoutInset: 5@0;
		label: column id;
		target: self;
		actionSelector: #actionColumn:;
		arguments: {column};
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeTableDataSource>>rowMorphElementsForFirstColumn: aColumn item: anItem in: rowElements [

	anItem depth timesRepeat: [ rowElements add: self class emptyMorph ].
	rowElements add: (self buttonFor: anItem).
	(self iconFor: anItem data) ifNotNil: [ :icon | rowElements add: icon asMorph ].
]

{
	#category : #sorting,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeTableDataSource>>sortBlock [
	^  columnToSortBy sortBlock ifNil: [ |defaultSortBlock|
			defaultSortBlock := columnToSortBy defaultSortBlockForPresentation: self glamourPresentation.
		 	[ :x :y | defaultSortBlock value: x data value: y data ] ]
]

{
	#category : #sorting,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMFastTreeTableDataSource>>sortByColumn: aGlamourColumn [
	columnToSortBy := (columnToSortBy == aGlamourColumn 
		ifTrue: [ nil ]
		ifFalse: [ aGlamourColumn ]).
		
	columnToSortBy 
		ifNotNil: [ self rootItem children: (self rootItem children sorted: self sortBlock) ]
		ifNil: [ self rootItem data: self basicRoots ].

	self glamourPresentation changed.
]
