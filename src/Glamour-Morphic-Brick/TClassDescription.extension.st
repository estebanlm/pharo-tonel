Extension {
	#name : #TClassDescription
}

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
TClassDescription>>slotsDictionary [
	^ self isTrait 
		ifTrue: [ Dictionary new ]
		ifFalse: [ self layout slotsDictionary ]
]
