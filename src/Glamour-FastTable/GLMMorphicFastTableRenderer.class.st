"
I am a Morphic renderer for a GLMFastTablePresentation.

Description
--------------------

I use a GLMFastTableDataSource to manage the data of the table.

"
Class {
	#name : #GLMMorphicFastTableRenderer,
	#superclass : #GLMMorphicFTRenderer,
	#category : #Glamour-FastTable-Morphic-Renderer,
	#timestamp : 'CyrilFerlicot 11/10/2015 11:39'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicFastTableRenderer>>createDataSourceFrom: aPresentation [
	^ GLMFastTableDataSource new
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicFastTableRenderer>>specificTableMorphInitializiation [
	"Intialize first the columns and only then do the rest of the initialization."
	self specificTableMorphColumnsInitialization.
	super specificTableMorphInitializiation.
	
]
