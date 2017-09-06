Extension {
	#name : #LayoutClassScope
}

{
	#category : #'*Glamour-Morphic-Brick',
	#timestamp : ' 8/31/2017 05:26:34'
}
LayoutClassScope>>slotsDictionary [
	| result |
	result := Dictionary new.
	self allSlotsDo: [ :slot |  result at: slot name put: slot].
	^ result
]
