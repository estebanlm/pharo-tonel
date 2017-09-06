Extension {
	#name : #MultistateButtonMorph
}

{
	#category : #'*Morphic-Widgets-Windows',
	#timestamp : ' 8/31/2017 05:26:15'
}
MultistateButtonMorph>>activate [
	"Make active."

	super activate.
	self active: true
]

{
	#category : #'*Morphic-Widgets-Windows',
	#timestamp : ' 8/31/2017 05:26:15'
}
MultistateButtonMorph>>passivate [
	"Make passive."

	super passivate.
	self active: false
]
