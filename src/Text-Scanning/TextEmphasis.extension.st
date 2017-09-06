Extension {
	#name : #TextEmphasis
}

{
	#category : #'*Text-Scanning',
	#timestamp : ' 8/31/2017 05:26:17'
}
TextEmphasis>>emphasizeScanner: scanner [
	"Set the emphasist for text scanning"
	scanner addEmphasis: emphasisCode
]
