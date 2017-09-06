Extension {
	#name : #AColorSelectorMorph
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
AColorSelectorMorph>>drawOnAthensCanvas: anAthensCanvas [
	anAthensCanvas setPaint: (InfiniteForm with: self hatchForm).
	anAthensCanvas drawShape: self innerBounds.
	super drawOnAthensCanvas: anAthensCanvas
]
