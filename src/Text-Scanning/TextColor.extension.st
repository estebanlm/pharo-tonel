Extension {
	#name : #TextColor
}

{
	#category : #'*Text-Scanning',
	#timestamp : ' 8/31/2017 05:26:17'
}
TextColor>>emphasizeScanner: scanner [
	"Set the emphasis for text display"
	scanner textColor: color
]
