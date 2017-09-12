Extension { #name : #KeyboardEvent }

{ #category : #'*Keymapping-KeyCombinations' }
KeyboardEvent >> asKeyCombination [
	^ KMKeyCombination fromKeyboardEvent: self
]

{ #category : #'*Keymapping-KeyCombinations' }
KeyboardEvent >> asShortcut [
	^ self asKeyCombination
]

{ #category : #'*Keymapping-KeyCombinations' }
KeyboardEvent >> modifiedCharacter [
    self flag: #hack.
    "Hack me.  When Ctrl is pressed, the key ascii value is not right and we have to do something ugly"
    ^(self hasSpecialCTRLKeyValue and: [ (#(MacOSX Windows) includes: Smalltalk os current platformFamily) ])
        ifTrue: [ (self keyValue + $a asciiValue - 1) asCharacter ]    
        ifFalse: [ self keyCharacter ]
]
