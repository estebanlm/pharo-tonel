Extension {
	#name : #TextKern
}

{
	#category : #'*Text-Scanning',
	#timestamp : ' 8/31/2017 05:26:17'
}
TextKern>>emphasizeScanner: scanner [
	"Augment (or diminish) the kerning offset for text display"
	scanner addKern: kern
]
