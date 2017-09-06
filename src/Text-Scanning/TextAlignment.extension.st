Extension {
	#name : #TextAlignment
}

{
	#category : #'*Text-Scanning',
	#timestamp : ' 8/31/2017 05:26:17'
}
TextAlignment>>emphasizeScanner: scanner [
	"Set the emphasist for text scanning"
	scanner setAlignment: alignment.
]
