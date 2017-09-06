Extension {
	#name : #TestCase
}

{
	#category : #'*SUnit-UITesting',
	#timestamp : ' 8/31/2017 05:26:20'
}
TestCase>>simulateKeyStroke: aCharacterOrShortcut [

	ActiveHand simulateKeyStroke: aCharacterOrShortcut.
]

{
	#category : #'*SUnit-UITesting',
	#timestamp : ' 8/31/2017 05:26:20'
}
TestCase>>simulateKeyStrokes: aString  [

	ActiveHand simulateKeyStrokes: aString.
]
