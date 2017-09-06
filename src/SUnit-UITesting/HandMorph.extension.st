Extension {
	#name : #HandMorph
}

{
	#category : #'*SUnit-UITesting',
	#timestamp : ' 8/31/2017 05:26:20'
}
HandMorph>>simulateKeyStroke: aCharacterOrShortcut [

	| shortcut |
	shortcut := aCharacterOrShortcut asKeyCombination.
	self handleEvent: (KeyboardEvent new
		setType: #keystroke
		buttons: shortcut modifier eventCode
		position: self position 
		keyValue: shortcut key asciiValue
		charCode: shortcut key asciiValue
		hand: self activeHand 
		stamp: DateAndTime now).
]
