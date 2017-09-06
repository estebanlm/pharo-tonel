Extension {
	#name : #Object
}

{
	#category : #'*Morphic-Widgets-Basic',
	#timestamp : ' 8/31/2017 05:26:14'
}
Object>>acceptDroppingMorph: transferMorph event: evt inMorph: dstListMorph  [
	
	^false.
]

{
	#category : #'*Morphic-Widgets-Basic',
	#timestamp : ' 8/31/2017 05:26:14'
}
Object>>dragPassengerFor: item inMorph: dragSource  [
	^item
]

{
	#category : #'*Morphic-Widgets-Basic',
	#timestamp : ' 8/31/2017 05:26:14'
}
Object>>dragTransferType [
	^nil
]

{
	#category : #'*Morphic-Widgets-Basic',
	#timestamp : ' 8/31/2017 05:26:14'
}
Object>>dragTransferTypeForMorph: dragSource  [
	^nil
]

{
	#category : #'*Morphic-Widgets-Basic',
	#timestamp : ' 8/31/2017 05:26:14'
}
Object>>wantsDroppedMorph: aMorph event: anEvent inMorph: destinationLM  [
	^false 
]
