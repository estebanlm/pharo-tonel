Extension {
	#name : #TextAction
}

{
	#category : #'*Text-Scanning',
	#timestamp : ' 8/31/2017 05:26:17'
}
TextAction>>emphasizeScanner: scanner [
	"Set the emphasis for text display"
	scanner textColor: Color purple
]
