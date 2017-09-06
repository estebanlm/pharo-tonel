"
Used to announce the change of a selection in the tree
"
Class {
	#name : #MorphTreeSelectionChanged,
	#superclass : #MorphTreeAnnounce,
	#instVars : [
		'selection'
	],
	#category : #Morphic-Widgets-Tree-Announcements,
	#timestamp : 'TorstenBergmann 9/5/2014 15:25'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeSelectionChanged>>selection [
	^ selection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeSelectionChanged>>selection: aSelection [
	selection := aSelection
]
