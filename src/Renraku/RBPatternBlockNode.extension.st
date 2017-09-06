Extension {
	#name : #RBPatternBlockNode
}

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBPatternBlockNode>>pattern [

	^ self source
		copyFrom: self sourceInterval first
		to: self sourceInterval last
]
