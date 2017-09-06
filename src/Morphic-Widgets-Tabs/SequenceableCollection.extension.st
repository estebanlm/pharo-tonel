Extension {
	#name : #SequenceableCollection
}

{
	#category : #'*Morphic-Widgets-Tabs',
	#timestamp : ' 8/31/2017 05:26:14'
}
SequenceableCollection>>max: aBlock [
	| max |
	self ifEmpty: [ ^ nil ].
	max := aBlock value: self first.
	self
		allButFirstDo:
			[ :each | 
			| value |
			value := aBlock value: each.
			max := max max: value ].
	^ max
]
