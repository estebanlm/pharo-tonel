Extension {
	#name : #BlockClosure
}

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
BlockClosure>>brickValue: aBrick [

	^ self cull: aBrick
]

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
BlockClosure>>brickValue: anObject withEnoughArguments: aCollection [

	^ self valueWithEnoughArguments:  { anObject }, aCollection
]

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
BlockClosure>>phlowValue: anObject [

	^ self cull: anObject
]

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
BlockClosure>>phlowValue: anObject value: otherObject [

	^ self cull: anObject cull: otherObject
]

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
BlockClosure>>phlowValue: anObject withEnoughArguments: aCollection [

	^ self valueWithEnoughArguments:  aCollection
]
