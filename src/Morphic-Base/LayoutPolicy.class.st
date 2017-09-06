"
A LayoutPolicy defines how submorphs of some morph should be arranged. Subclasses of the receiver define concrete layout policies.
"
Class {
	#name : #LayoutPolicy,
	#superclass : #Object,
	#category : #Morphic-Base-Layouts,
	#timestamp : '<historical>'
}

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutPolicy>>flushLayoutCache [
	"Flush any cached information associated with the receiver"
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutPolicy>>indexForInserting: aMorph at: aPoint in: someMorph [
	"Return the insertion index based on the layout strategy defined for some morph. Used for drop insertion."
	^1 "front-most"
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutPolicy>>isProportionalLayout [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutPolicy>>isTableLayout [
	^false
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutPolicy>>layout: aMorph in: newBounds [
	"Compute the layout for the given morph based on the new bounds"

]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:13'
}
LayoutPolicy>>minExtentOf: aMorph in: newBounds [
	"Return the minimal size aMorph's children would require given the new bounds"
	^0@0
]
