Extension {
	#name : #TraitDescription
}

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
TraitDescription>>slotsDictionary [
	^ self isTrait 
		ifTrue: [ Dictionary new ]
		ifFalse: [ self layout slotsDictionary ]
]
