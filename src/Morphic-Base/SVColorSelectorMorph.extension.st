Extension {
	#name : #SVColorSelectorMorph
}

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
SVColorSelectorMorph>>borderWidth: anInteger [
	"Update the gradients after setting."
	
	super borderWidth: anInteger.
	self updateGradients
]
