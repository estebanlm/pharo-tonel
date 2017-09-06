"

"
Class {
	#name : #GLMRubTextScrollPane,
	#superclass : #RubTextScrollPane,
	#category : #Glamour-Morphic-Brick-Morphic,
	#timestamp : ''
}

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubTextScrollPane>>drawKeyboardFocusOn: aCanvas [
	"empty to remove focus border"
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubTextScrollPane>>drawKeyboardFocusOnAthensCanvas: aCanvas [
	"empty to remove focus border"
]

{
	#category : #scrollbars,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubTextScrollPane>>hScrollbarInterval [
	"Answer the computed size of the thumb of the horizontal scrollbar."
	self scrollTarget width = 0 ifTrue: [ ^ 0 ].
	^ self scrollBounds width asFloat / self scrollTarget width min: 1.0.
]
