"
A CircleMorphTest is a subclass of MorphTest.  It was first implemented when removing some unused and broken functionality.

My fixtures are morph, a CircleMorph and world.

"
Class {
	#name : #CircleMorphTest,
	#superclass : #MorphTest,
	#category : #Morphic-Tests-Basic,
	#timestamp : 'tlk 5/21/2006 14:16'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
CircleMorphTest>>setUp [
	morph := CircleMorph new
]
