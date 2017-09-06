Extension {
	#name : #SimpleBorder
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
SimpleBorder>>asAthensPaintOn: anAthensCanvas [
	^ self topLeftColor = self bottomRightColor
		ifTrue: [ super asAthensPaintOn: anAthensCanvas ]
		ifFalse: [ self asTwoColorStrokePaintOn: anAthensCanvas ]
]

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
SimpleBorder>>asTwoColorStrokePaintOn: anAthensCanvas [
	^ AthensBorderStrokePaint
		topLeftColor: self topLeftColor
		bottomRightColor: self bottomRightColor
		width: self width
		on: anAthensCanvas
]
