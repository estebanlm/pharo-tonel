Extension {
	#name : #GLMAction
}

{
	#category : #'*glamour-morphic-renderer',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMAction>>installKeyCombinationForPresentation: aPresentation onMorph: aMorph [
	aMorph 
		bindKeyCombination: self keymap		
		toAction: [ self actOn: aPresentation ].
	
]

{
	#category : #'*glamour-morphic-renderer',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMAction>>morphicActOn: aPresentation [

	^ self actOn: aPresentation
]
