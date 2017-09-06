Extension {
	#name : #TextFontReference
}

{
	#category : #'*Text-Scanning',
	#timestamp : ' 8/31/2017 05:26:17'
}
TextFontReference>>emphasizeScanner: scanner [
	"Set the actual font for text display"
	scanner setActualFont: font
]
