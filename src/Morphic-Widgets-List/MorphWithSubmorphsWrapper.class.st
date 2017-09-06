"
Display a morph in a SimpleHierarchicalListMorph, and arrange to recursively display the morph's submorphs.  The ""item"" that is wrapped is the morph to display.
"
Class {
	#name : #MorphWithSubmorphsWrapper,
	#superclass : #ListItemWrapper,
	#category : #Morphic-Widgets-List,
	#timestamp : 'ls 3/1/2004 17:32'
}

{
	#category : #hierarchy,
	#timestamp : ' 8/31/2017 05:26:14'
}
MorphWithSubmorphsWrapper>>contents [
	^item submorphs collect: [ :m |
		self class with: m ]
]
