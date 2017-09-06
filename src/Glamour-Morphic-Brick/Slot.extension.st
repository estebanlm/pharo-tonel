Extension {
	#name : #Slot
}

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
Slot>>phlowValue: anObject [
	
	^ anObject
]

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
Slot>>phlowValue: anObject value: otherObject [
	
	^ self write: otherObject to: anObject
]
