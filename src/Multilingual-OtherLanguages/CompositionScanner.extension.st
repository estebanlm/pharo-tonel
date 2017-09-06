Extension {
	#name : #CompositionScanner
}

{
	#category : #'*Multilingual-OtherLanguages',
	#timestamp : ' 8/31/2017 05:26:15'
}
CompositionScanner>>registerBreakableIndex [
	"Record left x and character index of the line-wrappable point. 
	Used for wrap-around in eastern Asian languages."

	spaceX := destX.
	lineHeightAtSpace := lineHeight.
	baselineAtSpace := baseline.
	spaceIndex := lastIndex.
	lastBreakIsNotASpace := true.
]
