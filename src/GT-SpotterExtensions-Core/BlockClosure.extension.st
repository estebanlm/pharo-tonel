Extension {
	#name : #BlockClosure
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
BlockClosure>>gtSpotterCodePreviewIn: aComposite [
	<spotterPreview: 10>

	^ self sourceNode gtSpotterCodePreviewIn: aComposite
]
