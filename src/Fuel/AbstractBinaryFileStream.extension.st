Extension {
	#name : #AbstractBinaryFileStream
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
AbstractBinaryFileStream>>fuelNextWordsInto: aWordObject [
	"This method is the same as nextWordsInto: but the restoreEndianness is only done if needed"
	self next: aWordObject basicSize into: aWordObject.
	^ aWordObject
]
