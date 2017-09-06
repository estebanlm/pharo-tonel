Extension {
	#name : #Symbol
}

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
Symbol>>brickValue: aBrick [

	^ self cull: aBrick
]

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
Symbol>>brickValue: anObject withEnoughArguments: aCollection [

	^ anObject perform: self withEnoughArguments: aCollection
]

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
Symbol>>phlowValue: anObject [

	^ self cull: anObject
]

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
Symbol>>phlowValue: anObject value: otherObject [

	^ anObject perform: self withEnoughArguments: { otherObject }
]

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
Symbol>>phlowValue: anObject withEnoughArguments: aCollection [

	^ anObject perform: self withEnoughArguments: aCollection
]
