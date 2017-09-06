Extension {
	#name : #SequenceableCollection
}

{
	#category : #'*Graphics-Display Objects',
	#timestamp : ' 8/31/2017 05:26:09'
}
SequenceableCollection>>asColorArray [
	^ColorArray withAll: self
]
