Extension {
	#name : #TextLine
}

{
	#category : #'*FreeType-addition',
	#timestamp : ' 8/31/2017 05:26:12'
}
TextLine>>justifiedPadFor: spaceIndex font: aFont [
	"Compute the width of pad for a given space in a line of justified text."

	| pad |
	internalSpaces = 0 ifTrue: [^0].
	^(aFont notNil and:[aFont isSubPixelPositioned])
		ifTrue:[paddingWidth * 1.0 / internalSpaces]
		ifFalse:[
			pad := paddingWidth // internalSpaces.
			spaceIndex <= (paddingWidth \\ internalSpaces)
				ifTrue: [pad + 1]
				ifFalse: [pad]]
		
]
