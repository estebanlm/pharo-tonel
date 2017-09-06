Extension {
	#name : #ClassDescription
}

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
ClassDescription>>slotsDictionary [
	^ self isTrait 
		ifTrue: [ Dictionary new ]
		ifFalse: [ self layout slotsDictionary ]
]
