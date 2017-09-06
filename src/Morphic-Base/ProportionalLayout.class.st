"
I represent a layout that places all children of some morph in their given LayoutFrame.
"
Class {
	#name : #ProportionalLayout,
	#superclass : #LayoutPolicy,
	#category : #Morphic-Base-Layouts,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:13'
}
ProportionalLayout>>isProportionalLayout [
	^true
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:13'
}
ProportionalLayout>>layout: aMorph in: newBounds [
	"Compute the layout for the given morph based on the new bounds"
	aMorph submorphsDo:[:m| m layoutProportionallyIn: newBounds].
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:13'
}
ProportionalLayout>>minExtentOf: aMorph in: newBounds [
	"Return the minimal size aMorph's children would require given the new bounds"
	| min |
	min := 0@0.
	aMorph submorphsDo:[:m| | extent frame |
		"Map the minimal size of the child through the layout frame.
		Note: This is done here and not in the child because its specific
		for proportional layouts. Perhaps we'll generalize this for table
		layouts but I'm not sure how and when."
		extent := m minExtent.
		frame := m layoutFrame.
		frame ifNotNil:[extent := frame minExtentFrom: extent].
		min := min max: extent].
	^min
]
