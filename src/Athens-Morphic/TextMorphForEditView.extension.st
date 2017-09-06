Extension {
	#name : #TextMorphForEditView
}

{
	#category : #'*Athens-Morphic',
	#timestamp : ' 8/31/2017 05:26:39'
}
TextMorphForEditView>>drawOnAthensCanvas: anAthensCanvas [
	self useSelectionBar
		ifTrue: [self paragraph displaySelectionBarOnAthensCanvas: anAthensCanvas].
	self useExtraSelection 
		ifTrue: [self paragraph displayExtraSelectionOnAthensCanvas: anAthensCanvas].
	super drawOnAthensCanvas: anAthensCanvas.

]
