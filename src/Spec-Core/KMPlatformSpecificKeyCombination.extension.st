Extension {
	#name : #KMPlatformSpecificKeyCombination
}

{
	#category : #'*Spec-Core',
	#timestamp : ' 8/31/2017 05:26:18'
}
KMPlatformSpecificKeyCombination>>currentCharacter [

	^ (self platform = #all or: [ self platform = OSPlatform current platformFamily ])
		ifTrue: [ self shortcut currentCharacter ]
		ifFalse: [ nil ]
]
