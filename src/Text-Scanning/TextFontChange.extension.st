Extension {
	#name : #TextFontChange
}

{
	#category : #'*Text-Scanning',
	#timestamp : ' 8/31/2017 05:26:17'
}
TextFontChange>>emphasizeScanner: scanner [
	"Set the font for text display"
	scanner setFont: fontNumber
]
