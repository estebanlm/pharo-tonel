Extension {
	#name : #MorphicEvent
}

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
MorphicEvent>>withHandPositionDo: aBlock [
	"Compatibility method to make Spotter work with Bloc."
	aBlock value: self position
]
