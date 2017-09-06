Extension {
	#name : #Number
}

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
Number>>defaultLabel [
	"Answer the default label to be used for an Inspector window on the receiver."

	^ super defaultLabel, ': ', self printString
]
