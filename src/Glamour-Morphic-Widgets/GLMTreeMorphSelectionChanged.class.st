"

"
Class {
	#name : #GLMTreeMorphSelectionChanged,
	#superclass : #Announcement,
	#instVars : [
		'selectionValue',
		'selectionPathValue'
	],
	#category : #Glamour-Morphic-Widgets,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTreeMorphSelectionChanged>>selectionPathValue [
	^ selectionPathValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTreeMorphSelectionChanged>>selectionPathValue: anObject [
	selectionPathValue := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTreeMorphSelectionChanged>>selectionValue [
	^ selectionValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMTreeMorphSelectionChanged>>selectionValue: anObject [
	selectionValue := anObject
]
