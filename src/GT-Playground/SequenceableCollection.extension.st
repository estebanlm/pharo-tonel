Extension {
	#name : #SequenceableCollection
}

{
	#category : #'*GT-Playground',
	#timestamp : ' 8/31/2017 05:26:36'
}
SequenceableCollection>>takeFirst: anInteger [
	^ self first: (self size min: anInteger)
]
