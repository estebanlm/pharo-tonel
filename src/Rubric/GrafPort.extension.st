Extension {
	#name : #GrafPort
}

{
	#category : #'*Rubric-Editing-Core',
	#timestamp : ' 8/31/2017 05:26:20'
}
GrafPort>>rubDisplayScannerFor: para foreground: foreColor background: backColor ignoreColorChanges: shadowMode [
	^ (RubDisplayScanner new text: para text textStyle: para textStyle
			foreground: foreColor background: backColor fillBlt: self
			ignoreColorChanges: shadowMode)
		setPort: self shallowCopy
]
