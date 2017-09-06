Extension {
	#name : #StandardFileStream
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
StandardFileStream>>fuelNextWordsInto: aWordObject [
	"This method is the same as nextWordsInto: but the restoreEndianness is only done if needed"
	self next: aWordObject basicSize into: aWordObject startingAt: 1.
	^ aWordObject
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
StandardFileStream>>nextBytesPutAll: aCollection [
	self nextPutAll: aCollection
]
