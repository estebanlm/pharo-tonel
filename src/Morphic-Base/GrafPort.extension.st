Extension {
	#name : #GrafPort
}

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
GrafPort>>displayScannerFor: para foreground: foreColor background: backColor ignoreColorChanges: shadowMode [
	^ (BitBltDisplayScanner new text: para text textStyle: para textStyle
			foreground: foreColor background: backColor fillBlt: self
			ignoreColorChanges: shadowMode)
		setPort: self shallowCopy
]
