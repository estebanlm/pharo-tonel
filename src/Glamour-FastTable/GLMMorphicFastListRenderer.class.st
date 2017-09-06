"
I am a Morphic renderer for a GLMFastListPresentation.

Description
--------------------

I use a GLMFastListDataSource to manage the data of the table.

"
Class {
	#name : #GLMMorphicFastListRenderer,
	#superclass : #GLMMorphicFTRenderer,
	#category : #Glamour-FastTable-Morphic-Renderer,
	#timestamp : 'CyrilFerlicot 11/10/2015 11:39'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicFastListRenderer>>createDataSourceFrom: aPresentation [
	^ aPresentation allowSeparators
		ifTrue: [ GLMFastListOutlineDataSource new ]
		ifFalse: [ GLMFastListDataSource new ]
]
