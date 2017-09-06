Extension {
	#name : #RBRefactoryChange
}

{
	#category : #'*qualityAssistant',
	#timestamp : ' 8/31/2017 05:26:37'
}
RBRefactoryChange>>diffedText [

	^ TextDiffBuilder 
			buildDisplayPatchFrom: self oldVersionTextToDisplay 
			to: self textToDisplay
]
