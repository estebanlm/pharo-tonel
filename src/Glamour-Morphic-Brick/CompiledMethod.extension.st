Extension {
	#name : #CompiledMethod
}

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
CompiledMethod>>brickValue: anObject withEnoughArguments: aCollection [

	^ anObject withArgs: aCollection executeMethod: self
]

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
CompiledMethod>>phlowValue: anObject withEnoughArguments: aCollection [

	^ anObject withArgs: aCollection executeMethod: self
]
