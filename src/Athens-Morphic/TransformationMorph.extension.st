Extension {
	#name : #TransformationMorph
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
TransformationMorph>>drawOnAthensCanvas: anAthensCanvas [
	submorphs isEmpty ifTrue: [super drawOnAthensCanvas: anAthensCanvas]
]
