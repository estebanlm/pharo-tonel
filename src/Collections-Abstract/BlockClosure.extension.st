Extension {
	#name : #BlockClosure
}

{
	#category : #'*Collections-Abstract-splitjoin',
	#timestamp : ' 8/31/2017 07:16:43'
}
BlockClosure>>split: aSequenceableCollection indicesDo: aBlock [
	"Example:
		[ :char| char isSeparator ] split: 'aa bb cc dd'"
	
	| position |
	
	position := 1.
	
	aSequenceableCollection withIndexDo: [:element :idx |
		(self value: element) 
			ifTrue: [
				aBlock value: position value: idx - 1.
				position := idx + 1 ]].
		
	aBlock value: position value: aSequenceableCollection size
]
