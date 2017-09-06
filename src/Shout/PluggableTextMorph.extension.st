Extension {
	#name : #PluggableTextMorph
}

{
	#category : #'*Shout',
	#timestamp : ' 8/31/2017 05:26:28'
}
PluggableTextMorph>>stylerStyled: styledCopyOfText  [

	textMorph contents runs: styledCopyOfText runs.
	textMorph updateFromParagraph.
	selectionInterval
		ifNotNil: [textMorph editor selectInvisiblyFrom: selectionInterval first to: selectionInterval last;
				 storeSelectionInParagraph;
				 setEmphasisHere].
	textMorph editor blinkParen.
	self scrollSelectionIntoView
]

{
	#category : #'*Shout',
	#timestamp : ' 8/31/2017 05:26:28'
}
PluggableTextMorph>>stylerStyledInBackground: styledCopyOfText  [
	textMorph contents string = styledCopyOfText string
		ifTrue: [self stylerStyled: styledCopyOfText]
]
