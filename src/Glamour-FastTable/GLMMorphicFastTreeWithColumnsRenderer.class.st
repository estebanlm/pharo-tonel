"
I am a Morphic renderer for a GLMFastTreeTablePresentation. My main responsability is  to configure the table specific aspects of the presentation (columns, insets) and delegate to the appropriate data source.

Description
--------------------

I use a GLMFastTreeTableDataSource to manage the data of the tree with columns.
I will configure the renderer and the data source  based on a GLMFastTreeTablePresentation.

"
Class {
	#name : #GLMMorphicFastTreeWithColumnsRenderer,
	#superclass : #GLMMorphicFastTreeRenderer,
	#category : #Glamour-FastTable-Morphic-Renderer,
	#timestamp : 'AndreiChis 2/6/2017 14:17'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicFastTreeWithColumnsRenderer>>createDataSourceFrom: aPresentation [
	^ GLMFastTreeTableDataSource new
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicFastTreeWithColumnsRenderer>>specificTableMorphInitializiation [
	self specificTableMorphColumnsInitialization.
	super specificTableMorphInitializiation.
	

]
