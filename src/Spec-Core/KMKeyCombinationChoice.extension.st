Extension {
	#name : #KMKeyCombinationChoice
}

{
	#category : #'*Spec-Core',
	#timestamp : ' 8/31/2017 05:26:18'
}
KMKeyCombinationChoice>>currentCharacter [
	| candidates |
	
	candidates := shortcuts 
		collect: [ :each | each currentCharacter ] 
		thenSelect: [ :each | each isNotNil ].
		
	^ candidates 
		ifEmpty: [ nil ]
		ifNotEmpty: [ candidates first ]
]
