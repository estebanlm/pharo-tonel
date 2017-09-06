Extension {
	#name : #SequenceableCollection
}

{
	#category : #'*Balloon',
	#timestamp : ' 8/31/2017 05:26:11'
}
SequenceableCollection>>asPointArray [
	"Answer an PointArray whose elements are the elements of the receiver, in 
	the same order."

	| pointArray |
	pointArray := PointArray new: self size.
	1 to: self size do:[:i| pointArray at: i put: (self at: i)].
	^pointArray
]
